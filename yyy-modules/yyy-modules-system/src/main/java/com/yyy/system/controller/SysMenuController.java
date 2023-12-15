package com.yyy.system.controller;

import java.util.*;
import java.util.stream.Collectors;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.yyy.common.core.annotation.CountTime;
import com.yyy.common.core.domain.R;
import com.yyy.system.domain.SysMenu;
import com.yyy.system.mapper.SysMenuMapper;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.yyy.common.core.constant.UserConstants;
import com.yyy.common.core.utils.StringUtils;
import com.yyy.common.core.web.controller.BaseController;
import com.yyy.common.core.web.domain.AjaxResult;
import com.yyy.common.log.annotation.Log;
import com.yyy.common.log.enums.BusinessType;
import com.yyy.common.security.annotation.RequiresPermissions;
import com.yyy.common.security.utils.SecurityUtils;
import com.yyy.system.vo.SysMenuVO;
import com.yyy.system.service.ISysMenuService;

/**
 * 菜单信息
 * 
* @author 羊扬杨
 */
@RestController
@RequestMapping("/menu")
public class SysMenuController extends BaseController
{
    @Autowired
    private ISysMenuService menuService;
    @Autowired
    private SysMenuMapper sysMenuMapper;


    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    @CountTime
    @GetMapping("/treeFindPath")
    public R treeFindPath(){
        List<SysMenu> menuAll = menuService.getAllTree(0l);
        ArrayList<Long> arrayList = new ArrayList<>();
        List<Long>  menuRoot = treeFindPath(menuAll, 1060l,arrayList);
        return R.ok(menuRoot,"根据子节点获取根节点");
    }

    private List<Long> treeFindPath (List<SysMenu> tree, Long menuId, List<Long> path) {
        if (tree == null) return path;
        for (SysMenu data : tree) {

            // 这里按照你的需求来存放最后返回的内容吧
            path.add(data.getMenuId());
            System.out.println(data.getMenuName()+"~~~~~~~~~~~~~~~");
            if (menuId.equals(data.getMenuId())) {
                return path;
            }

            if (data.getChildren()!=null) {
                List<Long> result = treeFindPath(data.getChildren(), menuId, path);
                if (result.size()>0 && result.contains(menuId)) {
                    System.out.println(result.toString());
                    return result;
                }
            }
            path.remove(data.getMenuId());
        }
        return path;
    }




    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    @CountTime
    @GetMapping("/treeOrgParent")
    @ApiOperation(value="向上查询所有上级", notes="递归遍历获取指定菜单的所有父节点")
    public R treeOrgParent(){
        List<SysMenu> menuAll = sysMenuMapper.selectList(null); // 所有部门集合

        List<Long>  menuRoot = treeOrgParent(1006l, menuAll);
        return R.ok(menuRoot,"根据子节点获取根节点");
    }
    /**
     * 递归遍历获取指定菜单的所有父节点
     *
     * @param trees        当前菜单
     * @param treeId 子菜单ID
     */
    public List<Long> treeOrgParent(Long treeId, List<SysMenu> trees) {
        //递归获取父级ids,包含自己
        List<Long> parentIds = new ArrayList<>();
        //先查询treeId 是否存在数据库中
        //添加自己
        parentIds.add(treeId);

        //模拟修改值-只修改子节点的根节点
//        SysMenu sysMenu = new SysMenu();
//        sysMenu.setUpdateTime(new Date());
//        UpdateWrapper<SysMenu> menuUpdateWrapper = new UpdateWrapper<>();
//        menuUpdateWrapper.eq("menu_id", treeId);
//        sysMenuMapper.update(sysMenu, menuUpdateWrapper);

        this.treeOrgParent(trees, treeId, parentIds);
        return parentIds;
    }

