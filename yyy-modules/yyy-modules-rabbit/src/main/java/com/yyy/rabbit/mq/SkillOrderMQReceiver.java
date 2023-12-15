package com.yyy.rabbit.mq;

import com.rabbitmq.client.Channel;
import com.yyy.rabbit.IMQSender;
import com.yyy.rabbit.model.PayOrderMchNotifyMQ;
import com.yyy.rabbit.model.SkillOrderMQ;
import com.yyy.test.api.RemoteTestService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

/**
 * @Author yyy
 * @Date 2023/7/13 上午10:10
 */
@Slf4j
@Component
public class SkillOrderMQReceiver implements SkillOrderMQ.IMQReceiver  {
    @Autowired
    private IMQSender mqSender;
    @Resource
    private RemoteTestService remoteTestService;

    @Override
    public void receive(SkillOrderMQ.MsgPayload payload, Message message, Channel channel) {
        long deliveryTag = message.getMessageProperties().getDeliveryTag();
        try {
            //下单  远程调用下单服务
            remoteTestService.doOrder(payload.getOrderId());
            channel.basicAck(deliveryTag, false);  //false表示不批量确认消息
        }catch (Exception e) {
            log.error(e.getMessage(), e);
            return;
        }
    }
}
