/*
 * Copyright (c) 2021-2031, 河北计全科技有限公司 (https://www.jeequan.com & jeequan@126.com).
 * <p>
 * Licensed under the GNU LESSER GENERAL PUBLIC LICENSE 3.0;
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.gnu.org/licenses/lgpl.html
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.yyy.rabbit.model;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.rabbitmq.client.Channel;
import com.yyy.rabbit.enums.MQSendTypeEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.amqp.core.Message;

import java.io.IOException;

/**
*
* 定义MQ消息格式
* 业务场景： [ 支付订单的商户通知消息 ]
*
* @author yyy

* @date 2021/7/22 15:25
*/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayOrderMchNotifyMQ extends AbstractMQ {

    /** 【！重要配置项！】 定义MQ名称  定义新的需改动**/
    public static final String MQ_NAME = "QUEUE_PAY_ORDER_MCH_NOTIFY";

    /** 内置msg 消息体定义  定义新的无需改动**/
    private MsgPayload payload;

    /**  【！重要配置项！】 定义Msg消息载体  定义新的需改动-根据需求填入**/
    @Data
    @AllArgsConstructor
    public static class MsgPayload {

        /** 通知单号 **/
        private Long notifyId;

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
    public static PayOrderMchNotifyMQ build(Long notifyId){
        /**  这里则根据传入的参数 new一个对象**/
        return new PayOrderMchNotifyMQ(new MsgPayload(notifyId));
    }

    /** 解析MQ消息， 一般用于接收MQ消息时   无需改动**/
    public static MsgPayload parse(String msg){
        return JSON.parseObject(msg, MsgPayload.class);
    }

    /** 定义 IMQReceiver 接口： 项目实现该接口则可接收到对应的业务消息    无需改动**/
    public interface IMQReceiver{
        void receive(MsgPayload payload, Message message, Channel channel) throws IOException;
    }

}
