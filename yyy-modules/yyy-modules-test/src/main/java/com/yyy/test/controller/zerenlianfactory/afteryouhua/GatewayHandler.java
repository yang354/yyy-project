package com.yyy.test.controller.zerenlianfactory.afteryouhua;


//第一步 编写抽象接口
public abstract class GatewayHandler {

    /**
     * 下一关用当前抽象类来接收
     */
    protected GatewayHandler next;

    public void setNext(GatewayHandler next) {
        this.next = next;
    }

    public abstract void service();
}

