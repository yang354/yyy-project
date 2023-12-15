package com.yyy.test.thread;

import cn.hutool.extra.spring.EnableSpringUtil;
import com.alibaba.ttl.threadpool.TtlExecutors;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.concurrent.BasicThreadFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;

import java.util.concurrent.*;

/**
 * spring 线程池 配置
 * @author yyy
 * @date 2021/6/11
 */
@Configuration
//这个可以注掉，否则只是用@ConfigurationProperties在配置类不搭配@Component，则要使用注解@EnableConfigurationProperties(在哪里引用就在哪里使用这个注解，所以最好放在启动类)
@EnableConfigurationProperties({SpringProperties.class})
//@ConditionalOnClass(ApplicationContext.class)  //（某个class位于类路径上，才会实例化一个Bean）
@EnableSpringUtil
@RequiredArgsConstructor   //@RequiredArgsConstructor：只会对被final修饰或者no-null修饰的字段完成对象注入。可以代替@Autowired注入bean对象
public class SpringExecutorConfiguration {

    private final SpringProperties springProperties;

//~~~~~~~~~~~~~~~第一种，可用来异步编排 使用方式 @Autowired方式或者手动获取通过SpringUtils.getBean 再或者@Async注解使用~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    /**
     * 原始线程池 不要直接使用
     * 原因：是因为使用的是SimpleAsyncTaskExecutor，该线程池默认来一个任务创建一个线程，若系统中不断的创建线程，最终会导致系统占用内存过高，
            引发OutOfMemoryError错误。基于默认配置，SimpleAsyncTaskExecutor并不是严格意义的线程池，达不到线程复用的功能。
     * 在项目应用中，@Async调用线程池，推荐使用自定义线程池的模式。自定义线程池常用方案：重新实现接口AsyncConfigurer。


     * ThreadPoolTaskExecutor是Spring基于java本身的线程池ThreadPoolExecutor做的二次封装，主要目的还是为了更加方便的在spring框架体系中使用线程池。
     * ThreadPoolTaskExecutor是spring core包中的，而ThreadPoolExecutor是JDK中的JUC
     * 同时ThreadPoolTaskExecutor也是最常使用，推荐。其实质是对
     *
     *
     * Executor 和 Service 的区别
     * ScheduledThreadPoolExecutor是java提供的定时任务线程池。
     * ScheduledExecutorService接口是基于ExecutorService的功能实现的延迟和周期执行任务的功能。每个任务以及每个任务的每个周期都会提交到线程池中由线程去执行，
     * 所以任务在不同周期内执行它的线程可能是不同的。ScheduledExecutorService接口的默认实现类是ScheduledThreadPoolExecutor。
     */
    @Bean
    public ThreadPoolTaskExecutor springRawExecutor() {             //第一步 创建线程池
        SpringProperties.Executor executor = springProperties.getExecutor();
        ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
        taskExecutor.setCorePoolSize(executor.getCorePoolSize());

        taskExecutor.setMaxPoolSize(executor.getMaxPoolSize());
        taskExecutor.setQueueCapacity(executor.getQueueCapacity());
        taskExecutor.setThreadNamePrefix("springRawExecutor-");

        taskExecutor.setKeepAliveSeconds(executor.getKeepAliveSeconds());
        taskExecutor.initialize();
        return taskExecutor;
    }


    /**
     * TTl包装后的线程执行器
     */

    /*
    @Primary 这个注解在这里的意义在于，我的AsyncExecutorConfiguration 不用动任何，我只需要在这里把注解@Primary放到哪一个执行器上，
    我的AsyncExecutorConfiguration就会自动选择使用哪一个执行器作为默认的执行器
    然后使用的时候 @Async 就是默认我们指定的那一个，如果想使用其他的 我们需要 @Async("bigExecutor") 加上bean的名字
    但是，异步执行异常处理器是对整个创建了的线程池都会生效的
     */
    @Bean
    @Primary                        //第二步 利用第一步创建好的ThreadPoolTaskExecutor，得到包装后的Executor
    public Executor asyncExecutor(ThreadPoolTaskExecutor springRawExecutor) {
        return TtlExecutors.getTtlExecutor(springRawExecutor);
    }

    /**
     *  TTl包装后的线程执行器(线程极多, 用来处理一些非核心的异步任务)
     */
    @Bean
//    @Primary
    public Executor bigExecutor() {  //或者可以自己重新定义线程池,直接定义时就包装
        ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
        taskExecutor.setMaxPoolSize(9999);
        taskExecutor.setQueueCapacity(10000);
        taskExecutor.setThreadNamePrefix("bigExecutor-");
        taskExecutor.initialize();
        return TtlExecutors.getTtlExecutor(taskExecutor);
    }

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~第二种 可用来 xxxService.submit(task) 提交任务~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    /**
     * TTl包装后的线程执行服务   两个是不同类型的 功能不同 用法差不多相同
     */
    @Bean                                   //第二步 利用第一步创建好的ThreadPoolTaskExecutor，得到ExecutorService
    public ExecutorService asyncExecutorService(ThreadPoolTaskExecutor springRawExecutor){
        return TtlExecutors.getTtlExecutorService(springRawExecutor.getThreadPoolExecutor());
        //注意
        //通过 execute 提交的任务，才能将它抛出的异常交给未捕获异常处理器;
        //而通过 submit 提交的任务，无论是抛出的未检查异常还是已检查异常，都将被认为是任务返回状态的一部分;
    }


    /**
     * 执行周期性或定时任务  两个是不同类型的 功能不同 用法差不多相同
     * 创建一个可以执行延迟任务的线程池
     */
    @Bean
    protected ScheduledExecutorService scheduledExecutorService() { //或者自己定义xxxExecutorService
        SpringProperties.Executor executor = springProperties.getExecutor();
        return new ScheduledThreadPoolExecutor(executor.getCorePoolSize(),
                new BasicThreadFactory.Builder().namingPattern("schedule-pool-%d").daemon(true).build(), //使用自定义命名的线程名，二选一
//                Executors.defaultThreadFactory(), //使用默认命名的线程名，二选一
                new ThreadPoolExecutor.CallerRunsPolicy()) {
            @Override
            protected void afterExecute(Runnable r, Throwable t) {
                super.afterExecute(r, t);
                Threads.printException(r, t);
            }
        };
    }


    /**
     创建固定大小的线程池
     newFixedThreadPool(int nThreads) 核心线程数corePool可以设置
     执行过程如下：
     1.如果当前工作中的线程数量少于corePool的数量，就创建新的线程来执行任务。
     2.当线程池的工作中的线程数量达到了corePool，则将任务加入LinkedBlockingQueue。
     3.线程执行完1中的任务后会从队列中去任务。
     注意LinkedBlockingQueue是无界队列，所以可以一直添加新任务到线程池。


     创建只有一个线程的线程池
     newSingleThreadExecutor()


     创建一个不限线程数上限的线程池，任何提交的任务都将立即执行
     newCachedThreadPool()  核心线程数corePool不用设置，默认无限创建


     小程序使用这些快捷方法没什么问题，对于服务端需要长期运行的程序，创建线程池应该直接使用ThreadPoolExecutor的构造方法。
     没错，上述Executors方法创建的线程池就是ThreadPoolExecutor。


     */

}
