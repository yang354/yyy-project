package com.yyy.test.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.List;

/**
 * @Author yzz
 * @Date 2024/7/25 上午11:01
 */

@Data
public class FromRequestVO implements Serializable {
    private List<MultipartFile> files;

    private List<String> multiSelect;

    private String radio;
}
