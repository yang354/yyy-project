package com.yyy.common.core.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author yyy
 * @Date 2023/6/24 下午8:18
 */

@Data
public class SysMediaInfoVO implements Serializable {
    /**
     * 文件id
     */
    private String fileId;
    /**
     * 文件名称
     */
    private String fileName;

    /**
     * 链接
     */
    private String url;
}
