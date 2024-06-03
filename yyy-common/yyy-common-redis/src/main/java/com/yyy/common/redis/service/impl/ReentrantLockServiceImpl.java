package com.yyy.common.redis.service.impl;

import com.yyy.common.redis.entity.LockInfo;
import com.yyy.common.redis.service.LockService;
import lombok.RequiredArgsConstructor;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import static org.springframework.beans.factory.config.BeanDefinition.SCOPE_PROTOTYPE;

/**
 * 可重入锁实现
 *
 * @author yyy 2019年1月14日下午4:38:51
 */
@Scope(SCOPE_PROTOTYPE)
@Service
@RequiredArgsConstructor   //@RequiredArgsConstructor：只会对被final修饰或者no-null修饰的字段完成对象注入。可以代替@Autowired注入bean对象
public class ReentrantLockServiceImpl implements LockService {

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
            RLock rLock = redissonClient.getLock(lockInfo.getName());

//            return rLock.tryLock(lockInfo.getWaitTime(), lockInfo.getLeaseTime(), lockInfo.getTimeUnit()); //等待阻塞

            //如果你自己自定义时间，超过这个时间，锁就会自定释放，并不会自动续期。
            return rLock.tryLock(0l,lockInfo.getLeaseTime(), lockInfo.getTimeUnit()); //不等待阻塞  60秒后自动释放锁

            //leaseTime 必须是 -1 才会开启 Watch Dog 机制，如果需要开启 Watch Dog 机制就必须使用默认的加锁时间为 30s。
//            return rLock.tryLock(0l,-1l, lockInfo.getTimeUnit()); //不等待阻塞 且打开看门狗机制



        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public void releaseLock() {
        LockInfo lockInfo = lockInfoThreadLocal.get();
        RLock rLock = redissonClient.getLock(lockInfo.getName());
        if (rLock.isHeldByCurrentThread()) {
            rLock.unlockAsync();
        }
        lockInfoThreadLocal.remove();
    }
}
