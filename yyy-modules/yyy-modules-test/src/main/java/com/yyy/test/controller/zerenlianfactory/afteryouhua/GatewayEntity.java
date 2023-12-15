package com.yyy.test.controller.zerenlianfactory.afteryouhua;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GatewayEntity {

    private Integer handlerId;

    private String name;

    private String conference;


    private Integer preHandlerId;

    private Integer nextHandlerId;
}