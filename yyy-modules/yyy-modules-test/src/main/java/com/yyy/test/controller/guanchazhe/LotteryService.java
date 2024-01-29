package com.yyy.test.controller.guanchazhe;

import com.yyy.test.controller.guanchazhe.listener.EventManager;
import com.yyy.test.controller.guanchazhe.listener.MQEventListener;
import com.yyy.test.controller.guanchazhe.listener.MessageEventListener;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Author yzz
 * @Date 2024/1/4 上午9:58
 */
//使用抽象类的方式实现方法，好处是可以在方法中扩展额外的调用，并提供抽象方法doDraw，让继承者去实现具体逻辑
public abstract class LotteryService {

    private EventManager eventManager;

    //这种引用会报空指针错误
//    @Autowired
//    private MQEventListener mqEventListener;
//    @Autowired
//    private MessageEventListener messageEventListener;

    //无参构造器
    public LotteryService() {
        //注册一个EventManager对象
        eventManager = new EventManager(EventManager.EventType.MQ, EventManager.EventType.Message);
        //订阅
//        eventManager.subscribe(EventManager.EventType.MQ, mqEventListener);
//        eventManager.subscribe(EventManager.EventType.Message, messageEventListener);
        //订阅
        eventManager.subscribe(EventManager.EventType.MQ, new MQEventListener());
        eventManager.subscribe(EventManager.EventType.Message, new MessageEventListener());
    }

    public LotteryResult draw(String uId) {
        //调用doDraw方法并返回它的结果
        LotteryResult lotteryResult = doDraw(uId);
        //通知
        eventManager.notify(EventManager.EventType.MQ, lotteryResult);
        eventManager.notify(EventManager.EventType.Message, lotteryResult);
        return lotteryResult;
    }

    protected abstract LotteryResult doDraw(String uId);
}
