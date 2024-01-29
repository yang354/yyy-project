package com.yyy.test.controller.guanchazhe;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @Author yzz
 * @Date 2024/1/4 上午9:59
 */

@Component
public class LotteryServiceImpl extends LotteryService{

    private MinibusTargetService minibusTargetService = new MinibusTargetService();

    @Override
    protected LotteryResult doDraw(String uId) {
        //摇号测试
        String lottery = minibusTargetService.lottery(uId);
        return new LotteryResult(uId, lottery, new Date());
    }
}
