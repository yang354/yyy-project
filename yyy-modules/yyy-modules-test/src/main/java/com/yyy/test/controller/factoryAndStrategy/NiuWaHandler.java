package com.yyy.test.controller.factoryAndStrategy;

import org.springframework.stereotype.Component;

/**
 * @Author yzz
 * @Date 2023/12/14 上午9:36
 */
@Component
public class NiuWaHandler extends AbstractHandler{
    @Override
    public void AA(String nikeName) {
        //业务逻辑
        System.out.println("我是牛蛙");
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        Factory2.register("牛蛙",this);
    }
}