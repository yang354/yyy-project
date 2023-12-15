package com.yyy.rabbit.controller;


import com.yyy.common.core.domain.R;
import com.yyy.rabbit.IMQSender;
import com.yyy.rabbit.enums.DelayTypeEnum;
import com.yyy.rabbit.model.PayOrderMchNotifyMQ;
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
        mqSender.send(PayOrderMchNotifyMQ.build(20l));
//        mqSender.send(PayOrderMchNotifyMQ.build(20l),10);
        //
        //mqSender.send(ResetIsvMchAppInfoConfigMQ.build("5", "2", "6777", "888"));
        //注意广播方式的，延时不会生效
//        mqSender.send(ResetAppConfigMQ.build("abccccc"),10);

    }

    @GetMapping("/sendSkillOrderMQ/{orderId}")
    public R sendSkillOrderMQ(@PathVariable("orderId")Long orderId) {
        mqSender.send(SkillOrderMQ.build(orderId));
        return R.ok();
    }




}
