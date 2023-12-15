package com.yyy.test.vo;

import lombok.Data;

import java.util.List;

/**
 * @Author yyy
 * @Date 2023/6/16 下午2:38
 */
@Data
public class CityEntityVO {
    private Long id;
    private String name;
    private Long pid;

    private List<CityEntityVO> subCityList;
}
