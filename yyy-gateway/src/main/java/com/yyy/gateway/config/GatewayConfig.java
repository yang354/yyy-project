package com.yyy.gateway.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import com.yyy.gateway.handler.SentinelFallbackHandler;

/**
 * 网关限流配置   当触发限流时优先调用SentinelFallbackHandler方法
 * 
* @author 羊扬杨
 */
@Configuration
public class GatewayConfig
{
    @Bean
    @Order(Ordered.HIGHEST_PRECEDENCE)
    public SentinelFallbackHandler sentinelGatewayExceptionHandler()
    {
        return new SentinelFallbackHandler();
    }
}