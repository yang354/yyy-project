package com.yyy.common.security.config;

import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import com.yyy.common.security.interceptor.HeaderInterceptor;

/**
 * 拦截器配置
 *
 * @author 羊扬杨
 */
public class WebMvcConfig implements WebMvcConfigurer {
    /**
     * 不需要拦截地址 引入了security依赖的模块会强制要求去登录，除了放行的
     */
    public static final String[] excludeUrls = {"/login", "/logout", "/refresh"};

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(getHeaderInterceptor())  //并给自定义请求头拦截器添加条件
                .addPathPatterns("/**")
                .excludePathPatterns(excludeUrls)
                .order(-10);
    }

    /**
     * 注册 自定义请求头拦截器
     */
    public HeaderInterceptor getHeaderInterceptor() {
        return new HeaderInterceptor();
    }
}
