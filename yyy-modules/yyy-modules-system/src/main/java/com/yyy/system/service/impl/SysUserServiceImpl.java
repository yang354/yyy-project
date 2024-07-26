package com.yyy.system.service.impl;

import java.io.*;
import java.util.*;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import javax.validation.Validator;

import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yyy.common.core.exception.GlobalException;
import com.yyy.common.core.utils.excel.ExcelUtils;
import com.yyy.system.domain.SysUser;
import com.yyy.system.api.vo.SysUserVO;
import com.yyy.system.dto.AnalysisExcelResultDTO;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import com.yyy.common.core.constant.UserConstants;
import com.yyy.common.core.exception.ServiceException;
import com.yyy.common.core.utils.SpringUtils;
import com.yyy.common.core.utils.StringUtils;
import com.yyy.common.core.utils.bean.BeanValidators;
import com.yyy.common.datascope.annotation.DataScope;
import com.yyy.common.security.utils.SecurityUtils;
import com.yyy.system.api.vo.SysRoleVO;
import com.yyy.system.vo.SysPostVO;
import com.yyy.system.domain.SysUserPost;
import com.yyy.system.domain.SysUserRole;
import com.yyy.system.mapper.SysPostMapper;
import com.yyy.system.mapper.SysRoleMapper;
import com.yyy.system.mapper.SysUserMapper;
import com.yyy.system.mapper.SysUserPostMapper;
import com.yyy.system.mapper.SysUserRoleMapper;
import com.yyy.system.service.ISysConfigService;
import com.yyy.system.service.ISysUserService;
import org.springframework.web.multipart.MultipartFile;

