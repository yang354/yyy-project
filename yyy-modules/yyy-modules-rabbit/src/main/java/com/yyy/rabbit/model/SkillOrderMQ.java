package com.yyy.rabbit.model;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.rabbitmq.client.Channel;
import com.yyy.rabbit.enums.MQSendTypeEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.amqp.core.Message;

/**
 * @Author yyy
 * @Date 2023/7/13 上午9:51
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SkillOrderMQ  extends AbstractMQ {

    /** 【！重要配置项！】 定义MQ名称  定义新的需改动**/
    public static final String MQ_NAME = "QUEUE_SKILL_ORDER";

    /** 内置msg 消息体定义  定义新的无需改动**/
    private MsgPayload payload;

    /**  【！重要配置项！】 定义Msg消息载体  定义新的需改动-根据需求填入**/
    @Data
    @AllArgsConstructor
    public static class MsgPayload {

        /** 通知单号 **/
        private Long orderId;

    }

    /**  无需改动**/
    @Override
    public String getMQName() {
        return MQ_NAME;
    }

    /**  【！重要配置项！】  无需改动**/
    @Override
    public MQSendTypeEnum getMQType(){
        return MQSendTypeEnum.QUEUE;  // QUEUE - 点对点 、 BROADCAST - 广播模式
    }

    /**  无需改动**/
    @Override
    public String toMessage() {
        return JSONObject.toJSONString(payload);
    }

    /**  【！重要配置项！】 构造MQModel , 一般用于发送MQ时    根据上面的构造器传入**/
    public static SkillOrderMQ build(Long orderId){
        /**  这里则根据传入的参数 new一个对象**/
        return new SkillOrderMQ(new MsgPayload(orderId));
    }

    /** 解析MQ消息， 一般用于接收MQ消息时   无需改动**/
    public static MsgPayload parse(String msg){
        return JSON.parseObject(msg, MsgPayload.class);
    }

    /** 定义 IMQReceiver 接口： 项目实现该接口则可接收到对应的业务消息    无需改动**/
    public interface IMQReceiver{
        void receive(MsgPayload payload, Message message, Channel channel);
    }

}
