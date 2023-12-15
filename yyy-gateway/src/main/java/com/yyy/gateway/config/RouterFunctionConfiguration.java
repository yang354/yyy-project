package com.yyy.gateway.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.server.RequestPredicates;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.RouterFunctions;
import com.yyy.gateway.handler.ValidateCodeHandler;

/**
 * 路由配置信息-当发送 get请求 且路径为/code时，调用validateCodeHandler方法，返回验证码图片
 * 
* @author 羊扬杨
 */
@Configuration
public class RouterFunctionConfiguration
{
    @Autowired
    private ValidateCodeHandler validateCodeHandler;

    @SuppressWarnings("rawtypes")
    @Bean
    public RouterFunction routerFunction()
    {
        return RouterFunctions.route(
                //MediaType.TEXT_PLAIN 的意思是将文件设置为纯文本的形式，浏览器在获取到这种文件时并不会对其进行处理
                RequestPredicates.GET("/code").and(RequestPredicates.accept(MediaType.TEXT_PLAIN)),
                validateCodeHandler);
    }
}
