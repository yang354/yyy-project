package com.yyy.auth.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.yyy.auth.form.LoginBody;
import com.yyy.auth.form.RegisterBody;
import com.yyy.auth.service.SysLoginService;
import com.yyy.common.core.domain.R;
import com.yyy.common.core.utils.JwtUtils;
import com.yyy.common.core.utils.StringUtils;
import com.yyy.common.security.auth.AuthUtil;
import com.yyy.common.security.service.TokenService;
import com.yyy.common.security.utils.SecurityUtils;
import com.yyy.system.api.vo.login.LoginUserVO;

/**
 * token 控制  所有登录方式入口
 *
 * @author 羊扬杨
 */
@RestController
public class TokenController {
    @Autowired
    private TokenService tokenService;

    @Autowired
    private SysLoginService sysLoginService;

    @PostMapping("login")
    public R<?> login(@RequestBody LoginBody form) {
        // 用户登录
        LoginUserVO userInfo = sysLoginService.login(form.getUsername(), form.getPassword());
        // 获取登录token
        return R.ok(tokenService.createToken(userInfo));
    }


    //qq登录-登录成功返回登录token



    //微信登录-登录成功返回登录token




    @DeleteMapping("logout")
    public R<?> logout(HttpServletRequest request) {
        String token = SecurityUtils.getToken(request);
        if (StringUtils.isNotEmpty(token)) {
            String username = JwtUtils.getUserName(token);
            // 删除用户缓存记录
            AuthUtil.logoutByToken(token);
            // 记录用户退出日志
            sysLoginService.logout(username);
        }
        return R.ok();
    }

    @PostMapping("refresh")
    public R<?> refresh(HttpServletRequest request) {
        LoginUserVO loginUser = tokenService.getLoginUser(request);
        if (StringUtils.isNotNull(loginUser)) {
            // 刷新令牌有效期
            tokenService.refreshToken(loginUser);
            return R.ok();
        }
        return R.ok();
    }

    @PostMapping("register")
    public R<?> register(@RequestBody RegisterBody registerBody) {
        // 用户注册
        sysLoginService.register(registerBody.getUsername(), registerBody.getPassword());
        return R.ok();
    }
}
