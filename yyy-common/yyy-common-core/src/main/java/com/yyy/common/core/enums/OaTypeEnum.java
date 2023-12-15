package com.yyy.common.core.enums;

/**
 * @Author yyy
 * @Date 2023/6/23 下午10:12
 */

public enum OaTypeEnum {

    WECHAT_PAYMENT(0,"病假"),
    BANK_CARD_PAYMENT(1,"事假"),
    CASH_PAYMENT(2,"其他");



    private int value;
    private String text;

    OaTypeEnum(int value, String text) {
        this.value = value;
        this.text = text;
    }

    public int getValue() {
        return value;
    }

    public String getText() {
        return text;
    }


    public static String getText(int value) {
        OaTypeEnum target = OaTypeEnum.getByValue(value);
        if (null != target) {
            return target.text;
        }
        return "";
    }

    public static OaTypeEnum getByValue(int value) {
        for (OaTypeEnum st : OaTypeEnum.values()) {
            if (st.value == value) {
                return st;
            }
        }
        return null;
    }
}
