package com.yyy.test.api.factory;

import com.yyy.common.core.domain.R;
import com.yyy.test.api.RemoteTestService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * @Author yyy
 * @Date 2023/7/12 下午2:23
 */
@Component
public class RemoteTestFallbackFactory implements FallbackFactory<RemoteTestService> {
    private static final Logger log = LoggerFactory.getLogger(RemoteTestFallbackFactory.class);

    @Override
    public RemoteTestService create(Throwable throwable) {
        log.error("测试服务调用失败:{}", throwable.getMessage());
        return new RemoteTestService() {
            @Override
            public R doOrder(Long goodsId) {
                return R.fail("下订单失败:" + throwable.getMessage());
            }
            @Override
            public R testFeign(){
                return R.fail("测试调用失败:" + throwable.getMessage());
            }
        };

    }
}