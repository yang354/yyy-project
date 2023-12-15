package com.yyy.rabbit.config;

//import com.rabbitmq.client.ConnectionFactory;

import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
@Slf4j
public class RabbitMQConfiguration implements RabbitTemplate.ConfirmCallback
        , RabbitTemplate.ReturnCallback {


    @Bean
    public RabbitTemplate rabbitTemplate(ConnectionFactory connectionFactory){
        RabbitTemplate rabbitTemplate = new RabbitTemplate(connectionFactory);
        rabbitTemplate.setConfirmCallback(this);

        //开启了回退模式并设置了Mandatory，当消息从exchange发送到queue失败了，则会在消息回退到producer,并执行回调函数
        rabbitTemplate.setMandatory(true);
        rabbitTemplate.setReturnCallback(this);

        return rabbitTemplate;

    }


    /**
     * 交换机收到生产者发送消息后的回调函数
     * @param correlationData  给消息设置相关消息和全局消息id
     * @param ack
     * @param reason  交换机未收到消息的原因
     */
    @Override
    public void confirm(CorrelationData correlationData, boolean ack, String reason) {
        String id = correlationData != null ? correlationData.getId() : "";
        if (ack) {
            log.info("交换机收到消息，消息的id为："+ id);
        }else {
            log.info("交换机未收到消息，消息的id为："+ id + "原因是："+ reason);
        }

    }

    /**
     * 队列未收到交换机路由的消息时触发该函数
     * @param message  消息的内容
     * @param replyCode
     * @param replyContext  消息被退回的原因
     * @param exchange  交换机
     * @param routeKey
     *
     * 先使用死信延时队列这种的，当发消息时，是一定经过交换机然后到达延时队列，这种就不会触发这个函数，但是这个写法麻烦，要定义多个队列交换机
     * 所以我们使用mq的插件，但是这种延时发消息时，它只会到时间了就直接去死信队列，不会到队列中，所以不会触发这个函数，但是不会影响正常使用
     */
    @Override
    public void returnedMessage(Message message, int replyCode, String replyContext, String exchange, String routeKey) {
        log.error("交换机{}退回了消息{}，原因是{}，路由是{}",new String(message.getBody()),exchange,replyContext,routeKey);

//        spring_returned_message_correlation：所退回消息的唯一标识，可用于更新自定义的消息记录表
        log.info("消息的唯一标识："+message.getMessageProperties().getHeader("spring_returned_message_correlation").toString());
    }



}
