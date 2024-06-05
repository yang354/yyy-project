package com.yyy.test.api;

import com.yyy.common.core.constant.ServiceNameConstants;
import com.yyy.common.core.domain.R;
import com.yyy.test.api.factory.RemoteTestFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Author yyy
 * @Date 2023/7/12 下午2:24
 */
@FeignClient(contextId = "remoteTestService", value = ServiceNameConstants.TEST_SERVICE, fallbackFactory = RemoteTestFallbackFactory.class)
public interface RemoteTestService {

    @GetMapping(value = "/tSeckillOrder/doOrder/{goodsId}")
    public R doOrder(@PathVariable("goodsId") Long goodsId);
    //注意远程调用接口最好加上合适的注解例如@PathVariable、@RequestParam等等，否则会报不支持GET请求或不支持POST请求等


    @GetMapping(value = "/tSeckillOrder/testFeign")
    public R testFeign();
}
