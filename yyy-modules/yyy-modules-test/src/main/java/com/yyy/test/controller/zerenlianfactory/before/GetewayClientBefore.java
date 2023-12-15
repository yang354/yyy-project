package com.yyy.test.controller.zerenlianfactory.before;

import com.woniu.zerenlianfactorydemo.afteryouhua.ApiLimitGatewayHandler;
import com.woniu.zerenlianfactorydemo.afteryouhua.BlacklistGatewayHandler;
import com.woniu.zerenlianfactorydemo.afteryouhua.GatewayHandler;
import com.woniu.zerenlianfactorydemo.afteryouhua.SessionGatewayHandler;

/**
 * 我们可以通过链表将每一关连接起来，
 * 形成责任链的方式
 */
public class GetewayClientBefore {
    public static void main(String[] args) {
       //api接口限流  黑名单拦截  用户会话拦截

        GatewayHandler firstPassHandler = new ApiLimitGatewayHandler();
        GatewayHandler secondPassHandler = new BlacklistGatewayHandler();
        GatewayHandler thirdPassHandler = new SessionGatewayHandler();

        //第三步 设置校验顺序
        firstPassHandler.setNext(secondPassHandler);
        secondPassHandler.setNext(thirdPassHandler);

        //第四步 调用
        firstPassHandler.service();



        // 实现动态配置 从基础实现到第二步基础上 开始优化

    }
}
