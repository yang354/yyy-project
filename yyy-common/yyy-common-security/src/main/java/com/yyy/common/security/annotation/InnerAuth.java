package com.yyy.common.security.annotation;

import java.lang.annotation.*;

/**
 * 内部认证注解
 * 
* @author 羊扬杨
 */
@Target(ElementType.METHOD)  //注解放置的目标位置,METHOD是可注解在方法级别上
@Retention(RetentionPolicy.RUNTIME)  //注解在哪个阶段执行 运行期间,一直存在（一般用这个就够用了） SOURCE、CLASS 用的比较少
@Documented
public @interface InnerAuth
{
    /**
     * 是否校验用户信息
     */
    boolean isUser() default false;
}