package com.yyy.common.redis;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Author yzz
 * @Date 2023/11/21 下午5:28
 */

//可以使用扫描，然后在META-INF只写注册RedisApplication即可，容器会注册RedisApplication，然后帮你去扫描并创建注册到容器中，
// 否则的话你要全部都写，等容器都帮你创建
@ComponentScan
//@MapperScan(annotationClass = Mapper.class)
public class RedisApplication {
}
