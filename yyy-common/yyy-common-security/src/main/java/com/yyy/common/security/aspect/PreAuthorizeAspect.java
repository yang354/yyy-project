package com.yyy.common.security.aspect;

import java.lang.reflect.Method;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import com.yyy.common.security.annotation.RequiresLogin;
import com.yyy.common.security.annotation.RequiresPermissions;
import com.yyy.common.security.annotation.RequiresRoles;
import com.yyy.common.security.auth.AuthUtil;

/**
 * 基于 Spring Aop 的注解鉴权
 * 
 * @author kong
 */
@Aspect
@Component
public class PreAuthorizeAspect
{
    /**
     * 构建  无参构造器
     */
    public PreAuthorizeAspect()
    {
    }

    /**
     * 定义AOP签名 (切入所有使用鉴权注解的方法)
     */
    public static final String POINTCUT_SIGN = " @annotation(com.yyy.common.security.annotation.RequiresLogin) || "
            + "@annotation(com.yyy.common.security.annotation.RequiresPermissions) || "
            + "@annotation(com.yyy.common.security.annotation.RequiresRoles)";

    /**
     * 声明AOP签名
     */
    @Pointcut(POINTCUT_SIGN)
    public void pointcut()
    {
    }

    /**
     * 环绕切入
     * 如果有@Befor的话会先执行一次@Around再执行@Befor，然后再到@Around 执行一次，再
     *      然后如果有@After 的话，会执行@After完后在执行一次@Around
     * 
     * @param joinPoint 切面对象
     * @return 底层方法执行后的返回值
     * @throws Throwable 底层方法抛出的异常
     */
    @Around("pointcut()")  //定义了该通知的连接点是“pointcut”
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable
    {
        System.out.println("开始环绕切入~~~~~~~~~~~~~~~~~~~");
        // 注解鉴权 因为这里多个注解共用一个handler，所以我们先获取方法，拿到它用注解是哪个，然后区分处理
        MethodSignature signature = (MethodSignature) joinPoint.getSignature(); //获取目标方法，此处可将signature强转为MethodSignature
        checkMethodAnnotation(signature.getMethod());
        try
        {
            // 执行原有逻辑
            Object obj = joinPoint.proceed();  //执行目标连接点方法
            return obj;
        }
        catch (Throwable e)
        {
            throw e;
        }
    }

    /**
     * 对一个Method对象进行注解检查
     */
    public void checkMethodAnnotation(Method method)
    {
        // 校验 @RequiresLogin 注解
        RequiresLogin requiresLogin = method.getAnnotation(RequiresLogin.class);
        if (requiresLogin != null)
        {
            AuthUtil.checkLogin();
        }

        // 校验 @RequiresRoles 注解
        RequiresRoles requiresRoles = method.getAnnotation(RequiresRoles.class);
        if (requiresRoles != null)
        {
            AuthUtil.checkRole(requiresRoles);
        }

        // 校验 @RequiresPermissions 注解
        RequiresPermissions requiresPermissions = method.getAnnotation(RequiresPermissions.class);
        if (requiresPermissions != null)
        {
            AuthUtil.checkPermi(requiresPermissions);
        }
    }
}
