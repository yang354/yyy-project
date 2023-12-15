package com.yyy.rabbit.consumer;

import com.rabbitmq.client.Channel;
import com.yyy.rabbit.IMQMsgReceiver;
import com.yyy.rabbit.executor.MqThreadExecutor;
import com.yyy.rabbit.model.PayOrderMchNotifyMQ;
import com.yyy.rabbit.model.SkillOrderMQ;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

/**
 * @Author yyy
 * @Date 2023/7/13 上午10:07
 */
@Component
public class SkillOrderRabbitMQReceiver implements IMQMsgReceiver {
    @Autowired
    private SkillOrderMQ.IMQReceiver mqReceiver;

    /** 接收 【 queue 】 类型的消息 **/
    @Override
    @RabbitListener(queues = SkillOrderMQ.MQ_NAME)
    public void receiveMsg(String msg, Message message, Channel channel){
        mqReceiver.receive(SkillOrderMQ.parse(msg),message,channel);
    }
}
