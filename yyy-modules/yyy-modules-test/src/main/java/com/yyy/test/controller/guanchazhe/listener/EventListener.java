package com.yyy.test.controller.guanchazhe.listener;

import com.yyy.test.controller.guanchazhe.LotteryResult;

/**
 * @Author yzz
 * @Date 2024/1/4 上午9:55
 */

public interface EventListener {

    void doEvent(LotteryResult result);

}