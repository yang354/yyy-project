package com.yyy.test.controller.guanchazhe.listener;

import com.yyy.test.controller.guanchazhe.LotteryResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * @Author yzz
 * @Date 2024/1/4 上午9:56
 */

@Component
public class MQEventListener implements EventListener{

    private Logger logger = LoggerFactory.getLogger(MQEventListener.class);

    @Override
    public void doEvent(LotteryResult result) {
        logger.info("记录用户 {} 摇号结果(MQ)：{}", result.getUId(), result.getMsg());
    }
}
