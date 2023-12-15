package com.yyy.common.core.utils.excel;

/**
 * @Author yyy
 * @Date 2023/7/8 下午6:21
 */

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * 导出的Excel单元格样式设置
 */
public class ExcelStyleUtil {
    /**
     * 表头字体
     *
     * @return
     */
    public static Font headerFoot(XSSFWorkbook wb) {
        Font headerFont = wb.createFont();
        headerFont.setFontName("微软雅黑");
        headerFont.setFontHeightInPoints((short) 13);
        headerFont.setBold(true);
        headerFont.setColor(IndexedColors.BLACK.getIndex());
        return headerFont;
    }

    /**
     * 正文字体
     *
     * @param wb
     * @return
     */
    public static Font contextBlackFont(XSSFWorkbook wb) {
        Font contextFont = wb.createFont();
        contextFont.setFontName("微软雅黑");
//        contextFont.setFontHeightInPoints((short) 13);
//        contextFont.setBold(false);
        contextFont.setColor(IndexedColors.BLACK.getIndex());
        return contextFont;
    }

    /**
     * 正文字体
     *
     * @param wb
     * @return
     */
    public static Font contextRedFont(XSSFWorkbook wb) {
        Font contextFont = wb.createFont();
        contextFont.setFontName("微软雅黑");
//        contextFont.setFontHeightInPoints((short) 13);
//        contextFont.setBold(false);
        contextFont.setColor(IndexedColors.RED.getIndex());
        return contextFont;
    }


    /**
     * 表头样式-左右上下居中
     *
     * @param wb
     * @return
     */
    public static CellStyle headerStyle(XSSFWorkbook wb) {
        CellStyle headerStyle = wb.createCellStyle();
        Font font = headerFoot(wb);
        headerStyle.setFont(font);
        headerStyle.setAlignment(HorizontalAlignment.CENTER);//水平居中
        headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);//垂直居中
        headerStyle.setLocked(true);//锁定
        headerStyle.setWrapText(false);// 自动换行
        headerStyle.setBorderBottom(BorderStyle.THIN);//下边框
        headerStyle.setBorderTop(BorderStyle.THIN);//上边框
        headerStyle.setBorderLeft(BorderStyle.THIN);//左
        headerStyle.setBorderRight(BorderStyle.THIN);//右
        return headerStyle;
    }


    /**
     * 单元格样式 - 水平、垂直居中 黑色字体
     *
     * @param wb
     * @return
     */
    public static CellStyle contextAlignCenterStyleBlack(XSSFWorkbook wb) {

        CellStyle style = wb.createCellStyle();
        Font font = contextBlackFont(wb);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);//水平居中
        style.setVerticalAlignment(VerticalAlignment.CENTER);//垂直居中
//        style.setLocked(true);
//        style.setWrapText(true);// 自动换行
//        style.setBorderBottom(BorderStyle.THIN);//下边框
//        style.setBorderTop(BorderStyle.THIN);//上边框
//        style.setBorderLeft(BorderStyle.THIN);//左
//        style.setBorderRight(BorderStyle.THIN);//右
        return style;
    }

    /**
     * 单元格样式 - 水平、垂直居中、红色字体、有边框
     *
     * @param wb
     * @return
     */
    public static CellStyle contextAlignCenterStyleRed(XSSFWorkbook wb) {

        CellStyle style = wb.createCellStyle();
        Font font = contextRedFont(wb);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);//水平居中
        style.setVerticalAlignment(VerticalAlignment.CENTER);//垂直居中
//        style.setLocked(true);
//        style.setWrapText(true);// 自动换行
//        style.setBorderBottom(BorderStyle.THIN);//下边框
//        style.setBorderTop(BorderStyle.THIN);//上边框
//        style.setBorderLeft(BorderStyle.THIN);//左
//        style.setBorderRight(BorderStyle.THIN);//右
        return style;
    }

    /**
     * 单元格样式 - 水平、垂直居中、黑色字体、有边框
     * @param wb
     * @return
     */
    public static CellStyle contextNoLeftBorder(XSSFWorkbook wb){
        CellStyle style = wb.createCellStyle();
        Font font = contextBlackFont(wb);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);//水平居中
        style.setVerticalAlignment(VerticalAlignment.CENTER);//垂直居中
        style.setLocked(true);
        style.setWrapText(true);// 自动换行
        style.setBorderBottom(BorderStyle.THIN);//下边框
        style.setBorderTop(BorderStyle.THIN);//上边框
        style.setBorderRight(BorderStyle.THIN);//右
        return style;
    }
    /**
     * 单元格样式 - 水平、垂直居中、黑色字体、无左右边框
     * @param wb
     * @return
     */
    public static CellStyle contextNoLeftRightBorder(XSSFWorkbook wb){
        CellStyle style = wb.createCellStyle();
        Font font = contextBlackFont(wb);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);//水平居中
        style.setVerticalAlignment(VerticalAlignment.CENTER);//垂直居中
        style.setLocked(true);
        style.setWrapText(true);// 自动换行
        style.setBorderBottom(BorderStyle.THIN);//下边框
        style.setBorderTop(BorderStyle.THIN);//上边框
        return style;
    }
}