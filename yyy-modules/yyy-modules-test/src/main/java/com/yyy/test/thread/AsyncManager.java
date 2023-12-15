package com.yyy.test.thread;


import com.yyy.common.core.utils.SpringUtils;

import java.util.TimerTask;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * 异步任务管理器
 *
 * @author yyyz
 */
public class AsyncManager {
    /**
     * 操作延迟10毫秒
     */
    private final int OPERATE_DELAY_TIME = 10;

    /**
     * 异步操作任务调度线程池
     */
    private ExecutorService executorService = SpringUtils.getBean("asyncExecutorService");

    /**
     * 异步操作任务调度线程池
     */
    private ScheduledExecutorService scheduledExecutorService = SpringUtils.getBean("scheduledExecutorService");


    /**
     * 单例模式
     */
    private AsyncManager() {
    }

    private static AsyncManager me = new AsyncManager();

    public static AsyncManager me() {
        return me;
    }


    /**
     * 执行任务
     *
     * @param task 任务
     */
    public void execute(TimerTask task) {
        executorService.execute(task); //出现异常会抛出的异常
//        executorService.submit(task); //出现异常不会抛出的异常，并都将被认为是任务返回状态的一部分
    }

    /**
     * 执行任务
     *
     * @param task 任务
     */
    public void scheduledExecute(TimerTask task) {
        scheduledExecutorService.schedule(task, OPERATE_DELAY_TIME, TimeUnit.MILLISECONDS);
    }


}
