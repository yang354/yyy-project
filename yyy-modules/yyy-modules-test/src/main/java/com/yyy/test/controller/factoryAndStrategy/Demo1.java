package com.yyy.test.controller.factoryAndStrategy;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * 用策略模式和工厂模式以及模板方法模式优化代码中的if else
 *
 * 如何扩展
 * 增加一个xxxHandler 继承 AbstractHandler
 */
public class Demo1 {

    public static void main(String[] args) {
       //调用  这里只测试了使用抽象类的方式，接口的方式同理调用即可
        extracted1();
        extracted2();
        extracted3();

    }

    //未优化前
    public static void extracted1() {
        String nickName = "蜗牛";
        if ("皮球".equals(nickName)) {
            //业务逻辑
            System.out.println("我是皮球");
        }else  if ("蜗牛".equals(nickName)){
            //业务逻辑
            System.out.println("我是蜗牛");
        }else  if ("牛蛙".equals(nickName)){
            //业务逻辑
            System.out.println("我是牛蛙");
        }
    }


    //方式二 优化二
    public static void extracted2() {
        String nickName = "蜗牛";
        if ("皮球".equals(nickName)) {
            //业务逻辑 整合到方法里面处理
            new PiQiuHandler().AA("皮球");
        }else  if ("蜗牛".equals(nickName)){
            //业务逻辑
            new WoNiuHandler().AA("蜗牛");
        }else  if ("牛蛙".equals(nickName)){
            //业务逻辑
            new NiuWaHandler().AA("牛蛙");
        }
    }


    //方式三 优化三
    private static void extracted3() {
        String nickName = "牛蛙";
        AbstractHandler invokeStrategy = Factory2.getInvokeStrategy(nickName);

        invokeStrategy.AA(nickName);
    }


}
