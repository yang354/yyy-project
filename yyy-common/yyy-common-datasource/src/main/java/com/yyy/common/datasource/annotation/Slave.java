package com.yyy.common.datasource.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import com.baomidou.dynamic.datasource.annotation.DS;

/**
 * 从库数据源
 * 
* @author 羊扬杨
 */
@Target({ ElementType.TYPE, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)  //注解在哪个阶段执行 运行期间,一直存在（一般用这个就够用了） SOURCE、CLASS 用的比较少
@Documented
@DS("slave")
public @interface Slave
{

}