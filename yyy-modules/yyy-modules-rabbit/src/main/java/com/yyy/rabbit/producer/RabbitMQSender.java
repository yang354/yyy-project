package com.yyy.rabbit.producer;

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



import com.yyy.common.core.utils.uuid.UUID;
import com.yyy.rabbit.IMQSender;
import com.yyy.rabbit.config.RabbitMQConfig;
import com.yyy.rabbit.enums.MQSendTypeEnum;
import com.yyy.rabbit.model.AbstractMQ;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *  rabbitMQ 消息发送器的实现
 *
 * @author yyy

 * @date 2021/7/23 16:52
 */
@Component
public class RabbitMQSender implements IMQSender {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Override
    public void send(AbstractMQ mqModel) {
        CorrelationData correlationData = new CorrelationData(UUID.randomUUID().toString());
        if(mqModel.getMQType() == MQSendTypeEnum.QUEUE){

            rabbitTemplate.convertAndSend(RabbitMQConfig.DELAYED_EXCHANGE_NAME,mqModel.getMQName(), mqModel.toMessage(),correlationData);
        }else{

            // fanout模式 的 routeKEY 没意义。
            this.rabbitTemplate.convertAndSend(
                    RabbitMQConfig.FANOUT_EXCHANGE_NAME_PREFIX + mqModel.getMQName(), null, mqModel.toMessage(),correlationData);
        }
    }

    @Override
    public void send(AbstractMQ mqModel, int delay) {

        CorrelationData correlationData = new CorrelationData(UUID.randomUUID().toString());
        System.out.println(correlationData.toString()+"::::");
        if(mqModel.getMQType() == MQSendTypeEnum.QUEUE){

            rabbitTemplate.convertAndSend(RabbitMQConfig.DELAYED_EXCHANGE_NAME, mqModel.getMQName(), mqModel.toMessage(), messagePostProcessor ->{
                messagePostProcessor.getMessageProperties().setDelay(Math.toIntExact(delay * 1000));
                return messagePostProcessor;
            },correlationData);
        }else{

            // fanout模式 的 routeKEY 没意义。  没有延迟属性
            this.rabbitTemplate.convertAndSend(
                    RabbitMQConfig.FANOUT_EXCHANGE_NAME_PREFIX + mqModel.getMQName(), null, mqModel.toMessage(),correlationData);
        }
    }

}
