package com.yyy.common.redis.aspect;






import com.yyy.common.core.exception.ServiceException;
import com.yyy.common.redis.annotation.Lock;
import com.yyy.common.redis.entity.LockInfo;
import com.yyy.common.redis.factory.LockServiceFactory;
import com.yyy.common.redis.handler.LockInfoProvider;
import com.yyy.common.redis.service.LockService;
import lombok.RequiredArgsConstructor;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * 切面加锁处理
 *
 * @author yyy 2019年1月14日下午4:52:06
 */
@Aspect
@Component
@Order(0)
@RequiredArgsConstructor   //@RequiredArgsConstructor：只会对被final修饰或者no-null修饰的字段完成对象注入。可以代替@Autowired注入bean对象
public class LockAspect {

    private final LockInfoProvider lockInfoProvider;
    private final LockServiceFactory lockFactory;


    @Around(value = "@annotation(lock)")
    public Object around(ProceedingJoinPoint joinPoint, Lock lock) throws Throwable {
        // 获取锁信息
        LockInfo lockInfo = lockInfoProvider.getLockInfo(joinPoint, lock);
        // 获取锁服务
        LockService lockService = lockFactory.getLock(lock.lockType());
        // 若当前线程已经存在锁，不再添加新的锁
        if (lockService.getLockInfo() != null && !lockInfo.equals(lockService.getLockInfo())) {
            return joinPoint.proceed();
        }
        // 设置锁信息
        lockService.setLockInfo(lockInfo);
        boolean lockFlag = false;
        // 加锁
        try {

            boolean lockRes = lockService.lock();
            System.out.println(lockRes);
            if (lockRes) {
                // 加锁成功
                lockFlag = true;
                return joinPoint.proceed();
            } else {
                throw new ServiceException("获取锁失败，请勿重复操作");
            }
        } finally {
            if (lockFlag) {
                lockService.releaseLock();
                lockService.clearLockInfo();
            }
        }
    }
}