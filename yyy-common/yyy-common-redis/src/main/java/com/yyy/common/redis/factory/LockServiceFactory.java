package com.yyy.common.redis.factory;



import cn.hutool.extra.spring.SpringUtil;
import com.yyy.common.redis.constant.LockType;
import com.yyy.common.redis.service.LockService;
import com.yyy.common.redis.service.impl.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.EnumMap;

/**
 * 锁处理工厂类
 *
 * @author yyy 2019年1月14日下午7:04:13
 */
@Service
@RequiredArgsConstructor   //@RequiredArgsConstructor：只会对被final修饰或者no-null修饰的字段完成对象注入。可以代替@Autowired注入bean对象
public class LockServiceFactory {

    private static final EnumMap<LockType, Class<?>> serviceMap = new EnumMap<>(LockType.class);

    static {
        serviceMap.put(LockType.REENTRANT, ReentrantLockServiceImpl.class);
        serviceMap.put(LockType.FAIR, FairLockServiceImpl.class);
        serviceMap.put(LockType.READ, ReadLockServiceImpl.class);
        serviceMap.put(LockType.WRITE, WriteLockServiceImpl.class);
        serviceMap.put(LockType.RED, RedLockServiceImpl.class);
    }

    /**
     * 根据类型进行不同的锁实现
     *
     * @param lockType 锁类
     * @return LockService
     */
    public LockService getLock(LockType lockType) {
        return (LockService) SpringUtil.getBean(serviceMap.get(lockType));
    }
}
