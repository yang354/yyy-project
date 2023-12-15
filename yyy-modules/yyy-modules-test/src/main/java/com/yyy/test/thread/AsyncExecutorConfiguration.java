package com.yyy.test.thread;

import cn.hutool.json.JSONUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.annotation.EnableAsync;

import java.lang.reflect.Method;
import java.util.concurrent.Executor;

/**
 * 异步执行配置
 * @author yyy
 * @date 2021/6/11
 */
@Slf4j
@EnableAsync
@Configuration
@RequiredArgsConstructor   //@RequiredArgsConstructor：只会对被final修饰或者no-null修饰的字段完成对象注入。可以代替@Autowired注入bean对象
public class AsyncExecutorConfiguration implements AsyncConfigurer {
    /** TTL包装后的执行器 */
    private final Executor asyncExecutor;


    /**
     * 指定默认线程池  可以不重写方法，但是这样的话使用 @Async不指定名称的话使用的是默认的线程池，尽管你定义了，使用也得是@Async(name=xxx)
     * 所以我们可以通过重写这个方法
     */
    @Override
    public Executor getAsyncExecutor() {
        System.out.println(asyncExecutor.toString()+"~~~~~~~~~~~~~");
        return asyncExecutor;
    }



    /**
     * 获取异步未捕获异常处理程序
     */
    @Override
    public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
        return new SpringAsyncExceptionHandler();
    }

    /**
     * Spring 异步异常处理器
     */
    private static class SpringAsyncExceptionHandler implements AsyncUncaughtExceptionHandler {

        @SuppressWarnings("NullableProblems")
        @Override
        public void handleUncaughtException(Throwable throwable, Method method, Object... objects) {
            log.error("异步方法中发生异常，线程名：{}，方法：{}，参数：{}，异常：{}",Thread.currentThread().getName(), method.getName(), JSONUtil.toJsonStr(objects),throwable.getMessage());
            log.error("详细异常信息",throwable);
        }
    }
}
