package com.yyy.test.controller.strategy;

import cn.hutool.core.lang.Assert;
import com.yyy.test.controller.factoryAndStrategy.NiuWaHandler;
import com.yyy.test.controller.factoryAndStrategy.PiQiuHandler;
import com.yyy.test.controller.factoryAndStrategy.WoNiuHandler;
import com.yyy.test.controller.strategy.service.AgeTransferService;
import com.yyy.test.controller.strategy.service.InterestTransferService;
import com.yyy.test.controller.strategy.service.UserTransferService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Author yzz
 * @Date 2023/12/14 下午7:43
 */

public class Demo {


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


    /**
     * 根据不同的编码进行转换
     * @param code
     * @return
     */
    public  String transform(String code) {
        TransferService transferService = SearchTransformService.getInvokeStrategy(CodeEnum.of(code));
        Assert.notNull(transferService, "找不到对应的转换器");
        return transferService.transfer();
    }


    public static void main(String[] args) {
        //调用  这里只测试了使用抽象类的方式，接口的方式同理调用即可



    }




}
