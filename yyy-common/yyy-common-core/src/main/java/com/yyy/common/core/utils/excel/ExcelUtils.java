package com.yyy.common.core.utils.excel;


import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;


public class ExcelUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(ExcelUtils.class);



    //合并单元格 主要语法
    //示例：从0行开始到0行结束 （第一行），从第0列到第18列（跨19列）。
    //sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 18));
    public static void setMergedRegion(XSSFWorkbook wb, int sheetIndex, List<List<Integer>> lists) {
        XSSFSheet sheet = wb.getSheetAt(sheetIndex);
        for (int i = 0; i < lists.size(); i++) {

            List<Integer> addOneRowData = lists.get(i);
            sheet.addMergedRegion(new CellRangeAddress(addOneRowData.get(0), addOneRowData.get(1), addOneRowData.get(2), addOneRowData.get(3)));
        }
    }



    /**
     * @param wb
     * @param sheetIndex
     * @param lists      内容
     * @param num        偏移数
     */
    public static void createRow(XSSFWorkbook wb, int sheetIndex, List<List<String>> lists, int num) {
        //单元格样式1
        CellStyle cellStyle1 = ExcelStyleUtil.contextAlignCenterStyleRed(wb);
        //单元格样式2
        CellStyle cellStyle2 = ExcelStyleUtil.contextAlignCenterStyleBlack(wb);

        XSSFSheet sheet = wb.getSheetAt(sheetIndex);

        // 增加逻辑来准确找到最后一个非空行
        int lastNonEmptyRowNum = sheet.getLastRowNum();
        for (int i = lastNonEmptyRowNum; i >= 0; i--) {
            Row row = sheet.getRow(i);
            if (row != null && !isRowEmpty(row)) {
                lastNonEmptyRowNum = i;
                break;
            }
        }
//        System.out.println("lastNonEmptyRowNum~~~~"+lastNonEmptyRowNum);
        // 根据num参数决定是否需要额外偏移  Excel的行索引是从0开始的
        int lastRowNum = lastNonEmptyRowNum + (num > 0 ? num : 0);

        for (int i = 0; i < lists.size(); i++) {
            Row row = sheet.createRow(++lastRowNum); //即先加1，再使用值
            List<String> addOneRowData = lists.get(i);
            for (int j = 0; j < addOneRowData.size(); j++) {
                Cell cell = row.createCell(j);
                cell.setCellValue(addOneRowData.get(j));
                cell.setCellStyle(j == 0 ? cellStyle1 : cellStyle2);
            }
        }

    }

    private static boolean isRowEmpty(Row row) {
        for (int c = row.getFirstCellNum(); c < row.getLastCellNum(); c++) {
            Cell cell = row.getCell(c, Row.MissingCellPolicy.RETURN_NULL_AND_BLANK);
            if (cell != null && cell.getCellType() != CellType.BLANK) {
                return false; // 如果有任何非空单元格，行不为空
            }
        }
        return true; // 所有单元格要么为空，要么是BLANK类型，认为行为空
    }


    /**
     * 创建Excel文件   常用
     *
     * @param lists
     * @return
     */
    public static byte[] createExcelFile(List<List<String>> lists) {
        return createExcelFile(null, lists, null, null, null, null);
    }

    /**
     * 创建Excel文件  常用
     *
     * @param lists
     * @param sheetName
     * @return
     */
    public static byte[] createExcelFile(List<List<String>> lists, String sheetName) {
        return createExcelFile(null, lists, null, null, sheetName, null);
    }

    /**
     * 新建Excel文件
     *
     * @param excelPath  excel文件路径，传空则新建Excel文件
     * @param lists      内容列表
     * @param sheetIndex 代表第几个工作表
     * @param startRow   开始行，有传excelPath才传该参数，用于复制已有文件的格式
     * @param sheetName  命名工作表的名称
     * @param titleName  命名标题名称，有传excelPath才传该参数，设置第一行第一个单元格为标题
     * @return
     */
    public static byte[] createExcelFile(String excelPath, List<List<String>> lists, Integer sheetIndex, Integer startRow, String sheetName, String titleName) {
        if (CollectionUtils.isEmpty(lists)) {
            throw new RuntimeException("数据不能为空！");
        }
        XSSFWorkbook wb = null;
        ByteArrayOutputStream baos = null;//构建字节输出流
        try {
            if (StringUtils.isEmpty(excelPath)) {
                wb = new XSSFWorkbook();
            } else {
                ClassPathResource classPathResource = new ClassPathResource(excelPath);
                InputStream in = classPathResource.getInputStream();
                wb = new XSSFWorkbook(in);
                IOUtils.closeQuietly(in);
            }
            //创建文件内容
            Integer sheetNewIndex = createContent(wb, sheetIndex, lists, startRow);
            //设置工作表名称
            if (!StringUtils.isEmpty(sheetName)) {
                wb.setSheetName(sheetNewIndex, sheetName);
            }
            //设置标题名称
            if (!StringUtils.isEmpty(titleName)) {
                XSSFSheet sheet = wb.getSheetAt(sheetNewIndex);
                Row rowz = sheet.getRow(0);
                Cell cellz = rowz.getCell(0);
                cellz.setCellValue(titleName);
            }
            baos = new ByteArrayOutputStream();//构建字节输出流
            wb.write(baos);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(baos);
            IOUtils.closeQuietly(wb);
        }
        return baos.toByteArray();
    }


    /**
     * 创建Excel内容
     */
    private static Integer createContent(XSSFWorkbook wb, Integer sheetIndex, List<List<String>> lists, Integer startRow) {
        int numberOfSheets = wb.getNumberOfSheets();
        if (sheetIndex != null && sheetIndex < numberOfSheets) {
            createRowOfHasSheet(wb, sheetIndex, lists, startRow);
            return sheetIndex;
        } else {
            createRowOfHasNotSheet(wb, sheetIndex, lists, startRow);
            return 0;
        }
    }

    /**
     * 创建已经存在的工作表行内容
     */
    public static void createRowOfHasSheet(XSSFWorkbook wb, Integer sheetIndex, List<List<String>> lists, Integer startRow) {
        XSSFSheet sheet = wb.getSheetAt(sheetIndex);
        int rowNum = sheet.getLastRowNum();
        if (startRow == null || startRow < 0) {
            startRow = 0;
        }
        int j = startRow;
        Row row;
        for (List<String> list : lists) {
            if (j > rowNum) {
                row = sheet.createRow(j++);
                row.setRowStyle(sheet.getRow(j - startRow).getRowStyle());
                row.setHeight(sheet.getRow(j - startRow).getHeight());
            } else {
                row = sheet.getRow(j++);
            }
            for (int i = 0; i < list.size(); i++) {
                try {
                    Cell cell;
                    if (i >= row.getLastCellNum()) {
                        cell = row.createCell(i);
                        cell.setCellStyle(sheet.getRow(j - startRow).getCell(i).getCellStyle());
                    } else {
                        cell = row.getCell(i);
                    }
                    cell.setCellValue(list.get(i));
                } catch (Exception e) {
                }
            }
        }
    }

    /**
     * 创建不存在的工作表行内容
     */
    public static void createRowOfHasNotSheet(XSSFWorkbook wb, Integer sheetIndex, List<List<String>> lists, Integer startRow) {
        XSSFSheet sheet = wb.createSheet();
        if (startRow == null || startRow < 0) {
            startRow = 0;
        }
        int j = startRow;
        Row row;
        for (List<String> list : lists) {
            row = sheet.createRow(j++);
            for (int i = 0; i < list.size(); i++) {
                try {
                    Cell cell = row.createCell(i);
                    cell.setCellValue(list.get(i));
                } catch (Exception e) {
                }
            }
        }
    }


    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

    /**
     * 读取Excel文件   常用例如读取文件内容进行导出数据具体看
     *
     * @param in
     * @param sheetIndex
     * @return
     */
    public static List<List<String>> getExcelContent(InputStream in, Integer sheetIndex) {
        return getExcelContent(in, sheetIndex, null, null);
    }

    /**
     * 读取Excel文件
     *
     * @param in         文件输入流
     * @param sheetIndex 代表读取第几个工作表(第一个表为0)
     * @param readRowNum 期望读取的行数，传null则读取所有有效行数(第一行为0)
     * @param readColNum 期望读取的列数，传null则读取所有有效列数(第一列为0)
     * @return
     */
    public static List<List<String>> getExcelContent(InputStream in, Integer sheetIndex, Integer readRowNum, Integer readColNum) {
        XSSFWorkbook wb = null;
        List<List<String>> lists = new LinkedList<>();
        try {
            wb = new XSSFWorkbook(in);
            if (wb == null) {
                return null;
            }
            //获取最后一个工作表
            int numberOfSheets = wb.getNumberOfSheets();
            if (sheetIndex == null || sheetIndex >= numberOfSheets) {
                return null;
            }
            XSSFSheet sheet = wb.getSheetAt(sheetIndex);
            //获取最后一行
            int rowNum = sheet.getLastRowNum();
            if (readRowNum != null) {
                rowNum = rowNum < readRowNum ? rowNum : readRowNum;
            }
            if (readColNum == null) {
                for (int i = 0; i <= rowNum; i++) {
                    //获取该行的最后一列
                    int colNum = sheet.getRow(i).getLastCellNum();
                    if (colNum > 0) {
                        List<String> list = new LinkedList<>();
                        for (int j = 0; j < colNum; j++) {
                            try {
                                Cell cell = sheet.getRow(i).getCell(j);
                                if (cell == null) {
                                    list.add(null);
                                } else {
                                    cell.setCellType(CellType.STRING);
                                    list.add(cell.toString());
                                }
                            } catch (Exception e) {
                            }
                        }
                        lists.add(list);
                    }
                }
            } else {
                for (int i = 0; i <= rowNum; i++) {
                    //获取该行的最后一列
                    int colNum = readColNum;
                    if (colNum > 0) {
                        List<String> list = new LinkedList<>();
                        for (int j = 0; j < colNum; j++) {
                            try {
                                Cell cell = sheet.getRow(i).getCell(j);
                                if (cell == null) {
                                    list.add(null);
                                } else {
                                    cell.setCellType(CellType.STRING);
                                    list.add(cell.toString());
                                }
                            } catch (Exception e) {
                            }
                        }
                        lists.add(list);
                    }
                }
            }
            return lists;
        } catch (IOException e) {
            LOGGER.info("====={}", e);
//            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(wb);
            IOUtils.closeQuietly(in);
        }
        return null;
    }

    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`

    /**
     * 设置下拉框
     * @param wb
     * @param sheetIndex
     * @param cellDropdownList
     */
    public static void setCellDropdownList(XSSFWorkbook wb,int sheetIndex, List<CellDropdown> cellDropdownList) {
        XSSFSheet sheet = wb.getSheetAt(sheetIndex);
        Integer index = 1;
        for (int i = 0; i < cellDropdownList.size(); i++) {

            CellDropdown cellDropdown = cellDropdownList.get(i);
//            XSSFDataValidationHelper dvHelper = new XSSFDataValidationHelper(sheet);
//            XSSFDataValidationConstraint dvConstraint = (XSSFDataValidationConstraint) dvHelper.createExplicitListConstraint(cellDropdown.getContents().toArray(new String[cellDropdown.getContents().size()]));
//            CellRangeAddressList addressList = null;
//            XSSFDataValidation validation = null;
//            addressList = new CellRangeAddressList( cellDropdown.getRowStartIndex() == null ? 0 : cellDropdown.getRowStartIndex(),
//                    cellDropdown.getRowEndIndex() == null ? 65535 : cellDropdown.getRowEndIndex(),
//                    cellDropdown.getColStartIndex(), cellDropdown.getColEndIndex());// 开始结束行，index表示开始和结束列
//            validation = (XSSFDataValidation) dvHelper.createValidation(dvConstraint, addressList);
//            // 这两行设置单元格只能是列表中的内容，否则报错
//            if (validation instanceof XSSFDataValidation) {
//                // 数据校验
//                validation.setSuppressDropDownArrow(true);
//                validation.setShowErrorBox(true);
//            } else {
//                validation.setSuppressDropDownArrow(false);
//            }
//            sheet.addValidationData(validation);
            setLongHSSFValidation(wb, sheet, cellDropdown.getContents().toArray(new String[cellDropdown.getContents().size()]), cellDropdown.getRowStartIndex() == null ? 0 : cellDropdown.getRowStartIndex(),
                    cellDropdown.getRowEndIndex() == null ? 65535 : cellDropdown.getRowEndIndex(),
                    cellDropdown.getColStartIndex(), index++);
        }
        ;
    }

    /**
     * 解决下拉框过长不显示问题
     *
     * @param workbook
     * @param deptList   下拉数据数组
     * @param sheet
     * @param firstRow   开始行
     * @param endRow     结束行
     * @param cellNum    下拉框所在的列
     * @param sheetIndex 隐藏sheet名称
     */
    public static void setLongHSSFValidation(XSSFWorkbook workbook, XSSFSheet sheet, String[] deptList, int firstRow, int endRow, int cellNum, int sheetIndex) {
        String hiddenName = "hidden" + cellNum;
        //1.创建隐藏的sheet页。
        XSSFSheet hidden = workbook.createSheet(hiddenName);
        //2.循环赋值（为了防止下拉框的行数与隐藏域的行数相对应，将隐藏域加到结束行之后）
        for (int i = 0, length = deptList.length; i < length; i++) {
            hidden.createRow(1000 + i).createCell(cellNum).setCellValue(deptList[i]);
        }
        Name category1Name = workbook.createName();
        category1Name.setNameName(hiddenName);
        //3 A1:A代表隐藏域创建第N列createCell(N)时。以A1列开始A行数据获取下拉数组
        category1Name.setRefersToFormula(hiddenName + "!A1:A" + endRow);
        //
        DataValidationHelper helper = sheet.getDataValidationHelper();
        DataValidationConstraint constraint = helper.createFormulaListConstraint(hiddenName);
        CellRangeAddressList addressList = new CellRangeAddressList(firstRow, endRow, cellNum, cellNum);
        DataValidation dataValidation = helper.createValidation(constraint, addressList);
        if (dataValidation instanceof XSSFDataValidation) {
            // 数据校验
            dataValidation.setSuppressDropDownArrow(true);
            dataValidation.setShowErrorBox(true);
        } else {
            dataValidation.setSuppressDropDownArrow(false);
//            dataValidation.setShowErrorBox(true);
//            dataValidation.setErrorStyle(0);
        }

        // 作用在目标sheet上
        sheet.addValidationData(dataValidation);

        // 设置hiddenSheet隐藏
        workbook.setSheetHidden(sheetIndex, true);
    }
}
