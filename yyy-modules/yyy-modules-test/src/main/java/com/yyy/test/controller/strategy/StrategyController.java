package com.yyy.test.controller.strategy;

import cn.hutool.core.lang.Assert;
import com.yyy.test.controller.strategy.service.AgeTransferService;
import com.yyy.test.controller.strategy.service.InterestTransferService;
import com.yyy.test.controller.strategy.service.UserTransferService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author yzz
 * @Date 2023/12/29 下午3:47
 */
/**
 * 策略模式与责任链的区别
 * 都能消除 if-else 分支过多的问题，策略模式的多种算法彼此之间是独立的，可自行更换策略算法，而责任链模式并不清楚其下一个节点处理对象，因为链式组装由客户端负责
 */
@Api(tags = {"测试策略设计模式"})
@Slf4j
@RestController
@RequestMapping("strategy")
public class StrategyController {


    @Autowired
    private UserTransferService userTransferService;

    @Autowired
    private AgeTransferService ageTransferService;

    @Autowired
    private InterestTransferService interestTransferService;

    /**
     * 根据不同的编码进行转换
     * @param code
     * @return
     */
    @ApiOperation("测试1")
    @PostMapping("transform")
    public  String transform(String code) {
        TransferService transferService = SearchTransformService.getInvokeStrategy(CodeEnum.of(code));
        Assert.notNull(transferService, "找不到对应的转换器");
        return transferService.transfer();
    }


    /**
     * 根据不同的编码进行转换
     * @param code
     * @return
     */
    @ApiOperation("测试2")
    @PostMapping("transform2")
    public String transform2(String code) {
        if(code.equals("user")){
            return userTransferService.transfer();
        }else if(code.equals("age")){
            return ageTransferService.transfer();
        }else if(code.equals("interest")){
            return interestTransferService.transfer();
        }
        return "";
    }
}
