package com.yyy.common.security.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 角色认证：必须具有指定角色标识才能进入该方法
 * 
* @author 羊扬杨
 */
@Retention(RetentionPolicy.RUNTIME)  //注解在哪个阶段执行 运行期间,一直存在（一般用这个就够用了） SOURCE、CLASS 用的比较少
@Target({ ElementType.METHOD, ElementType.TYPE })  //注解放置的目标位置,METHOD是可注解在方法级别上,TYPE是能修饰类,接口,枚举
public @interface RequiresRoles
{
    /**
     * 需要校验的角色标识
     */
    String[] value() default {};

    /**
     * 验证逻辑：AND | OR，默认AND
     */
    Logical logical() default Logical.AND;
}

//像这种有属性值的，使用的时候就可以 使用格式:@注解名(属性名=属性值,属性名=属性值)