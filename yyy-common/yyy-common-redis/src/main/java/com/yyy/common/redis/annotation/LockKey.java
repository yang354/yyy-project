package com.yyy.common.redis.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 *
 * 加锁Key注解
 *  作用：作用于方法参数上，即具体要锁住的属性字段
 *  注意：只支持方法形参（基本类型、String或自定义实体类的第一层属性）加注解
 *  例如： public ResResult<Void> lock5(@LockKey Integer a){}
 *
 * 
 * @author yyy 2019年1月14日下午4:07:55
 */
@Target(value = {ElementType.PARAMETER, ElementType.TYPE})
@Retention(value = RetentionPolicy.RUNTIME)
public @interface LockKey {
    String value() default "";
}
