package com.yyy.common.security.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.AsyncHandlerInterceptor;
import com.yyy.common.core.constant.SecurityConstants;
import com.yyy.common.core.context.SecurityContextHolder;
import com.yyy.common.core.utils.ServletUtils;
import com.yyy.common.core.utils.StringUtils;
import com.yyy.common.security.auth.AuthUtil;
import com.yyy.common.security.utils.SecurityUtils;
import com.yyy.system.api.vo.login.LoginUserVO;

/**
 * 定义自定义请求头拦截器，将Header数据封装到线程变量中方便获取
 * 注意：此拦截器会同时验证当前用户有效期自动刷新有效期
 *
 * 并且是通过这个拦截器将当前登录用户信息存到security的上下文中-这样的好处就是把登录和security独立了出来，方便编写业务
 * 所以重点是在创建token那里，只要创建token方式不变，登录逻辑可以自己发挥
 *
* @author 羊扬杨
 */
public class HeaderInterceptor implements AsyncHandlerInterceptor
{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
        if (!(handler instanceof HandlerMethod)) // instanceof关键字可以判断左边对象是否是右边类或者子类的一个实例
        {
            return true;
        }

        SecurityContextHolder.setUserId(ServletUtils.getHeader(request, SecurityConstants.DETAILS_USER_ID));
        SecurityContextHolder.setUserName(ServletUtils.getHeader(request, SecurityConstants.DETAILS_USERNAME));
        SecurityContextHolder.setUserKey(ServletUtils.getHeader(request, SecurityConstants.USER_KEY));

        String token = SecurityUtils.getToken();
        if (StringUtils.isNotEmpty(token))
        {
            LoginUserVO loginUser = AuthUtil.getLoginUser(token);
            if (StringUtils.isNotNull(loginUser))
            {
                AuthUtil.verifyLoginUserExpire(loginUser);
                SecurityContextHolder.set(SecurityConstants.LOGIN_USER, loginUser);
            }
        }
        return true; //不管拿不拿到token都不拦截，所以访问接口时，不带token也可以访问，但是比如接口添加了校验权限时，就会aop的处理
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception
    {
        SecurityContextHolder.remove();
    }
}
