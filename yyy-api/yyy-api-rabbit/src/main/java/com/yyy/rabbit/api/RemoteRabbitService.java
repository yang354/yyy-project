package com.yyy.rabbit.api;



import com.yyy.common.core.constant.ServiceNameConstants;
import com.yyy.common.core.domain.R;
import com.yyy.rabbit.api.factory.RemoteRabbitFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


/**
 * 日志服务
 * 
* @author 羊扬杨
 */
@FeignClient(contextId = "remoteRabbitService", value = ServiceNameConstants.RABBIT_SERVICE, fallbackFactory = RemoteRabbitFallbackFactory.class)
public interface RemoteRabbitService {


    @GetMapping("/rabbitmq/sendSkillOrderMQ/{orderId}")
    public R sendSkillOrderMQ(@PathVariable("orderId") Long orderId);
    //注意远程调用接口最好加上合适的注解例如@PathVariable、@RequestParam等等，否则会报不支持GET请求或不支持POST请求等

}
