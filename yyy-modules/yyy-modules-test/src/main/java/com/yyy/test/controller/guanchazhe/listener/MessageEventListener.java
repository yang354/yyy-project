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
public class MessageEventListener implements EventListener{

    private Logger logger = LoggerFactory.getLogger(MessageEventListener.class);

    @Override
    public void doEvent(LotteryResult result) {
        logger.info("给用户 {} 发送短信通知(短信)：{}", result.getUId(), result.getMsg());
    }
}

