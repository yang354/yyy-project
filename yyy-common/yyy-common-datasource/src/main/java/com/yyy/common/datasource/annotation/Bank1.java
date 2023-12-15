package com.yyy.common.datasource.annotation;

import com.baomidou.dynamic.datasource.annotation.DS;

import java.lang.annotation.*;

/**
 * @Author yyy
 * @Date 2023/7/13 下午2:34
 */

@Target({ ElementType.TYPE, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)  //注解在哪个阶段执行 运行期间,一直存在（一般用这个就够用了） SOURCE、CLASS 用的比较少
@Documented
@DS("bank1")
public @interface Bank1 {
}
