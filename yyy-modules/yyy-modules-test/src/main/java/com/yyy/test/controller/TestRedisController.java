package com.yyy.test.controller;

import com.yyy.common.core.annotation.CountTime;
import com.yyy.common.core.domain.R;
import com.yyy.common.redis.utils.RedisService;
import com.yyy.system.api.vo.SysUserVO;
import com.yyy.test.dto.UserDTO;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author yyy
 * @Date 2023/6/13 下午8:37
 */

@Api(tags = "测试redis功能")
@Slf4j
@RestController
@RequestMapping("redis")
public class TestRedisController {


    @Autowired
    private RedisService redisService;



    /**
     * 测试redis存值
     */
    @CountTime
    @Async
    @GetMapping("/testGetKey")
    public R getDept() throws InterruptedException {
        redisService.setCacheObject("课程数量","aaaaaa");
        SysUserVO user = new SysUserVO();
        Thread.sleep(1000);
        UserDTO userDTO = new UserDTO();
//        System.out.println(1/0);
//        redisService.incrBy("商品",5l);
//        redisService.decr("商品",1l);
        return R.ok("获取成功");
    }




    /**
     * 测试redis存值
     */
    @CountTime
    @Async
    @GetMapping("/testCount")
    public R testCount() throws InterruptedException {
        redisService.setCacheObject("课程数量",5);
        return R.ok("获取成功");
    }

    /**
     * 测试redis下单扣减库存
     */
    @GetMapping("/testCountDecr")
    public R testCountDecr() throws InterruptedException {
        Integer count = redisService.getCacheObject("课程数量");
        //可以增加判断库存是否售罄
        Thread.sleep(11000);

        redisService.decr("课程数量",1l);
        Integer count1 = redisService.getCacheObject("课程数量");
        System.out.println(count1+"   扣减库存结果");
        return R.ok("获取成功");
    }

    /**
     * 测试redis取消下单扣减回滚，没必要获取库存，直接+1即可
     */
    @GetMapping("/testCountIncr")
    public R testCountIncr() throws InterruptedException {
        Thread.sleep(6000);
        redisService.incrBy("课程数量",1l);

        Integer count1 = redisService.getCacheObject("课程数量");
        System.out.println(count1+"   扣减回滚结果");

        return R.ok("获取成功");
    }



}
