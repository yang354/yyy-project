package com.yyy.common.redis.constant;

/**
 * 
 * 锁类型
 * 
 * @author yyy 2019年1月14日下午4:07:09
 */
public enum LockType {
    /**
     * 可重入锁
     */
    REENTRANT,
    /**
     * 公平锁
     */
    FAIR,
    /**
     * 联锁
     */
    MULTI,
    /**
     * 红锁
     */
    RED,
    /**
     * 读锁
     */
    READ,
    /**
     * 写锁
     */
    WRITE;

    LockType() {}

}
