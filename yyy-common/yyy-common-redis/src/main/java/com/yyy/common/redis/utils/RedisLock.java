package com.yyy.common.redis.utils;

import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import sun.security.util.ArrayUtil;

import java.util.Arrays;
import java.util.concurrent.TimeUnit;

/**
 * redis分布式锁工具类  简单版-默认使用一种锁 可重入锁
 *
 * @author ai-cloud
 */
@Component
public class RedisLock {
    @Autowired
    private RedissonClient redissonClient;

    /**
     * 获取锁
     *
     * @param lockKey 锁实例key
     * @return 锁信息
     */
    public RLock getRLock(String lockKey) {
        return redissonClient.getLock(lockKey);
    }

    /**
     * 加锁
     *
     * @param lockKey 锁实例key
     * @return 锁信息
     */
    public RLock lock(String lockKey) {
        RLock lock = getRLock(lockKey);
        lock.lock();
        return lock;
    }

    /**
     * 加锁
     *
     * @param lockKey   锁实例key
     * @param leaseTime 上锁后自动释放锁时间
     * @return true=成功；false=失败
     */
    public Boolean tryLock(String lockKey, long leaseTime) {
        return tryLock(lockKey, 0, leaseTime, TimeUnit.SECONDS);
    }

    /**
     * 加锁
     *
     * @param lockKey   锁实例key
     * @param leaseTime 上锁后自动释放锁时间
     * @param unit      时间颗粒度
     * @return true=加锁成功；false=加锁失败
     */
    public Boolean tryLock(String lockKey, long leaseTime, TimeUnit unit) {
        return tryLock(lockKey, 0, leaseTime, unit);
    }

    /**
     * 加锁
     *
     * @param lockKey   锁实例key
     * @param waitTime  最多等待时间
     * @param leaseTime 上锁后自动释放锁时间
     * @param unit      时间颗粒度
     * @return true=加锁成功；false=加锁失败
     */
    public Boolean tryLock(String lockKey, long waitTime, long leaseTime, TimeUnit unit) {
        RLock rLock = getRLock(lockKey);
        boolean tryLock = false;
        try {
            tryLock = rLock.tryLock(waitTime, leaseTime, unit);
        } catch (InterruptedException e) {
            return false;
        }
        return tryLock;
    }

    /**
     * 释放锁
     *
     * @param lockKey 锁实例key
     */
    public void unlock(String lockKey) {
        RLock lock = getRLock(lockKey);
        lock.unlock();
    }

    /**
     * 释放锁
     *
     * @param lock 锁信息
     */
    public void unlock(RLock lock) {
        lock.unlock();
    }

    public static void main(String[] args) {
        int[] arr= new int[]{1,2,8,6,2,1,3,4,5};

        for(int i=0;i<arr.length-1;i++){
            for(int j=0;j<arr.length-1-i;j++){
                int temp = 0;
                if(arr[j]<arr[j+1]){
                    temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                }
            }
        }
        System.out.println(Arrays.toString(arr));

    }
}
