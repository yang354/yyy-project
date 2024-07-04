package com.yyy.rabbit.controller;


import com.yyy.common.core.domain.R;
import com.yyy.rabbit.IMQSender;
import com.yyy.rabbit.enums.DelayTypeEnum;
import com.yyy.rabbit.model.PayOrderMchNotifyMQ;
import com.yyy.rabbit.model.ResetAppConfigMQ;
import com.yyy.rabbit.model.SkillOrderMQ;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.Objects;

@Slf4j
@RestController
@RequestMapping("rabbitmq")
public class RabbitController {


    @Autowired
    private IMQSender mqSender;



    @GetMapping("/sendtestMQ2")
    public void sendtestMQ2() {
        mqSender.send(PayOrderMchNotifyMQ.build(20l));  //测试点对点模式 有异步注解时的效果
//        mqSender.send(PayOrderMchNotifyMQ.build(20l),10);  //测试点对点模式 有异步注解且延时时的效果


//        mqSender.send(ResetAppConfigMQ.build("abccccc"),10); //测试广播模式，注意广播方式的，延时不会生效

    }

    @GetMapping("/sendSkillOrderMQ/{orderId}")
    public R sendSkillOrderMQ(@PathVariable("orderId")Long orderId) {
        mqSender.send(SkillOrderMQ.build(orderId));  //测试点对点模式 没有有异步注解时的效果
//        mqSender.send(SkillOrderMQ.build(orderId),10);  //测试点对点模式 没有有异步注解且延时时的效果
        return R.ok();
    }




}
