package com.yyy.rabbit.api.factory;

import com.yyy.common.core.domain.R;
import com.yyy.rabbit.api.RemoteRabbitService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * @Author yyy
 * @Date 2023/7/12 下午2:09
 */
@Component
public class RemoteRabbitFallbackFactory implements FallbackFactory<RemoteRabbitService> {
    private static final Logger log = LoggerFactory.getLogger(RemoteRabbitFallbackFactory.class);

    @Override
    public RemoteRabbitService create(Throwable throwable) {
        log.error("消息队列服务调用失败:{}", throwable.getMessage());
        return new RemoteRabbitService() {
            @Override
            public R sendSkillOrderMQ(Long orderId) {
                return R.fail("发送消息失败:" + throwable.getMessage());
            }
        };

    }
}