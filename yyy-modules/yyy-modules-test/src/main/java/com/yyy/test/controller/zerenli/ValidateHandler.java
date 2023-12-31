package com.yyy.test.controller.zerenli;


import org.springframework.util.StringUtils;

public class ValidateHandler extends Handler {
    @Override
    public void doHandler(User user) {
        if (StringUtils.isEmpty(user.getUserName()) ||
                StringUtils.isEmpty(user.getPassWord())) {
            System.out.println("用户名和密码不能为空");
            return;
        }
        if (null != next) {
            next.doHandler(user);
        }
    }
}