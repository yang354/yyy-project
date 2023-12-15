package com.yyy.test.thread;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.TimerTask;
import java.util.concurrent.ExecutionException;


/**
 * 异步工厂（产生任务用）
 *
 * @author yyyz
 */
public class AsyncFactory {
    private static final Logger sys_user_logger = LoggerFactory.getLogger("sys-user");


    public static TimerTask testThread() {

        return new TimerTask() {
            @Override
            public void run() {
                System.out.println(1/0);

                try {

                    Thread.sleep(6000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println("执行了异步任务");
            }
        };
    }
}
