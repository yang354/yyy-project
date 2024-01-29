package com.yyy.test.controller.guanchazhe;

import jdk.nashorn.internal.objects.annotations.Constructor;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author yzz
 * @Date 2024/1/4 上午9:55
 */

@AllArgsConstructor
@Data
public class LotteryResult implements Serializable {

    private String uId;
    private String msg;
    private Date dateTime;

    //get set constructor...
}
