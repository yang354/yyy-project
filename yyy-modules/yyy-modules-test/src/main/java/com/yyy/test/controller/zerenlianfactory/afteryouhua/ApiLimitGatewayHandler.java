package com.yyy.test.controller.zerenlianfactory.afteryouhua;

//第二步 编写实现类
public class ApiLimitGatewayHandler extends GatewayHandler {

    @Override
    public void service() {
        System.out.println("api接口限流");
        if (this.next != null) {
            this.next.service();
        }
    }
}