    /**
     * 递归获取父级ids
     * @param trees
     * @param treeId
     * @param parentIds
     */
    public void treeOrgParent(List<SysMenu> trees, Long treeId, List<Long> parentIds) {
        for (SysMenu tree : trees) {
            if (tree.getParentId()==0) {
                continue;
            }
            //判断是否有父节点
            if (treeId.equals(tree.getMenuId())) {
                parentIds.add(tree.getParentId());

                //模拟修改值-只修改子节点的根节点
//                SysMenu sysMenu = new SysMenu();
//                sysMenu.setUpdateTime(new Date());
//                UpdateWrapper<SysMenu> menuUpdateWrapper = new UpdateWrapper<>();
//                menuUpdateWrapper.eq("menu_id", tree.getParentId());
//                sysMenuMapper.update(sysMenu, menuUpdateWrapper);

                treeOrgParent(trees, tree.getParentId(), parentIds);
            }
        }
    }


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    @CountTime
    @GetMapping("/getMenuUpList")
    @ApiOperation(value="向上查询所有上级", notes="递归至上层节点为 null 返回入参的子节点数据为根节点")
    public R getMenuUpTree(){
        List<SysMenu> menuAll = sysMenuMapper.selectList(null); // 所有部门集合
        SysMenu leafNodeMenu = new SysMenu();
        //注意必须是存在的，
        leafNodeMenu.setMenuId(1018l);
        leafNodeMenu.setParentId(103l);

        ArrayList<SysMenu> list = new ArrayList<>();
        //先查询menuId 是否存在数据库中
        //模拟修改值  先修改自己
        list.add(leafNodeMenu);
        List<SysMenu> menuUpTree = getMenuUpList(menuAll, leafNodeMenu,list);
        return R.ok(menuUpTree,"根据子节点查出的所有上级");
    }

    /**
     * 向上查询所有上级
     * @param menuAll 所有集合
     * @param leafNodeMenu 叶子节点
     */
    public  List<SysMenu> getMenuUpList(List<SysMenu> menuAll, SysMenu leafNodeMenu,ArrayList<SysMenu> list){
        if(ObjectUtil.isNotEmpty(leafNodeMenu)){
//            List<SysMenu> list = new ArrayList<>();


            Long parentId = leafNodeMenu.getParentId();
            List<SysMenu> parentMenus = menuAll.stream().filter(item -> item.getMenuId().equals(parentId)).collect(Collectors.toList());
            if(CollectionUtil.isNotEmpty(parentMenus)){
                SysMenu parentMenu = parentMenus.get(0);
                System.out.println(parentMenu.getMenuId()+"  "+parentMenu.getParentId());

                //模拟修改值-修改子节点的向上的所有上级
//                SysMenu sysMenu = new SysMenu();
//                sysMenu.setUpdateTime(new Date());
//                UpdateWrapper<SysMenu> menuUpdateWrapper = new UpdateWrapper<>();
//                menuUpdateWrapper.eq("menu_id", parentMenu.getMenuId());
//                sysMenuMapper.update(sysMenu, menuUpdateWrapper);

                list.add(parentMenu);
                List<SysMenu> menuUpTree = getMenuUpList(menuAll, parentMenu,list);
//                if(menuUpTree!=null){
//                    list.add(menuUpTree);
//                }
                return list;
            }
        }
        return null;
    }




    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    @GetMapping("/getMaximumParent")
    @ApiOperation(value="根据子节点获取最上层节点", notes="根据根节点的parentId==0进行判断递归")
    public R getMaximumParent(){
        List<SysMenu> menuAll = sysMenuMapper.selectList(null); // 所有部门集合
        SysMenu leafNodeMenu = new SysMenu();
        leafNodeMenu.setMenuId(1005l);
        leafNodeMenu.setParentId(100l);
        SysMenu menuRoot = getMaximumParent(menuAll, leafNodeMenu);
        return R.ok(menuRoot,"根据子节点获取根节点");
    }


    /**
     * 根据子节点获取最上层节点
     * @param menuAll 所有菜单集合
     * @param menuChild 子节点
     * @return
     */
    public  SysMenu getMaximumParent(List<SysMenu> menuAll, SysMenu menuChild){
        SysMenu menu = null;
        Long parentId = menuChild.getParentId();
        if(parentId==0){
            menu = menuChild;

            //模拟修改值-只修改子节点的根节点
            SysMenu sysMenu = new SysMenu();
            sysMenu.setUpdateTime(new Date());
            UpdateWrapper<SysMenu> menuUpdateWrapper = new UpdateWrapper<>();
            menuUpdateWrapper.eq("menu_id", menuChild.getMenuId());
            sysMenuMapper.update(sysMenu, menuUpdateWrapper);
        }else {
            List<SysMenu> parent = menuAll.stream().filter(item -> item.getMenuId()==parentId).collect(Collectors.toList());

           if (CollectionUtil.isNotEmpty(parent)){
               SysMenu maximumParent = getMaximumParent(menuAll, parent.get(0));
               menu = maximumParent;
           }
        }
        return menu;
    }

    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



