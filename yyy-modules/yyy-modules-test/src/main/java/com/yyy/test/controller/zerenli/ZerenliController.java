package com.yyy.test.controller.zerenli;

import cn.hutool.core.lang.Assert;
import com.yyy.test.controller.strategy.CodeEnum;
import com.yyy.test.controller.strategy.SearchTransformService;
import com.yyy.test.controller.strategy.TransferService;
import com.yyy.test.controller.strategy.service.AgeTransferService;
import com.yyy.test.controller.strategy.service.InterestTransferService;
import com.yyy.test.controller.strategy.service.UserTransferService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author yzz
 * @Date 2023/12/29 下午4:07
 */

/**
 * 策略模式与责任链的区别
 * 都能消除 if-else 分支过多的问题，策略模式的多种算法彼此之间是独立的，可自行更换策略算法，而责任链模式并不清楚其下一个节点处理对象，因为链式组装由客户端负责
 */
@Api(tags = {"测试责任链设计模式"})
@Slf4j
@RestController
@RequestMapping("zerenli")
public class ZerenliController {
    @Autowired
    private ValidateHandler validateHandler;

    @Autowired
    private LoginHandler loginHandler;

    @Autowired
    private AuthHandler authHandler;

    @Autowired
    private BusinessLogicHandler businessLogicHandler;


    @ApiOperation("测试1")
    @GetMapping("transform")
    public  void transform() {
        Handler.Builder builder = new Handler.Builder();
        //链式编程，谁在前谁在后看的清清楚楚
        builder.addHandler(validateHandler)
                .addHandler(loginHandler)
                .addHandler(authHandler)
                .addHandler(businessLogicHandler);
        User user = new User();
        user.setUserName("woniu");
        user.setPassWord("666");
        builder.build().doHandler(user);
    }
}
