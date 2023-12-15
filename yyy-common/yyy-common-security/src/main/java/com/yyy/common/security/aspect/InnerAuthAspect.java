package com.yyy.common.security.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import com.yyy.common.core.constant.SecurityConstants;
import com.yyy.common.core.exception.InnerAuthException;
import com.yyy.common.core.utils.ServletUtils;
import com.yyy.common.core.utils.StringUtils;
import com.yyy.common.security.annotation.InnerAuth;

/**
 * 内部服务调用验证处理
 * 
* @author 羊扬杨
 */
@Aspect
@Component
public class InnerAuthAspect implements Ordered  //这里继承Ordered，主要是想重写getOrder方法，手动设置优先级
{

    //因为是单个，所以，可以直接写，也可以提出来，然后用pointcut()方法声明AOP签名
    @Around("@annotation(innerAuth)")  //定义了该通知的连接点是“innerAuth”
    //可以携带两个参数 point 切面的信息  innerAuth注解的配置(看逻辑是否需要)
    public Object innerAround(ProceedingJoinPoint point, InnerAuth innerAuth) throws Throwable
    {
        //因为这里一个注解用一个handler，所以我们可以省去（先获取方法，拿到它用注解是哪个，然后区分处理），我们直接处理
        // 从请求头中获取请求来源字符串
        String source = ServletUtils.getRequest().getHeader(SecurityConstants.FROM_SOURCE);
        // 内部请求验证 SecurityConstants.INNER 为内部请求字符串，如果两者相同表示具有内部访问权限。
        if (!StringUtils.equals(SecurityConstants.INNER, source))
        {
            throw new InnerAuthException("没有内部访问权限，不允许访问");
        }

        String userid = ServletUtils.getRequest().getHeader(SecurityConstants.DETAILS_USER_ID);
        String username = ServletUtils.getRequest().getHeader(SecurityConstants.DETAILS_USERNAME);
        // 用户信息验证
        if (innerAuth.isUser() && (StringUtils.isEmpty(userid) || StringUtils.isEmpty(username)))
        {
            throw new InnerAuthException("没有设置用户信息，不允许访问 ");
        }

        //这里保险一点也可以使用try-catch包一下
        return point.proceed();
    }

    /**
     * 确保在权限认证aop执行前执行
     */
    @Override
    public int getOrder()
    {
        return Ordered.HIGHEST_PRECEDENCE + 1;
    }
}
