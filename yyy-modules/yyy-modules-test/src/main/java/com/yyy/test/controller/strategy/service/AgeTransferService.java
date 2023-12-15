package com.yyy.test.controller.strategy.service;

import com.yyy.test.controller.strategy.CodeEnum;
import com.yyy.test.controller.strategy.TransferService;
import org.springframework.stereotype.Service;

@Service
public class AgeTransferService implements TransferService {
    @Override
    public String transfer() {
        return "age";
    }

    @Override
    public CodeEnum transCode() {
        return CodeEnum.AGE;
    }
}


