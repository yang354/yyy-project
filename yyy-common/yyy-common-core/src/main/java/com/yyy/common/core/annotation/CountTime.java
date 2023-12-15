package com.yyy.common.core.annotation;

import java.lang.annotation.*;

/**
* 获取程序执行时间注解   不支持在多线程中使用，在多线程中使用会报空指针异常 注意！！！！！！！！
* @author yyy
* @date 2020/12/22
*/
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface CountTime {
}
