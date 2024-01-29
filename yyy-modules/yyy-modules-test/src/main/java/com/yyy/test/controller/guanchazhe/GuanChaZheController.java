package com.yyy.test.controller.guanchazhe;

import com.alibaba.fastjson.JSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author yzz
 * @Date 2024/1/4 上午9:53
 */

/**
 * 需求
 * 摇号事件的通知场景
 *
 *主要解决： 一个对象状态改变给其他对象通知的问题，而且要考虑到易用和低耦合，保证高度的协作。
 *何时使用： 一个对象（目标对象）的状态发生改变，所有的依赖对象（观察者对象）都将得到通知，进行广播通知。
 *
 * 如何扩展
 * 1、创建监听器例如MQEventListener
 * 2、EventManager类的EventType增加事件枚举
 * 以上是公共模块
 * 3、开始实现业务  创建抽象类 例如LotteryService
 * 4、创建实现类 例如LotteryServiceImpl
 */
@Api(tags = {"测试观察者设计模式"})
@Slf4j
@RestController
@RequestMapping("guanChaZhe")
public class GuanChaZheController {

    @Autowired
    private LotteryService lotteryService;

    @ApiOperation("测试1")
    @GetMapping("test")
    public void test() {
//        LotteryServiceImpl lotteryService = new LotteryServiceImpl();
        LotteryResult result = lotteryService.draw("1234567");
        log.info("摇号结果：{}", JSON.toJSONString(result));
    }

}
