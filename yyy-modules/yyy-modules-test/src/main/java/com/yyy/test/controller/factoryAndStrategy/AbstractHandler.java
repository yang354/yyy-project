package com.yyy.test.controller.factoryAndStrategy;

import org.springframework.beans.factory.InitializingBean;

/**
 * 策略模式
 * 使用抽象类方式  也可以使用 接口方式
 */
public abstract class AbstractHandler implements InitializingBean {
    public void AA(String nikeName) {
        throw new UnsupportedOperationException();
    }

}
