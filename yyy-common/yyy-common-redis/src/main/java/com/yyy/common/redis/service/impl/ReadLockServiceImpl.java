package com.yyy.common.redis.service.impl;


import com.yyy.common.redis.entity.LockInfo;
import com.yyy.common.redis.service.LockService;
import lombok.RequiredArgsConstructor;
import org.redisson.api.RReadWriteLock;
import org.redisson.api.RedissonClient;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import static org.springframework.beans.factory.config.BeanDefinition.SCOPE_PROTOTYPE;

/**
 * 读锁实现
 *
 * @author yyy 2019年1月14日下午7:23:12
 */
@Scope(SCOPE_PROTOTYPE)
@Service
@RequiredArgsConstructor   //@RequiredArgsConstructor：只会对被final修饰或者no-null修饰的字段完成对象注入。可以代替@Autowired注入bean对象
public class ReadLockServiceImpl implements LockService {

    private final RedissonClient redissonClient;

    private final ThreadLocal<LockInfo> lockInfoThreadLocal = new ThreadLocal<>();

    @Override
    public void setLockInfo(LockInfo lockInfo) {
        lockInfoThreadLocal.set(lockInfo);
    }

    @Override
    public LockInfo getLockInfo() {
        return lockInfoThreadLocal.get();
    }

    @Override
    public void clearLockInfo() {
        lockInfoThreadLocal.remove();
    }

    @Override
    public boolean lock() {
        LockInfo lockInfo = lockInfoThreadLocal.get();
        try {
            RReadWriteLock rLock = redissonClient.getReadWriteLock(lockInfo.getName());
            return rLock.readLock().tryLock(lockInfo.getWaitTime(), lockInfo.getLeaseTime(), lockInfo.getTimeUnit());
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public void releaseLock() {
        LockInfo lockInfo = lockInfoThreadLocal.get();
        RReadWriteLock rLock = redissonClient.getReadWriteLock(lockInfo.getName());
        if (rLock.readLock().isHeldByCurrentThread()) {
            rLock.readLock().unlockAsync();
        }
        lockInfoThreadLocal.remove();
    }
}
