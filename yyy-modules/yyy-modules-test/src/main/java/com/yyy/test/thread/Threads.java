package com.yyy.test.thread;

import cn.hutool.json.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.*;

/**
 * 线程相关工具类.
 *
 * @author yyyz
 */
public class Threads {
    private static final Logger logger = LoggerFactory.getLogger(Threads.class);



    /**
     * 打印线程异常信息
     */
    public static void printException(Runnable r, Throwable t) {
        if (t == null && r instanceof Future<?>) {
            try {
                Future<?> future = (Future<?>) r;
                if (future.isDone()) {
                    future.get();
                }
            } catch (CancellationException ce) {
                t = ce;
            } catch (ExecutionException ee) {
                t = ee.getCause();
            } catch (InterruptedException ie) {
                Thread.currentThread().interrupt();
            }
        }
        if (t != null) {
            logger.error("异步方法中发生异常，线程名：{}，异常：{}",Thread.currentThread().getName(),t.getMessage());
            logger.error("详细异常信息",t);
//            logger.error(t.getMessage(), t);
        }
    }
}
