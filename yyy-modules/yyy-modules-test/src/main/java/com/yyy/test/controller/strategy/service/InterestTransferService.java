package com.yyy.test.controller.strategy.service;


import com.yyy.test.controller.strategy.CodeEnum;
import com.yyy.test.controller.strategy.TransferService;
import org.springframework.stereotype.Service;

@Service
public class InterestTransferService implements TransferService {
    @Override
    public String transfer() {
        return "interest";
    }

    @Override
    public CodeEnum transCode() {
        return CodeEnum.INTEREST;
    }
}
