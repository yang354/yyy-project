package com.yyy.common.security.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 登录认证：只有登录之后才能进入该方法(作用：可以不启用网关的情况下也要求是否需要登录后访问)
 * 
 * @author yyy
 *
 */
@Retention(RetentionPolicy.RUNTIME)  //注解在哪个阶段执行 运行期间,一直存在（一般用这个就够用了） SOURCE、CLASS 用的比较少
@Target({ ElementType.METHOD, ElementType.TYPE })  //注解放置的目标位置,METHOD是可注解在方法级别上,TYPE是能修饰类,接口,枚举
public @interface RequiresLogin
{
}

//像这种没有属性值的，使用的时候就可以 使用格式:@注解名()
