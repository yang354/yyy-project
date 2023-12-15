package com.yyy.test.controller.strategy.service;


import com.yyy.test.controller.strategy.CodeEnum;
import com.yyy.test.controller.strategy.TransferService;
import org.springframework.stereotype.Service;

@Service
public class UserTransferService implements TransferService {
    @Override
    public String transfer() {
        return "user";
    }

    @Override
    public CodeEnum transCode() {
        return CodeEnum.USER;
    }
}