/**
 * 用户 业务层处理
 *
* @author 羊扬杨
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService
{
    private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);

    @Autowired
    private SysUserMapper userMapper;

    @Autowired
    private SysRoleMapper roleMapper;

    @Autowired
    private SysPostMapper postMapper;

    @Autowired
    private SysUserRoleMapper userRoleMapper;

    @Autowired
    private SysUserPostMapper userPostMapper;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    protected Validator validator;

    @Value("${export.exportUserFaile}")
    private String exportUerFailePath;


    /**
     * 根据条件分页查询用户列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    @Override
    @DataScope(deptAlias = "d", userAlias = "u")
    public List<SysUserVO> selectUserList(SysUserVO user)
    {
        return userMapper.selectUserList(user);
    }

    /**
     * 根据条件分页查询已分配用户角色列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    @Override
    @DataScope(deptAlias = "d", userAlias = "u")
    public List<SysUserVO> selectAllocatedList(SysUserVO user)
    {
        return userMapper.selectAllocatedList(user);
    }

    /**
     * 根据条件分页查询未分配用户角色列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    @Override
    @DataScope(deptAlias = "d", userAlias = "u")
    public List<SysUserVO> selectUnallocatedList(SysUserVO user)
    {
        return userMapper.selectUnallocatedList(user);
    }

    /**
     * 通过用户名查询用户
     *
     * @param userName 用户名
     * @return 用户对象信息
     */
    @Override
    public SysUserVO selectUserByUserName(String userName)
    {
        return userMapper.selectUserByUserName(userName);
    }

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    @Override
    public SysUserVO selectUserById(Long userId)
    {
        return userMapper.selectUserById(userId);
    }

    /**
     * 查询用户所属角色组
     *
     * @param userName 用户名
     * @return 结果
     */
    @Override
    public String selectUserRoleGroup(String userName)
    {
        List<SysRoleVO> list = roleMapper.selectRolesByUserName(userName);
        if (CollectionUtils.isEmpty(list))
        {
            return StringUtils.EMPTY;
        }
        return list.stream().map(SysRoleVO::getRoleName).collect(Collectors.joining(","));
    }

    /**
     * 查询用户所属岗位组
     *
     * @param userName 用户名
     * @return 结果
     */
    @Override
    public String selectUserPostGroup(String userName)
    {
        List<SysPostVO> list = postMapper.selectPostsByUserName(userName);
        if (CollectionUtils.isEmpty(list))
        {
            return StringUtils.EMPTY;
        }
        return list.stream().map(SysPostVO::getPostName).collect(Collectors.joining(","));
    }

    /**
     * 校验用户名称是否唯一
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public String checkUserNameUnique(SysUserVO user)
    {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
        SysUserVO info = userMapper.checkUserNameUnique(user.getUserName());
        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 校验手机号码是否唯一
     *
     * @param user 用户信息
     * @return
     */
    @Override
    public String checkPhoneUnique(SysUserVO user)
    {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
        SysUserVO info = userMapper.checkPhoneUnique(user.getPhonenumber());
        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 校验email是否唯一
     *
     * @param user 用户信息
     * @return
     */
    @Override
    public String checkEmailUnique(SysUserVO user)
    {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
        SysUserVO info = userMapper.checkEmailUnique(user.getEmail());
        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 校验用户是否允许操作
     *
     * @param user 用户信息
     */
    @Override
    public void checkUserAllowed(SysUserVO user)
    {
        if (StringUtils.isNotNull(user.getUserId()) && user.isAdmin())
        {
            throw new ServiceException("不允许操作超级管理员用户");
        }
    }

    /**
     * 校验用户是否有数据权限
     *
     * @param userId 用户id
     */
    @Override
    public void checkUserDataScope(Long userId)
    {
        if (!SysUserVO.isAdmin(SecurityUtils.getUserId()))
        {
            SysUserVO user = new SysUserVO();
            user.setUserId(userId);
            List<SysUserVO> users = SpringUtils.getAopProxy(this).selectUserList(user);
            if (StringUtils.isEmpty(users))
            {
                throw new ServiceException("没有权限访问用户数据！");
            }
        }
    }

    /**
     * 新增保存用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertUser(SysUserVO user)
    {
        // 新增用户信息
        int rows = userMapper.insertUser(user);
        // 新增用户岗位关联
        insertUserPost(user);
        // 新增用户与角色管理
        insertUserRole(user);
        return rows;
    }

    /**
     * 注册用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public boolean registerUser(SysUserVO user)
    {
        return userMapper.insertUser(user) > 0;
    }

    /**
     * 修改保存用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateUser(SysUserVO user)
    {
        Long userId = user.getUserId();
        // 删除用户与角色关联
        userRoleMapper.deleteUserRoleByUserId(userId);
        // 新增用户与角色管理
        insertUserRole(user);
        // 删除用户与岗位关联
        userPostMapper.deleteUserPostByUserId(userId);
        // 新增用户与岗位管理
        insertUserPost(user);
        return userMapper.updateUser(user);
    }

    /**
     * 用户授权角色
     *
     * @param userId 用户ID
     * @param roleIds 角色组
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void insertUserAuth(Long userId, Long[] roleIds)
    {
        userRoleMapper.deleteUserRoleByUserId(userId);
        insertUserRole(userId, roleIds);
    }

    /**
     * 修改用户状态
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public int updateUserStatus(SysUserVO user)
    {
        return userMapper.updateUser(user);
    }

    /**
     * 修改用户基本信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public int updateUserProfile(SysUserVO user)
    {
        return userMapper.updateUser(user);
    }

    /**
     * 修改用户头像
     *
     * @param userName 用户名
     * @param avatar 头像地址
     * @return 结果
     */
    @Override
    public boolean updateUserAvatar(String userName, String avatar)
    {
        return userMapper.updateUserAvatar(userName, avatar) > 0;
    }

    /**
     * 重置用户密码
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public int resetPwd(SysUserVO user)
    {
        return userMapper.updateUser(user);
    }

    /**
     * 重置用户密码
     *
     * @param userName 用户名
     * @param password 密码
     * @return 结果
     */
    @Override
    public int resetUserPwd(String userName, String password)
    {
        return userMapper.resetUserPwd(userName, password);
    }

    /**
     * 新增用户角色信息
     *
     * @param user 用户对象
     */
    public void insertUserRole(SysUserVO user)
    {
        this.insertUserRole(user.getUserId(), user.getRoleIds());
    }

    /**
     * 新增用户岗位信息
     *
     * @param user 用户对象
     */
    public void insertUserPost(SysUserVO user)
    {
        Long[] posts = user.getPostIds();
        if (StringUtils.isNotEmpty(posts))
        {
            // 新增用户与岗位管理
            List<SysUserPost> list = new ArrayList<SysUserPost>();
            for (Long postId : posts)
            {
                SysUserPost up = new SysUserPost();
                up.setUserId(user.getUserId());
                up.setPostId(postId);
                list.add(up);
            }
            userPostMapper.batchUserPost(list);
        }
    }

    /**
     * 新增用户角色信息
     *
     * @param userId 用户ID
     * @param roleIds 角色组
     */
    public void insertUserRole(Long userId, Long[] roleIds)
    {
        if (StringUtils.isNotEmpty(roleIds))
        {
            // 新增用户与角色管理
            List<SysUserRole> list = new ArrayList<SysUserRole>();
            for (Long roleId : roleIds)
            {
                SysUserRole ur = new SysUserRole();
                ur.setUserId(userId);
                ur.setRoleId(roleId);
                list.add(ur);
            }
            userRoleMapper.batchUserRole(list);
        }
    }

    /**
     * 通过用户ID删除用户
     *
     * @param userId 用户ID
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteUserById(Long userId)
    {
        // 删除用户与角色关联
        userRoleMapper.deleteUserRoleByUserId(userId);
        // 删除用户与岗位表
        userPostMapper.deleteUserPostByUserId(userId);
        return userMapper.deleteUserById(userId);
    }

    /**
     * 批量删除用户信息
     *
     * @param userIds 需要删除的用户ID
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteUserByIds(Long[] userIds)
    {
        for (Long userId : userIds)
        {
            checkUserAllowed(new SysUserVO(userId));
            checkUserDataScope(userId);
        }
        // 删除用户与角色关联
        userRoleMapper.deleteUserRole(userIds);
        // 删除用户与岗位关联
        userPostMapper.deleteUserPost(userIds);
        return userMapper.deleteUserByIds(userIds);
    }

    @Override
    public AnalysisExcelResultDTO importUserByExcel(MultipartFile file) {
        if(file==null){
            return null;
        }
        //Excel文件内容
        List<List<String>> excelContent = null;
        //Excel错误内容记录
        List<List<String>> errorContent = new ArrayList<>();

        try {
            InputStream in = new BufferedInputStream(file.getInputStream());
            org.apache.poi.util.IOUtils.closeQuietly(file.getInputStream());
            //读取文件内容
            excelContent = ExcelUtils.getExcelContent(in, 0,null,8);
        }catch (IOException e) {
            throw new GlobalException("文件解析失败！");
        }
        if(CollectionUtils.isEmpty(excelContent)||excelContent.size()==0){
            throw new GlobalException("文件内容为空！");
        }

        //验证表头
        List<String> requiredHeadersOrder = Arrays.asList("用户序号", "部门编号", "*登录名称","*用户名称","用户邮箱","手机号码","用户性别","帐号状态");
        boolean isCorrectOrder = checkColumnNamesWithOrder(excelContent.get(0), requiredHeadersOrder); //因为第一行是表头，所以索引为0
        if (!isCorrectOrder) {
            throw new GlobalException("Excel模板列名顺序不正确！");
        }

        //去除提示及表头
        excelContent = processExcelContent(excelContent, true, 1); // 去除前一行

        int successNum=0;//成功次数

        for(List<String> s:excelContent) {
            //数据行-校验
            String dataErr=checkRowData(s);
            if(!StringUtils.isEmpty(dataErr)){
                List<String> errList = new ArrayList<>();
                errList.add(dataErr);
                errList.addAll(s);
                errorContent.add(errList);
                continue;
            }
            //数据行校验都通过了，直接录入当前行用户信息
            SysUserVO user = new SysUserVO();
            user.setUserName(s.get(2));
            user.setNickName(s.get(3));
            this.insertUser(user);
            successNum++;
        }
        AnalysisExcelResultDTO analysisExcelResultDTO = new AnalysisExcelResultDTO();
        analysisExcelResultDTO.setErrorNum(errorContent.size());
        System.out.println(errorContent.toString());
        analysisExcelResultDTO.setSuccessNum(successNum);
        try {
            ClassPathResource classPathResource = new ClassPathResource(exportUerFailePath);
            InputStream in = classPathResource.getInputStream();

            XSSFWorkbook wb = new XSSFWorkbook(in);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();//构建字节输出流

            try {
                ExcelUtils.createRow(wb, 0, errorContent, 1); //在模板文件追加内容->等于导出的数据 这样我们省去构建模版头内容的步骤
                wb.write(baos);
            } catch (Exception e){
                e.printStackTrace();
            } finally {
                org.apache.poi.util.IOUtils.closeQuietly(baos);
                org.apache.poi.util.IOUtils.closeQuietly(wb);
            }
            byte[] bytes = baos.toByteArray(); //返回base64文件流 需要根据对应的文件前缀拼接才会获取到 例如图片的是 'data:image/jpeg;base64,'+res.data

            analysisExcelResultDTO.setContent(bytes);

            return analysisExcelResultDTO;
        } catch (Exception e) {
            log.error("--------写入错误文件失败:{}",e);
        }
        return null;
    }

    // 验证表头
    public static boolean checkColumnNamesWithOrder(List<String> row, List<String> expectedHeadersInOrder) {
        // 比较实际表头与期望表头的顺序是否一致
        return row.equals(expectedHeadersInOrder);
    }

    //去除表头
    public List<List<String>> processExcelContent(List<List<String>> excelContent, boolean removeHeader, int headerRowCount) {
        // 根据参数决定是否移除表头
        if (removeHeader && headerRowCount > 0) {
            // 确保headerRowCount不大于excelContent的大小，避免越界
            int rowsToRemove = Math.min(headerRowCount, excelContent.size());
            for (int i = 0; i < rowsToRemove; i++) {
                excelContent.remove(0);
            }
        }
        return excelContent;
    }


    private String checkRowData(List<String> row) {
        try {
            // 检查必填项是否为空
            //row.get(2)是空的（即第3列为空）或者row.get(3)是空的（即第4列为空）为true 否则，如果这两列都有非空值，它就被赋值为false
            boolean hasEmptyMandatoryFields = StringUtils.isEmpty(row.get(2)) || StringUtils.isEmpty(row.get(3));

            boolean hasFilledFields = false; // 用于标记该行是否有任何非空项
            for (int i = 0; i < row.size(); i++) { // 遍历整行
                if (!StringUtils.isEmpty(row.get(i))) {
                    hasFilledFields = true;
                    break; // 找到一个非空项后即可停止循环
                }
            }
            // 只有当存在非空项且有必填项为空时，才认为是错误
            if (hasFilledFields && hasEmptyMandatoryFields) {  //true&&true    true&&false
                return "必填项为空";
            }

            //检查数据输入是否符合标准
            // 示例：假设第5列为邮箱，进行简单格式验证
            if (!StringUtils.isEmpty(row.get(4))){
                String emailPattern = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
                if (Pattern.matches(emailPattern, row.get(4))) {
                    // 邮箱格式正确
                } else {
                    return "邮箱格式错误";
                }
            }
            //.....

            //检查用户是否存在
            SysUserVO u = userMapper.selectUserByUserName(row.get(2));
            if (!ObjectUtils.isEmpty(u)) {
                return "账号已存在";
            }
        }catch (Exception e){
            return  "其他错误，请检查输入内容";
        }
        return null;
    }


    /**
     * 导入用户数据
     *
     * @param userList 用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    @Override
    public String importUser(List<SysUserVO> userList, Boolean isUpdateSupport, String operName)
    {
        if (StringUtils.isNull(userList) || userList.size() == 0)
        {
            throw new ServiceException("导入用户数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        String password = configService.selectConfigByKey("sys.user.initPassword");
        for (SysUserVO user : userList)
        {
            try
            {
                // 验证是否存在这个用户
                SysUserVO u = userMapper.selectUserByUserName(user.getUserName());
                if (StringUtils.isNull(u))
                {
                    BeanValidators.validateWithException(validator, user);
                    user.setPassword(SecurityUtils.encryptPassword(password));
                    user.setCreateBy(operName);
                    this.insertUser(user);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + user.getUserName() + " 导入成功");
                }
                else if (isUpdateSupport)
                {
                    BeanValidators.validateWithException(validator, user);
                    checkUserAllowed(user);
                    checkUserDataScope(user.getUserId());
                    user.setUpdateBy(operName);
                    this.updateUser(user);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + user.getUserName() + " 更新成功");
                }
                else
                {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、账号 " + user.getUserName() + " 已存在");
                }
            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、账号 " + user.getUserName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

}
