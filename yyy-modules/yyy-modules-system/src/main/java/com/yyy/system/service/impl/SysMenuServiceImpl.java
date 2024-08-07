package com.yyy.system.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yyy.system.api.vo.SysUserVO;
import com.yyy.system.domain.SysMenu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yyy.common.core.constant.Constants;
import com.yyy.common.core.constant.UserConstants;
import com.yyy.common.core.utils.StringUtils;
import com.yyy.common.security.utils.SecurityUtils;
import com.yyy.system.api.vo.SysRoleVO;

import com.yyy.system.vo.SysMenuVO;
import com.yyy.system.vo.MetaVo;
import com.yyy.system.vo.RouterVo;
import com.yyy.system.vo.TreeSelect;
import com.yyy.system.mapper.SysMenuMapper;
import com.yyy.system.mapper.SysRoleMapper;
import com.yyy.system.mapper.SysRoleMenuMapper;
import com.yyy.system.service.ISysMenuService;

/**
 * 菜单 业务层处理
 * 
* @author 羊扬杨
 */
@Service
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements ISysMenuService
{
    public static final String PREMISSION_STRING = "perms[\"{0}\"]";

    @Autowired
    private SysMenuMapper menuMapper;

    @Autowired
    private SysRoleMapper roleMapper;

    @Autowired
    private SysRoleMenuMapper roleMenuMapper;

    /**
     * 根据用户查询系统菜单列表
     * 
     * @param userId 用户ID
     * @return 菜单列表
     */
    @Override
    public List<SysMenuVO> selectMenuList(Long userId)
    {
        return selectMenuList(new SysMenuVO(), userId);
    }

    /**
     * 查询系统菜单列表
     * 
     * @param menu 菜单信息
     * @return 菜单列表
     */
    @Override
    public List<SysMenuVO> selectMenuList(SysMenuVO menu, Long userId)
    {
        List<SysMenuVO> menuList = null;
        // 管理员显示所有菜单信息
        if (SysUserVO.isAdmin(userId))
        {
            menuList = menuMapper.selectMenuList(menu);
        }
        else
        {
            menu.getParams().put("userId", userId);
            menuList = menuMapper.selectMenuListByUserId(menu);
        }
        return menuList;
    }

    /**
     * 根据用户ID查询权限
     * 
     * @param userId 用户ID
     * @return 权限列表
     */
    @Override
    public Set<String> selectMenuPermsByUserId(Long userId)
    {
        List<String> perms = menuMapper.selectMenuPermsByUserId(userId);
        Set<String> permsSet = new HashSet<>();
        for (String perm : perms)
        {
            if (StringUtils.isNotEmpty(perm))
            {
                permsSet.addAll(Arrays.asList(perm.trim().split(",")));
            }
        }
        return permsSet;
    }

    /**
     * 根据角色ID查询权限
     * 
     * @param roleId 角色ID
     * @return 权限列表
     */
    @Override
    public Set<String> selectMenuPermsByRoleId(Long roleId)
    {
        List<String> perms = menuMapper.selectMenuPermsByRoleId(roleId);
        Set<String> permsSet = new HashSet<>();
        for (String perm : perms)
        {
            if (StringUtils.isNotEmpty(perm))
            {
                permsSet.addAll(Arrays.asList(perm.trim().split(",")));
            }
        }
        return permsSet;
    }

    /**
     * 根据用户ID查询菜单
     * 
     * @param userId 用户名称
     * @return 菜单列表
     */
    @Override
    public List<SysMenuVO> selectMenuTreeByUserId(Long userId)
    {
        List<SysMenuVO> menus = null;
        if (SecurityUtils.isAdmin(userId))
        {
            menus = menuMapper.selectMenuTreeAll();
        }
        else
        {
            menus = menuMapper.selectMenuTreeByUserId(userId);
        }
        return getChildPerms(menus, 0);
    }

    /**
     * 根据角色ID查询菜单树信息
     * 
     * @param roleId 角色ID
     * @return 选中菜单列表
     */
    @Override
    public List<Long> selectMenuListByRoleId(Long roleId)
    {
        SysRoleVO role = roleMapper.selectRoleById(roleId);
        return menuMapper.selectMenuListByRoleId(roleId, role.isMenuCheckStrictly());
    }

    /**
     * 构建前端路由所需要的菜单
     * 
     * @param menus 菜单列表
     * @return 路由列表
     */
    @Override
    public List<RouterVo> buildMenus(List<SysMenuVO> menus)
    {
        List<RouterVo> routers = new LinkedList<RouterVo>();
        for (SysMenuVO menu : menus)
        {
            RouterVo router = new RouterVo();
            router.setHidden("1".equals(menu.getVisible()));
            router.setName(getRouteName(menu));
            router.setPath(getRouterPath(menu));
            router.setComponent(getComponent(menu));
            router.setQuery(menu.getQuery());
            router.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon(), StringUtils.equals("1", menu.getIsCache()), menu.getPath()));
            List<SysMenuVO> cMenus = menu.getChildren();
            //如果SysMenuVO有子菜单并且类型为目录（TYPE_DIR），则设置alwaysShow为true，redirect为"noRedirect"，并递归调用此方法处理子菜单。
            //设置 alwaysShow 为 true。
            //设置 redirect 为 "noRedirect"。
            //递归调用 buildMenus 方法处理子菜单，并将结果赋值给 RouterVo 的 children 属性。
            if (!cMenus.isEmpty() && cMenus.size() > 0 && UserConstants.TYPE_DIR.equals(menu.getMenuType()))
            {
                router.setAlwaysShow(true);
                router.setRedirect("noRedirect");
                router.setChildren(buildMenus(cMenus));
            }
            //如果菜单是一个外部框架（通过isMenuFrame()判断），则创建一个子路由并添加到当前路由中
            //清空 RouterVo 的 meta 属性。
            //创建一个子路由，并设置其 path、component、name 和 meta 属性。
            //将子路由添加到 RouterVo 的 children 属性。
            else if (isMenuFrame(menu))
            {
                router.setMeta(null);
                List<RouterVo> childrenList = new ArrayList<RouterVo>();
                RouterVo children = new RouterVo();
                children.setPath(menu.getPath());
                children.setComponent(menu.getComponent());
                children.setName(StringUtils.capitalize(menu.getPath()));
                children.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon(), StringUtils.equals("1", menu.getIsCache()), menu.getPath()));
                children.setQuery(menu.getQuery());
                childrenList.add(children);
                router.setChildren(childrenList);
            }
            //如果菜单是一个内部链接且其父ID为0，则创建一个特殊的内部链接路由
            //设置 RouterVo 的 meta 属性。
            //设置 path 为 /。
            //创建一个子路由，并设置其 path、component、name 和 meta 属性。
            //将子路由添加到 RouterVo 的 children 属性。
            else if (menu.getParentId().intValue() == 0 && isInnerLink(menu))
            {
                router.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon()));
                router.setPath("/");
                List<RouterVo> childrenList = new ArrayList<RouterVo>();
                RouterVo children = new RouterVo();
                String routerPath = innerLinkReplaceEach(menu.getPath());
                children.setPath(routerPath);
                children.setComponent(UserConstants.INNER_LINK);
                children.setName(StringUtils.capitalize(routerPath));
                children.setMeta(new MetaVo(menu.getMenuName(), menu.getIcon(), menu.getPath()));
                childrenList.add(children);
                router.setChildren(childrenList);
            }
            routers.add(router);
        }
        return routers;
    }

    /**
     * 构建前端所需要树结构
     * 
     * @param menus 菜单列表
     * @return 树结构列表
     */
    @Override
    public List<SysMenuVO> buildMenuTree(List<SysMenuVO> menus)
    {
        List<SysMenuVO> returnList = new ArrayList<SysMenuVO>();
        List<Long> tempList = menus.stream().map(SysMenuVO::getMenuId).collect(Collectors.toList());
        for (Iterator<SysMenuVO> iterator = menus.iterator(); iterator.hasNext();)
        {
            SysMenuVO menu = (SysMenuVO) iterator.next();
            // 如果是顶级节点, 遍历该父节点的所有子节点
            if (!tempList.contains(menu.getParentId()))
            {
                recursionFn(menus, menu);
                returnList.add(menu);
            }
        }
        if (returnList.isEmpty())
        {
            returnList = menus;
        }
        return returnList;
    }

    /**
     * 构建前端所需要下拉树结构
     * 
     * @param menus 菜单列表
     * @return 下拉树结构列表
     */
    @Override
    public List<TreeSelect> buildMenuTreeSelect(List<SysMenuVO> menus)
    {
        List<SysMenuVO> menuTrees = buildMenuTree(menus);
        return menuTrees.stream().map(TreeSelect::new).collect(Collectors.toList());
    }

    /**
     * 根据菜单ID查询信息
     * 
     * @param menuId 菜单ID
     * @return 菜单信息
     */
    @Override
    public SysMenuVO selectMenuById(Long menuId)
    {
        return menuMapper.selectMenuById(menuId);
    }

    /**
     * 是否存在菜单子节点
     * 
     * @param menuId 菜单ID
     * @return 结果
     */
    @Override
    public boolean hasChildByMenuId(Long menuId)
    {
        int result = menuMapper.hasChildByMenuId(menuId);
        return result > 0;
    }

    /**
     * 查询菜单使用数量
     * 
     * @param menuId 菜单ID
     * @return 结果
     */
    @Override
    public boolean checkMenuExistRole(Long menuId)
    {
        int result = roleMenuMapper.checkMenuExistRole(menuId);
        return result > 0;
    }

    /**
     * 新增保存菜单信息
     * 
     * @param menu 菜单信息
     * @return 结果
     */
    @Override
    public int insertMenu(SysMenuVO menu)
    {
        return menuMapper.insertMenu(menu);
    }

    /**
     * 修改保存菜单信息
     * 
     * @param menu 菜单信息
     * @return 结果
     */
    @Override
    public int updateMenu(SysMenuVO menu)
    {
        return menuMapper.updateMenu(menu);
    }

    /**
     * 删除菜单管理信息
     * 
     * @param menuId 菜单ID
     * @return 结果
     */
    @Override
    public int deleteMenuById(Long menuId)
    {
        return menuMapper.deleteMenuById(menuId);
    }

    /**
     * 校验菜单名称是否唯一
     * 
     * @param menu 菜单信息
     * @return 结果
     */
    @Override
    public String checkMenuNameUnique(SysMenuVO menu)
    {
        Long menuId = StringUtils.isNull(menu.getMenuId()) ? -1L : menu.getMenuId();
        SysMenuVO info = menuMapper.checkMenuNameUnique(menu.getMenuName(), menu.getParentId());
        if (StringUtils.isNotNull(info) && info.getMenuId().longValue() != menuId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 获取路由名称
     * 
     * @param menu 菜单信息
     * @return 路由名称
     */
    public String getRouteName(SysMenuVO menu)
    {
        String routerName = StringUtils.capitalize(menu.getPath());
        // 非外链并且是一级目录（类型为目录）
        if (isMenuFrame(menu))
        {
            routerName = StringUtils.EMPTY;
        }
        return routerName;
    }

    /**
     * 获取路由地址
     * 
     * @param menu 菜单信息
     * @return 路由地址
     */
    public String getRouterPath(SysMenuVO menu)
    {
        String routerPath = menu.getPath();
        // 内链打开外网方式
        if (menu.getParentId().intValue() != 0 && isInnerLink(menu))
        {
            routerPath = innerLinkReplaceEach(routerPath);
        }
        // 非外链并且是一级目录（类型为目录）
        if (0 == menu.getParentId().intValue() && UserConstants.TYPE_DIR.equals(menu.getMenuType())
                && UserConstants.NO_FRAME.equals(menu.getIsFrame()))
        {
            routerPath = "/" + menu.getPath();
        }
        // 非外链并且是一级目录（类型为菜单）
        else if (isMenuFrame(menu))
        {
            routerPath = "/";
        }
        return routerPath;
    }

    /**
     * 获取组件信息
     * 
     * @param menu 菜单信息
     * @return 组件信息
     */
    public String getComponent(SysMenuVO menu)
    {
        String component = UserConstants.LAYOUT;
        if (StringUtils.isNotEmpty(menu.getComponent()) && !isMenuFrame(menu))
        {
            component = menu.getComponent();
        }
        else if (StringUtils.isEmpty(menu.getComponent()) && menu.getParentId().intValue() != 0 && isInnerLink(menu))
        {
            component = UserConstants.INNER_LINK;
        }
        else if (StringUtils.isEmpty(menu.getComponent()) && isParentView(menu))
        {
            component = UserConstants.PARENT_VIEW;
        }
        return component;
    }

    /**
     * 是否为菜单内部跳转
     * 
     * @param menu 菜单信息
     * @return 结果
     */
    public boolean isMenuFrame(SysMenuVO menu)
    {
        return menu.getParentId().intValue() == 0 && UserConstants.TYPE_MENU.equals(menu.getMenuType())
                && menu.getIsFrame().equals(UserConstants.NO_FRAME);
    }
    /**
     * menu.getParentId().intValue() == 0：检查菜单项的父ID是否为0。如果是，这意味着这是一个顶级菜单项。
     * UserConstants.TYPE_MENU.equals(menu.getMenuType())：检查菜单项的类型是否为 TYPE_MENU。如果类型匹配，这意味着这是一个菜单项而非目录。
     * menu.getIsFrame().equals(UserConstants.NO_FRAME)：检查菜单项的 isFrame 属性是否为 NO_FRAME。如果等于 NO_FRAME，这意味着这不是一个外部框架链接。
     * 如果这三个条件都满足，则认为这是一个内部跳转的菜单项，方法返回 true；否则返回 false。
     */

    /**
     * 是否为内链组件
     * 
     * @param menu 菜单信息
     * @return 结果
     */
    public boolean isInnerLink(SysMenuVO menu)
    {
        return menu.getIsFrame().equals(UserConstants.NO_FRAME) && StringUtils.ishttp(menu.getPath());
    }
    /**
     * menu.getIsFrame().equals(UserConstants.NO_FRAME)：检查菜单项的 isFrame 属性是否为 NO_FRAME。如果等于 NO_FRAME，这意味着这不是一个外部框架链接。
     * StringUtils.ishttp(menu.getPath())：检查菜单项的 path 属性是否是一个有效的 HTTP URL。如果是一个有效的 HTTP URL，则这通常意味着这是一个指向外部资源的链接。
     * 如果这两个条件都满足，则认为这是一个内部链接组件，方法返回 true；否则返回 false。
     */

    /**
     * 是否为parent_view组件
     * 
     * @param menu 菜单信息
     * @return 结果
     */
    public boolean isParentView(SysMenuVO menu)
    {
        return menu.getParentId().intValue() != 0 && UserConstants.TYPE_DIR.equals(menu.getMenuType());
    }

    /**
     * 根据父节点的ID获取所有子节点
     * 
     * @param list 分类表
     * @param parentId 传入的父节点ID
     * @return String
     */
    public List<SysMenuVO> getChildPerms(List<SysMenuVO> list, int parentId)
    {
        List<SysMenuVO> returnList = new ArrayList<SysMenuVO>();
        for (Iterator<SysMenuVO> iterator = list.iterator(); iterator.hasNext();)
        {
            SysMenuVO t = (SysMenuVO) iterator.next();
            // 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
            if (t.getParentId() == parentId)
            {
                recursionFn(list, t);
                returnList.add(t);
            }
        }
        return returnList;
    }

    /**
     * 递归列表
     * 
     * @param list
     * @param t
     */
    private void recursionFn(List<SysMenuVO> list, SysMenuVO t)
    {
        // 得到子节点列表
        List<SysMenuVO> childList = getChildList(list, t);
        t.setChildren(childList);
        for (SysMenuVO tChild : childList)
        {
            if (hasChild(list, tChild))
            {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<SysMenuVO> getChildList(List<SysMenuVO> list, SysMenuVO t)
    {
        List<SysMenuVO> tlist = new ArrayList<SysMenuVO>();
        Iterator<SysMenuVO> it = list.iterator();
        while (it.hasNext())
        {
            SysMenuVO n = (SysMenuVO) it.next();
            if (n.getParentId().longValue() == t.getMenuId().longValue())
            {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<SysMenuVO> list, SysMenuVO t)
    {
        return getChildList(list, t).size() > 0;
    }

    /**
     * 内链域名特殊字符替换
     * 
     * @return
     */
    public String innerLinkReplaceEach(String path)
    {
        return StringUtils.replaceEach(path, new String[] { Constants.HTTP, Constants.HTTPS, Constants.WWW, "." },
                new String[] { "", "", "", "/" });
    }


    @Override
    public List<SysMenu> getAllTree(Long parentId) {
        //数据查询
        List<SysMenu> list = baseMapper.selectList(new QueryWrapper());
        //新建一个用于接收数据的list
        List<SysMenu> resultList = new ArrayList<>();
        for (SysMenu result : list) {
            if (result.getParentId() == parentId) {
                //调用方法给子类添加数据
                resultList.add(getMenuTree(result, list));
            }
        }
        return resultList;
    }

    private SysMenu getMenuTree(SysMenu result, List<SysMenu> list) {
        for (SysMenu sysMenu : list) {
            //如果父类主键等于传过来实体类的ID
            if (sysMenu.getParentId().equals(result.getMenuId())) {
                if (result.getChildren() == null) {
                    result.setChildren(new ArrayList<>());
                }
                // 递归调用
                result.getChildren().add(getMenuTree(sysMenu, list));
            }
        }
        return result;
    }


}
