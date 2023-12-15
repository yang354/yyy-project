package com.yyy.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 系统媒体信息表
 * </p>
 *
 * @author yyyz
 * @since 2023-06-24
 */
@Data
@TableName("sys_media_info")
public class SysMediaInfo implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

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

    /**
     * 文件大小
     */
    private String size;

    /**
     * 0-图片;1-视频;2-PDF;3-PPT;4-word文档;5-excel
     */
    private Integer type;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;

    /**
     * 创建者
     */
    private String createBy;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 更新者
     */
    private String updateBy;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /**
     * 备注
     */
    private String remark;


}
