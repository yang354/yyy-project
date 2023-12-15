package com.yyy.common.core.utils.excel;

import java.io.Serializable;
import java.util.List;

/**
 * Author yyy
 * Date 2023/6/21 15:31
 * excel下拉框实体类
 */

public class CellDropdown implements Serializable {
    public List<String> getContents() {
        return contents;
    }

    public void setContents(List<String> contents) {
        this.contents = contents;
    }

    public Integer getColStartIndex() {
        return colStartIndex;
    }

    public void setColStartIndex(Integer colStartIndex) {
        this.colStartIndex = colStartIndex;
    }

    public Integer getColEndIndex() {
        return colEndIndex;
    }

    public void setColEndIndex(Integer colEndIndex) {
        this.colEndIndex = colEndIndex;
    }

    public Integer getRowStartIndex() {
        return rowStartIndex;
    }

    public void setRowStartIndex(Integer rowStartIndex) {
        this.rowStartIndex = rowStartIndex;
    }

    public Integer getRowEndIndex() {
        return rowEndIndex;
    }

    public void setRowEndIndex(Integer rowEndIndex) {
        this.rowEndIndex = rowEndIndex;
    }

    // 提示信息
    private List<String> contents;

    //起始列标
    private Integer colStartIndex;

    //结束列标
    private Integer colEndIndex;

    //起始行标
    private Integer rowStartIndex;

    //结束行标
    private Integer rowEndIndex;
}
