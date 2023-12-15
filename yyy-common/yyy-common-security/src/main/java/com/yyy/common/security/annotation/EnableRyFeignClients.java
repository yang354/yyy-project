package com.yyy.common.security.annotation;

import org.springframework.cloud.openfeign.EnableFeignClients;
import java.lang.annotation.*;

/**
 * 自定义feign注解
 * 添加basePackages路径
 * 
* @author 羊扬杨
 */
@Target(ElementType.TYPE) //注解放置的目标位置,TYPE是能修饰类,接口,枚举
@Retention(RetentionPolicy.RUNTIME)  //注解在哪个阶段执行 运行期间,一直存在（一般用这个就够用了） SOURCE、CLASS 用的比较少
@Documented
@EnableFeignClients
public @interface EnableRyFeignClients
{
    String[] value() default {};

    String[] basePackages() default { "com.yyy" };

    Class<?>[] basePackageClasses() default {};

    Class<?>[] defaultConfiguration() default {};

    Class<?>[] clients() default {};
}
