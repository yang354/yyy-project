package com.yyy.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.yyy.system.api.vo.SysLogininforVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.yyy.common.core.constant.CacheConstants;
import com.yyy.common.core.utils.poi.ExcelUtil;
import com.yyy.common.core.web.controller.BaseController;
import com.yyy.common.core.web.domain.AjaxResult;
import com.yyy.common.core.web.page.TableDataInfo;
import com.yyy.common.log.annotation.Log;
import com.yyy.common.log.enums.BusinessType;
import com.yyy.common.redis.utils.RedisService;
import com.yyy.common.security.annotation.InnerAuth;
import com.yyy.common.security.annotation.RequiresPermissions;

import com.yyy.system.service.ISysLogininforService;

/**
 * 系统访问记录
 * 
* @author 羊扬杨
 */
@RestController
@RequestMapping("/logininfor")
public class SysLogininforController extends BaseController
{
    @Autowired
    private ISysLogininforService logininforService;

    @Autowired
    private RedisService redisService;

    @RequiresPermissions("system:logininfor:list")
    @GetMapping("/list")
    public TableDataInfo list(SysLogininforVO logininfor)
    {
        startPage();
        List<SysLogininforVO> list = logininforService.selectLogininforList(logininfor);
        return getDataTable(list);
    }

    @Log(title = "登录日志", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:logininfor:export")
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysLogininforVO logininfor)
    {
        List<SysLogininforVO> list = logininforService.selectLogininforList(logininfor);
        ExcelUtil<SysLogininforVO> util = new ExcelUtil<SysLogininforVO>(SysLogininforVO.class);
        util.exportExcel(response, list, "登录日志");
    }

    @RequiresPermissions("system:logininfor:remove")
    @Log(title = "登录日志", businessType = BusinessType.DELETE)
    @DeleteMapping("/{infoIds}")
    public AjaxResult remove(@PathVariable Long[] infoIds)
    {
        return toAjax(logininforService.deleteLogininforByIds(infoIds));
    }

    @RequiresPermissions("system:logininfor:remove")
    @Log(title = "登录日志", businessType = BusinessType.DELETE)
    @DeleteMapping("/clean")
    public AjaxResult clean()
    {
        logininforService.cleanLogininfor();
        return success();
    }

    @RequiresPermissions("system:logininfor:unlock")
    @Log(title = "账户解锁", businessType = BusinessType.OTHER)
    @GetMapping("/unlock/{userName}")
    public AjaxResult unlock(@PathVariable("userName") String userName)
    {
        redisService.deleteObject(CacheConstants.PWD_ERR_CNT_KEY + userName);
        return success();
    }

    @InnerAuth
    @PostMapping
    public AjaxResult add(@RequestBody SysLogininforVO logininfor)
    {
        return toAjax(logininforService.insertLogininfor(logininfor));
    }
}
