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
package com.yyy.rabbit.consumer;


import com.rabbitmq.client.Channel;
import com.yyy.rabbit.IMQMsgReceiver;
import com.yyy.rabbit.executor.MqThreadExecutor;
import com.yyy.rabbit.model.PayOrderMchNotifyMQ;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * rabbitMQ消息接收器：仅在vender=rabbitMQ时 && 项目实现IMQReceiver接口时 进行实例化
 * 业务：  支付订单商户通知
 *
 * @author yyy

 * @date 2021/7/22 17:06
 */
@Component
public class PayOrderMchNotifyRabbitMQReceiver implements IMQMsgReceiver {

    @Autowired
    private PayOrderMchNotifyMQ.IMQReceiver mqReceiver;

    /** 接收 【 queue 】 类型的消息 **/
    @Override
    @Async(MqThreadExecutor.EXECUTOR_PAYORDER_MCH_NOTIFY) //异步处理,不是用异步处理的话，监听到的消息会一条一条处理，等一条处理完了在来第二条
    @RabbitListener(queues = PayOrderMchNotifyMQ.MQ_NAME)
    public void receiveMsg(String msg,Message message, Channel channel) throws IOException {
        mqReceiver.receive(PayOrderMchNotifyMQ.parse(msg),message,channel);
    }

}
