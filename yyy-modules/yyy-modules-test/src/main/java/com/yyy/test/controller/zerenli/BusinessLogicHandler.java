package com.yyy.test.controller.zerenli;

import org.springframework.stereotype.Component;

@Component
public class BusinessLogicHandler extends Handler {

    @Override
    public void doHandler(User user) {
        System.out.println("蜗牛好棒！");
    }
}