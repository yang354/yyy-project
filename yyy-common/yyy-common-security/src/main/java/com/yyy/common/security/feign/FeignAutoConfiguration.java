package com.yyy.common.security.feign;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import feign.RequestInterceptor;

/**
 * 注册我们自定义的 Feign 请求拦截器
 *
 * @author yyy
 **/
@Configuration  //像自定义starter的配置了@Configuration 则不用在META-INF.spring下的配置文件在配置也会启动后就自动初始化
public class FeignAutoConfiguration
{
    @Bean
    public RequestInterceptor requestInterceptor()
    {
        return new FeignRequestInterceptor();
    }
}
