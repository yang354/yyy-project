package com.yyy.common.core.utils.io;

/**
 * @Author yyy
 * @Date 2023/7/13 下午4:42
 */

public class CloseUtil {
    public static void close(AutoCloseable ...autoCloseable) {
        if (autoCloseable == null) {
            return;
        }
        for (AutoCloseable a : autoCloseable) {
            if (a != null) {
                try {
                    a.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}