package com.yyy.test.controller.factoryAndStrategy;

import cn.hutool.core.lang.Assert;
import com.yyy.test.controller.strategy.service.AgeTransferService;
import com.yyy.test.controller.strategy.service.InterestTransferService;
import com.yyy.test.controller.strategy.service.UserTransferService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author yzz
 * @Date 2023/12/29 下午3:52
 */

/**
 *
 * 场景一：上面的请假功能中，如果用户知道请假天数和审批人的对应关系，可以直接去找审批人请假，可以通过策略模式来实现
 * //具体策略类：请假三天-人事批   大于三天小于七天-部门经理批....
 */
@Api(tags = {"测试工厂模式结合策略设计模式"})
@Slf4j
@RestController
@RequestMapping("factorAndStrategy")
public class FactorAndStrategyController {

    @Autowired
    private PiQiuHandler piQiuHandler;

    @Autowired
    private WoNiuHandler woNiuHandler;

    @Autowired
    private NiuWaHandler niuWaHandler;

    @ApiOperation("测试1")
    @GetMapping("extracted1")
    public  void extracted1() {
        String nickName = "蜗牛";
        if ("皮球".equals(nickName)) {
            //业务逻辑 整合到方法里面处理
            piQiuHandler.AA("皮球");
        }else  if ("蜗牛".equals(nickName)){
            //业务逻辑
            woNiuHandler.AA("蜗牛");
        }else  if ("牛蛙".equals(nickName)){
            //业务逻辑
            niuWaHandler.AA("牛蛙");
        }
    }


    @ApiOperation("测试2")
    @GetMapping("extracted2")
    public void extracted2() {
//        String nickName = "牛蛙";
        String nickName = "aaa";
        AbstractHandler invokeStrategy = Factory2.getInvokeStrategy(nickName);
        Assert.notNull(invokeStrategy, "找不到对应的转换器");
        invokeStrategy.AA(nickName);
    }
}
