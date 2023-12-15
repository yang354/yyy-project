package com.yyy.test.controller.zerenlianfactory.afteryouhua;

//第二步 编写实现类
public class BlacklistGatewayHandler extends GatewayHandler {

    @Override
    public void service() {
        System.out.println("黑名单拦截");
        if (this.next != null) {
             this.next.service();
        }
    }
}
