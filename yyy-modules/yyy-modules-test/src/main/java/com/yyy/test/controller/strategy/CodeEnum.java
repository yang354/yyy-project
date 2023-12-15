package com.yyy.test.controller.strategy;


import java.util.Arrays;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

public enum CodeEnum {

    USER("user"),
    AGE("age"),
    INTEREST("interest"),
    ;

    private String code;

    public String getCode() {
        return code;
    }

    CodeEnum(String code) {
        this.code = code;
    }

    private static final Map<String, CodeEnum> map = Arrays.stream(CodeEnum.values()).collect(Collectors.toMap(CodeEnum::getCode, Function.identity()));


    public static CodeEnum of(String code) {
        return map.get(code);
    }


}
