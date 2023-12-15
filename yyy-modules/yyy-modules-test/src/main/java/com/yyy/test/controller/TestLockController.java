package com.yyy.test.controller;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.system.UserInfo;
import com.yyy.common.core.domain.R;
import com.yyy.common.core.exception.ServiceException;
import com.yyy.common.redis.annotation.Lock;
import com.yyy.common.redis.annotation.LockKey;
import com.yyy.common.redis.constant.LockType;
import com.yyy.common.redis.utils.RedisLock;
import com.yyy.test.domain.AccountInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

/**
 * @Author yyy
 * @Date 2023/6/10 上午12:12
 */

@Api(tags = {"测试分布式锁功能"})
@Slf4j
@RestController
@RequestMapping("lcok")
public class TestLockController {

    @Resource
    private RedisLock redisLock;

    /**
     * 测试分布式锁 模拟同时下同一单  效果：加锁使用Lock，同一单的话只允许一单一单处理并且会等待阻塞
     */
    @ApiOperation("测试分布式锁")
    @GetMapping("/testLock")
    public R getLock(Long id){
        /*
        如何测试：如下
        两个请求同时进来，第一个请求获取锁，往下执行
        而第二个请求堵在了redisLock.lock("aaa");这个一行，等待第一个请求执行完并释放锁，第二个请求才能往下走
         */
        String key = "COURSE_ORDER_LOCK:"+id;
        try {
            redisLock.lock(key);
            System.out.println("aaaaa");
            try { TimeUnit.SECONDS.sleep(20); } catch (InterruptedException e) { e.printStackTrace(); }
        }finally {
            redisLock.unlock(key);
        }
        return R.ok("获取成功");
    }

    /**
     * 这种常用
     * 模拟同时下同一单  效果：加锁使用tryLock，同一单的话只允许一单一单处理并且不等待直接返回，不同单的话不影响； 然后如果不允许一个人下重复单可以再做判断
     */
    @ApiOperation("模拟同时下同一单")
    @GetMapping("/testUnLock")
    public R testUnLock(Long id){

        //String key = "COURSE_ORDER_LOCK"+studySchoolOrderVO.getSupportCourseId();
        String key = "COURSE_ORDER_LOCK:"+id;
        try {
            Boolean flag = redisLock.tryLock(key, 60); //设置了超时自动解锁，业务处理时间超过释放锁时间也会释放，给-1l触发看门狗机制
            if (flag){
                //todo  判断一个人是否重复下单  查看order_item
                System.out.println("业务逻辑");
                //try { TimeUnit.SECONDS.sleep(120); } catch (InterruptedException e) { e.printStackTrace(); }
                redisLock.unlock(key);
            } else {
                Assert.isTrue(false, "请勿重复操作!");
            }
        } catch (Exception e){
            redisLock.unlock(key);
            throw new ServiceException(e.getMessage());
        }
        return R.ok("");
    }


    //"分布式锁(暂停5秒)"
    @GetMapping("/lock5")
    @Lock(lockType = LockType.REENTRANT,keys="#id")  //这样自定义key名才能生效，如果在加了name=""，则会自定义key名会失效功能
    public String lock5( @LockKey Long id){
        log.info("开始");
        ThreadUtil.sleep(20, TimeUnit.SECONDS); //处理五秒
        log.info("结束");
        return "ok";
    }


    //"分布式锁(暂停5秒)"
    @PostMapping("/lock6")
    @Lock(lockType = LockType.REENTRANT,keys="#id")  //注意这里传参是对象还是单个字段，使用的还是对象里的字段，不用点出来
    public String lock6( @LockKey AccountInfo accountInfo){
        log.info("开始");
        System.out.println("aaaaaa~~~~~~~~~~~~~~~~~~~`");
        ThreadUtil.sleep(100, TimeUnit.SECONDS); //默认60秒自动释放锁，处理超过60秒，没有触发看门狗机制，在创建锁的地方leaseTime给-1l
        log.info("结束");
        return "ok";
    }

}