    /**
     * 菜单树形查询
     * @param parentId
     * @return
     */
    @GetMapping("/getAllTree")
    @ApiOperation(value="菜单树形查询", notes="菜单树形查询")
    public List<SysMenu> getAllTree(@RequestParam Long parentId) {
        return menuService.getAllTree(parentId);
    }



    /**
     * 获取菜单列表
     */
    @RequiresPermissions("system:menu:list")
    @GetMapping("/list")
    public AjaxResult list(SysMenuVO menu)
    {
        Long userId = SecurityUtils.getUserId();
        List<SysMenuVO> menus = menuService.selectMenuList(menu, userId);
        return success(menus);
    }

    /**
     * 根据菜单编号获取详细信息
     */
    @RequiresPermissions("system:menu:query")
    @GetMapping(value = "/{menuId}")
    public AjaxResult getInfo(@PathVariable Long menuId)
    {
        return success(menuService.selectMenuById(menuId));
    }

    /**
     * 获取菜单下拉树列表
     */
    @GetMapping("/treeselect")
    public AjaxResult treeselect(SysMenuVO menu)
    {
        Long userId = SecurityUtils.getUserId();
        List<SysMenuVO> menus = menuService.selectMenuList(menu, userId);
        return success(menuService.buildMenuTreeSelect(menus));
    }

    /**
     * 加载对应角色菜单列表树
     */
    @GetMapping(value = "/roleMenuTreeselect/{roleId}")
    public AjaxResult roleMenuTreeselect(@PathVariable("roleId") Long roleId)
    {
        Long userId = SecurityUtils.getUserId();
        List<SysMenuVO> menus = menuService.selectMenuList(userId);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("checkedKeys", menuService.selectMenuListByRoleId(roleId));
        ajax.put("menus", menuService.buildMenuTreeSelect(menus));
        return ajax;
    }

    /**
     * 新增菜单
     */
    @RequiresPermissions("system:menu:add")
    @Log(title = "菜单管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysMenuVO menu)
    {
        if (UserConstants.NOT_UNIQUE.equals(menuService.checkMenuNameUnique(menu)))
        {
            return error("新增菜单'" + menu.getMenuName() + "'失败，菜单名称已存在");
        }
        else if (UserConstants.YES_FRAME.equals(menu.getIsFrame()) && !StringUtils.ishttp(menu.getPath()))
        {
            return error("新增菜单'" + menu.getMenuName() + "'失败，地址必须以http(s)://开头");
        }
        menu.setCreateBy(SecurityUtils.getUsername());
        return toAjax(menuService.insertMenu(menu));
    }

    /**
     * 修改菜单
     */
    @RequiresPermissions("system:menu:edit")
    @Log(title = "菜单管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysMenuVO menu)
    {
        if (UserConstants.NOT_UNIQUE.equals(menuService.checkMenuNameUnique(menu)))
        {
            return error("修改菜单'" + menu.getMenuName() + "'失败，菜单名称已存在");
        }
        else if (UserConstants.YES_FRAME.equals(menu.getIsFrame()) && !StringUtils.ishttp(menu.getPath()))
        {
            return error("修改菜单'" + menu.getMenuName() + "'失败，地址必须以http(s)://开头");
        }
        else if (menu.getMenuId().equals(menu.getParentId()))
        {
            return error("修改菜单'" + menu.getMenuName() + "'失败，上级菜单不能选择自己");
        }
        menu.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(menuService.updateMenu(menu));
    }

    /**
     * 删除菜单
     */
    @RequiresPermissions("system:menu:remove")
    @Log(title = "菜单管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{menuId}")
    public AjaxResult remove(@PathVariable("menuId") Long menuId)
    {
        if (menuService.hasChildByMenuId(menuId))
        {
            return warn("存在子菜单,不允许删除");
        }
        if (menuService.checkMenuExistRole(menuId))
        {
            return warn("菜单已分配,不允许删除");
        }
        return toAjax(menuService.deleteMenuById(menuId));
    }

    /**
     * 获取路由信息
     * 
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters()
    {
        Long userId = SecurityUtils.getUserId();
        List<SysMenuVO> menus = menuService.selectMenuTreeByUserId(userId);
        return success(menuService.buildMenus(menus));
    }
}