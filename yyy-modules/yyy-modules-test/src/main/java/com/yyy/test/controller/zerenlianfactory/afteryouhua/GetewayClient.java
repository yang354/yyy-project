package com.yyy.test.controller.zerenlianfactory.afteryouhua;

/**
 * 用责任链模式 + 工厂模式 + 枚举，动态配置请求链并调用。
 */
//第六步
public class GetewayClient {
    public static void main(String[] args) {
        GatewayHandler firstGatewayHandler = GatewayHandlerEnumFactory.getFirstGatewayHandler();
        firstGatewayHandler.service();
    }
}