package com.yyy.system.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @Author yzz
 * @Date 2024/7/18 下午3:16
 */

@Data
public class AnalysisExcelResultDTO implements Serializable {
    @ApiModelProperty(value="成功数量",name="successNum")
    private Integer successNum;
    @ApiModelProperty(value="失败数量",name="errorNum")
    private Integer errorNum;
    @ApiModelProperty(value="文件内容",name="content")
    private byte[] content;
}