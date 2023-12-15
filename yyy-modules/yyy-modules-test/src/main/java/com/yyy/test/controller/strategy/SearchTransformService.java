package com.yyy.test.controller.strategy;

import cn.hutool.core.lang.Assert;
import com.yyy.test.controller.factoryAndStrategy.AbstractHandler;
import com.yyy.test.controller.strategy.service.AgeTransferService;
import com.yyy.test.controller.strategy.service.InterestTransferService;
import com.yyy.test.controller.strategy.service.UserTransferService;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

//知道策略模式！但不会在项目里使用？
@Service
public class SearchTransformService implements InitializingBean {


    @Autowired
    private List<TransferService> transferServiceList;

    private static Map<CodeEnum, TransferService> transferServiceMap;

    @Override
    // 项目启动时将实现类放入到map中去
    public void afterPropertiesSet() throws Exception {
        transferServiceMap = transferServiceList
                .stream()
                .collect(Collectors.toMap(TransferService::transCode, Function.identity()));
    }


    public static TransferService getInvokeStrategy(CodeEnum codeEnum){
        return transferServiceMap.get(codeEnum);
    }





}
