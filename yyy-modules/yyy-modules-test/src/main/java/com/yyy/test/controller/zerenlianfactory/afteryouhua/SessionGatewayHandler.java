package com.yyy.test.controller.zerenlianfactory.afteryouhua;

//第二步 编写实现类
public class SessionGatewayHandler extends GatewayHandler {

    @Override
    public void service() {
        System.out.println("用户会话拦截");
        if (this.next != null) {
            this.next.service();
        }
    }
}
