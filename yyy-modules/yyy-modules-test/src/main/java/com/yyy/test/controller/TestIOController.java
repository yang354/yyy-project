package com.yyy.test.controller;

import com.yyy.common.core.domain.R;
import com.yyy.common.core.utils.excel.CellDropdown;
import com.yyy.common.core.utils.io.CloseUtil;
import com.yyy.common.core.utils.excel.ExcelUtils;
import com.yyy.common.core.utils.PdfUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author yyy
 * @Date 2023/7/6 上午11:06
 */
@Api(tags = {"测试excel功能"})
@Slf4j
@RestController
@RequestMapping("excel")
public class TestIOController {

    /**
     * 最终实现浏览器可以下载，离不开ServletOutputStream 利用写入到 response.getOutputStream()中，可以实现下载
     * 方式一（也是最常使用）
     *      response.setHeader("content-Type", "application/vnd.ms-excel");
     *      // 下载文件的默认名称
     *      response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("导出任务数据.xlsx", "utf-8"));
     *      outputStream = response.getOutputStream();
     *      outputStream.write(bytes);
     * 方式二
     *      ByteArrayInputStream bais = new ByteArrayInputStream(b);//将字节数组包装到流中
     *      POIFSFileSystem poifs = new POIFSFileSystem();
     *      DirectoryEntry directory = poifs.getRoot();
     *      DocumentEntry documentEntry = directory.createDocument("WordDocument", bais); //该步骤不可省略，否则会出现乱码。
     *
     *      response.setContentType("application/pdf");
     *      //inline设置是强制浏览器显示，attachment设置时强制浏览器下载
     *      response.setHeader("Content-Disposition", "inline; filename= file");
     *      ServletOutputStream ostream = response.getOutputStream();
     *      poifs.writeFilesystem(ostream);  //将poifs输出ostream
     * 方式三
     *      response.setContentType("application/pdf");
     *      //inline设置是强制浏览器显示，attachment设置时强制浏览器下载
     *      response.setHeader("Content-Disposition", "inline; filename= file");
     *      PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
     *
     */

    /**
     PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("C:/Users/18358/Desktop/test.pdf"));
     像这种如果你不想写文件到本地，你可以使用流去接收，可以完成不落地
     解决办法：
     PdfWriter writer = PdfWriter.getInstance(document, baos);
     outputStream = response.getOutputStream();
     byte[] bytes = baos.toByteArray(); //返回base64文件流 需要根据对应的文件前缀拼接才会获取到 例如图片的是 'data:image/jpeg;base64,'+res.data
     outputStream.write(bytes);
     //如果想导出自己看导出内容是否正确，可以放到响应头，否则是传给前端byte[]即可
     response.addHeader("Content-Type", "application/pdf; charset=utf-8");
     // 下载文件的默认名称
     response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(guideBook.getTitle() + ".pdf", "utf-8"));
     outputStream = response.getOutputStream();
     outputStream.write(bytes);
     */


    @ApiOperation("导出excel模版-包括内容输出")
    @GetMapping(value = "/exportExcelTemplate1")
    public R exportExcelTemplate1(HttpServletResponse response) throws IOException {
        //Excel内容记录  可以是我们查询的数据
        List<List<String>> excelContent2 = new ArrayList<>();
        List<String> strList2 = new ArrayList<>();
        strList2.add("必填项为空");
        strList2.add("必填项为空");
        strList2.add("必填项为空");
        excelContent2.add(strList2);

        //官方提供了一种很方便的方法，只需要在try后的括号中，进行IO流的创建，那么在try结束后，便会自动帮我们进行IO流的关闭啦。
        FileInputStream in = null;
        XSSFWorkbook wb = null;
        ByteArrayOutputStream baos = null;
        ServletOutputStream outputStream = null;
        byte[] bytes = null;
        try {
            //如果文件放在resource目录下，就可以使用这种方式获取
            //exportStudentFailePath 通过@value注入先
//            System.out.println(exportStudentFailePath+"~~~~~~~~~~~~~~~~~");
//            ClassPathResource classPathResource = new ClassPathResource(exportStudentFailePath);
//            InputStream in = classPathResource.getInputStream();

            String url = "/Users/yyyz/Documents/测试文件/exportStudentFaile.xlsx";
            in = new FileInputStream(url);

            wb = new XSSFWorkbook(in);
            baos = new ByteArrayOutputStream();//构建字节输出流

            ExcelUtils.createRow(wb, 0, excelContent2, 1); //在模板文件追加内容->等于导出的数据 这样我们省去构建模版头内容的步骤
            wb.write(baos);  //读取到的excel内容写入字节输出流

            bytes = baos.toByteArray();  //返回base64文件流 需要根据对应的文件前缀拼接才会获取到 例如图片的是 'data:image/jpeg;base64,'+res.data
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
            //如果想导出自己看导出内容是否正确，可以放到响应头，否则是传给前端byte[]即可
//            response.setHeader("content-Type", "application/vnd.ms-excel");
//            // 下载文件的默认名称
//            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("导出任务数据.xlsx", "utf-8"));
//            outputStream = response.getOutputStream();
//            outputStream.write(bytes);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
            return R.ok(bytes, "导出成功");
        } catch (Exception e) {
            System.out.println("--------导出excel文件失败:" + e);
        } finally {
            //在finally中，对创建的流进行关闭
            //1、先创建的后关闭，后创建的先关闭
            //2、依赖别人的先关闭，被依赖的后关闭
            CloseUtil.close(baos, wb, in, outputStream);
//            org.apache.poi.util.IOUtils.closeQuietly(baos);
//            org.apache.poi.util.IOUtils.closeQuietly(wb);
//            org.apache.poi.util.IOUtils.closeQuietly(in);
//            org.apache.poi.util.IOUtils.closeQuietly(outputStream);
        }
        return R.fail(bytes, "导出失败");
    }


    @ApiOperation("导出excel模版-仅仅是模板")  //这样我们把原文件模版输出给用户，省去自己手动构建
    @GetMapping(value = "/exportExcelTemplate2")
    public R exportExcelTemplate2(HttpServletResponse response) throws IOException {
        //官方提供了一种很方便的方法，只需要在try后的括号中，进行IO流的创建，那么在try结束后，便会自动帮我们进行IO流的关闭啦。
        FileInputStream in = null;
        XSSFWorkbook wb = null;
        ByteArrayOutputStream baos = null;
        ServletOutputStream outputStream = null;
        byte[] bytes = null;
        try {
            //如果文件放在resource目录下，就可以使用这种方式获取
            //exportStudentFailePath 通过@value注入先
//            System.out.println(exportStudentFailePath+"~~~~~~~~~~~~~~~~~");
//            ClassPathResource classPathResource = new ClassPathResource(exportStudentFailePath);
//            InputStream in = classPathResource.getInputStream();

            String url = "/Users/yyyz/Documents/测试文件/exportStudentFaile.xlsx";
            in = new FileInputStream(url);

            wb = new XSSFWorkbook(in);
            baos = new ByteArrayOutputStream();//构建字节输出流

            wb.write(baos);  //读取到的excel内容写入字节输出流

            bytes = baos.toByteArray(); //返回base64文件流 需要根据对应的文件前缀拼接才会获取到 例如图片的是 'data:image/jpeg;base64,'+res.data
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
            //如果想导出自己看导出内容是否正确，可以放到响应头，否则是传给前端byte[]即可
            response.setHeader("content-Type", "application/vnd.ms-excel");
            // 下载文件的默认名称
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("导出任务数据.xlsx", "utf-8"));
            outputStream = response.getOutputStream();
            outputStream.write(bytes);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
            return R.ok(bytes, "导出成功");
        } catch (Exception e) {
            System.out.println("--------导出excel文件失败:" + e);
        } finally {
            //在finally中，对创建的流进行关闭
            //1、先创建的后关闭，后创建的先关闭
            //2、依赖别人的先关闭，被依赖的后关闭
            CloseUtil.close(baos, wb, in, outputStream);
//            org.apache.poi.util.IOUtils.closeQuietly(baos);
//            org.apache.poi.util.IOUtils.closeQuietly(wb);
//            org.apache.poi.util.IOUtils.closeQuietly(in);
//            org.apache.poi.util.IOUtils.closeQuietly(outputStream);
        }
        return R.fail(bytes, "导出失败");
    }


    @ApiOperation("导出excel模版-模板+设置下拉框")  //这样我们把原文件模版输出给用户，省去自己手动构建
    @GetMapping(value = "/exportExcelTemplate3")
    public R exportExcelTemplate3(HttpServletResponse response) throws IOException {
        //设置下拉框信息
        List<CellDropdown> cellDropdownList = new ArrayList<>();
        CellDropdown cellDropdownSex = new CellDropdown();
        cellDropdownSex.setContents(Arrays.asList("男", "女"));
        cellDropdownSex.setRowStartIndex(10);
        cellDropdownSex.setRowEndIndex(65535);
        cellDropdownSex.setColStartIndex(2);
        cellDropdownSex.setColEndIndex(2);
        cellDropdownList.add(cellDropdownSex);

        CellDropdown cellDropdownRelation1 = new CellDropdown();
        cellDropdownRelation1.setContents(Arrays.asList("爸爸", "妈妈", "爷爷", "奶奶", "外婆", "外公"));
        cellDropdownRelation1.setRowStartIndex(10);
        cellDropdownRelation1.setRowEndIndex(65535);
        cellDropdownRelation1.setColStartIndex(4);
        cellDropdownRelation1.setColEndIndex(4);
        cellDropdownList.add(cellDropdownRelation1);

        CellDropdown cellDropdownRelation2 = new CellDropdown();
        cellDropdownRelation2.setContents(Arrays.asList("爸爸", "妈妈", "爷爷", "奶奶", "外婆", "外公"));
        cellDropdownRelation2.setRowStartIndex(10);
        cellDropdownRelation2.setRowEndIndex(65535);
        cellDropdownRelation2.setColStartIndex(6);
        cellDropdownRelation2.setColEndIndex(6);
        cellDropdownList.add(cellDropdownRelation2);

        CellDropdown cellDropdownRelation3 = new CellDropdown();
        cellDropdownRelation3.setContents(Arrays.asList("爸爸", "妈妈", "爷爷", "奶奶", "外婆", "外公"));
        cellDropdownRelation3.setRowStartIndex(10);
        cellDropdownRelation3.setRowEndIndex(65535);
        cellDropdownRelation3.setColStartIndex(8);
        cellDropdownRelation3.setColEndIndex(8);
        cellDropdownList.add(cellDropdownRelation3);

        CellDropdown cellDropdownRelation4 = new CellDropdown();
        cellDropdownRelation4.setContents(Arrays.asList("爸爸", "妈妈", "爷爷", "奶奶", "外婆", "外公"));
        cellDropdownRelation4.setRowStartIndex(10);
        cellDropdownRelation4.setRowEndIndex(65535);
        cellDropdownRelation4.setColStartIndex(10);
        cellDropdownRelation4.setColEndIndex(10);
        cellDropdownList.add(cellDropdownRelation4);

        //官方提供了一种很方便的方法，只需要在try后的括号中，进行IO流的创建，那么在try结束后，便会自动帮我们进行IO流的关闭啦。
        FileInputStream in = null;
        XSSFWorkbook wb = null;
        ByteArrayOutputStream baos = null;
        ServletOutputStream outputStream = null;
        byte[] bytes = null;
        try {
            //如果文件放在resource目录下，就可以使用这种方式获取
            //exportStudentFailePath 通过@value注入先
//            System.out.println(exportStudentFailePath+"~~~~~~~~~~~~~~~~~");
//            ClassPathResource classPathResource = new ClassPathResource(exportStudentFailePath);
//            InputStream in = classPathResource.getInputStream();

            String url = "/Users/yyyz/Documents/测试文件/学生信息导入模版.xlsx";
            in = new FileInputStream(url);

            wb = new XSSFWorkbook(in);
            baos = new ByteArrayOutputStream();//构建字节输出流
            ExcelUtils.setCellDropdownList(wb, 0, cellDropdownList);  //设置下拉框
            wb.write(baos);  //读取到的excel内容写入字节输出流

            bytes = baos.toByteArray(); //返回base64文件流 需要根据对应的文件前缀拼接才会获取到 例如图片的是 'data:image/jpeg;base64,'+res.data
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
            //如果想导出自己看导出内容是否正确，可以放到响应头，否则是传给前端byte[]即可
            response.setHeader("content-Type", "application/vnd.ms-excel");
            // 下载文件的默认名称
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("导出任务数据.xlsx", "utf-8"));
            outputStream = response.getOutputStream();
            outputStream.write(bytes);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
            return R.ok(bytes, "导出成功");
        } catch (Exception e) {
            System.out.println("--------导出excel文件失败:" + e);
        } finally {
            //在finally中，对创建的流进行关闭
            //1、先创建的后关闭，后创建的先关闭
            //2、依赖别人的先关闭，被依赖的后关闭
            CloseUtil.close(baos, wb, in, outputStream);
//            org.apache.poi.util.IOUtils.closeQuietly(baos);
//            org.apache.poi.util.IOUtils.closeQuietly(wb);
//            org.apache.poi.util.IOUtils.closeQuietly(in);
//            org.apache.poi.util.IOUtils.closeQuietly(outputStream);
        }
        return R.fail(bytes, "导出失败");
    }

    @ApiOperation("导出excel文件-从头创建")
    @GetMapping(value = "/exportExcelTemplate4")
    public R exportExcelTemplate4(HttpServletResponse response) throws IOException {
        //Excel内容记录  可以是我们查询的数据
        List<List<String>> excelContent = new ArrayList<>();
        List<String> strList = new ArrayList<>();
        strList.add("必填项为空");
        strList.add("");
        strList.add("");
        excelContent.add(strList);

        //我们需要合并的设置单元格数
        List<List<Integer>> setMerges = new ArrayList<>();
        List<Integer> indexList = new ArrayList<>();
        indexList.add(0);
        indexList.add(0);
        indexList.add(0);
        indexList.add(3);
        setMerges.add(indexList);

        //官方提供了一种很方便的方法，只需要在try后的括号中，进行IO流的创建，那么在try结束后，便会自动帮我们进行IO流的关闭啦。
        XSSFWorkbook wb = null;
        ByteArrayOutputStream baos = null;
        ServletOutputStream outputStream = null;
        byte[] bytes = null;
        try {
            wb = new XSSFWorkbook();
            baos = new ByteArrayOutputStream();//构建字节输出流

            ExcelUtils.createRowOfHasNotSheet(wb, 0, excelContent, 0); //创建工作行内容
            ExcelUtils.setMergedRegion(wb, 0, setMerges);  //设置合并单元格
            wb.write(baos);  //读取到的excel内容写入字节输出流

            bytes = baos.toByteArray(); //返回base64文件流 需要根据对应的文件前缀拼接才会获取到 例如图片的是 'data:image/jpeg;base64,'+res.data
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
            //如果想导出自己看导出内容是否正确，可以放到响应头，否则是传给前端byte[]即可
            response.setHeader("content-Type", "application/vnd.ms-excel");
            // 下载文件的默认名称
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("导出任务数据.xlsx", "utf-8"));
            outputStream = response.getOutputStream();
            outputStream.write(bytes);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
            return R.ok(bytes, "导出成功");
        } catch (Exception e) {
            System.out.println("--------导出excel文件失败:" + e);
        } finally {
            //在finally中，对创建的流进行关闭
            //1、先创建的后关闭，后创建的先关闭
            //2、依赖别人的先关闭，被依赖的后关闭
            CloseUtil.close(baos, wb, outputStream);
//            org.apache.poi.util.IOUtils.closeQuietly(baos);
//            org.apache.poi.util.IOUtils.closeQuietly(wb);
//            org.apache.poi.util.IOUtils.closeQuietly(outputStream);
        }
        return R.fail(bytes, "导出失败");
    }


    @ApiOperation("导出word模版")
    @GetMapping(value = "/exportWordTemplate")
    public R exportWordTemplate(HttpServletResponse response) throws IOException {
        //官方提供了一种很方便的方法，只需要在try后的括号中，进行IO流的创建，那么在try结束后，便会自动帮我们进行IO流的关闭啦。
        FileInputStream in = null;
        ServletOutputStream outputStream = null;
        byte[] bytes = null;
        try {
            //如果文件放在resource目录下，就可以使用这种方式获取
            //exportStudentFailePath 通过@value注入先
//            System.out.println(exportStudentFailePath+"~~~~~~~~~~~~~~~~~");
//            ClassPathResource classPathResource = new ClassPathResource(exportStudentFailePath);
//            InputStream in = classPathResource.getInputStream();

            String url = "/Users/yyyz/Documents/测试文件/demo测试.docx";
            in = new FileInputStream(url);

            int total = in.available();
            bytes = new byte[total];
            in.read(bytes);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
            //如果想导出自己看导出内容是否正确，可以放到响应头，否则是传给前端byte[]即可
            response.addHeader("Content-Type", "application/msword; charset=utf-8");
            // 下载文件的默认名称
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("导出任务数据.doc", "utf-8"));
            outputStream = response.getOutputStream();
            outputStream.write(bytes);
            return R.ok(bytes, "导出成功");
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
        } catch (Exception e) {
            System.out.println("--------导出word模版失败:" + e);
        } finally {
            //在finally中，对创建的流进行关闭
            //1、先创建的后关闭，后创建的先关闭
            //2、依赖别人的先关闭，被依赖的后关闭
            CloseUtil.close(in, outputStream);
//            org.apache.poi.util.IOUtils.closeQuietly(in);
//            IOUtils.closeQuietly(outputStream);
        }
        return R.fail(bytes, "导出失败");
    }


    /**
     pdf填充规则
     填充的数据，数据的key与表单的命名和顺序保持一致(key命名要规范：图片则一定要带上Img后缀，其他随意)
     */
    @ApiOperation("导出pdf模板")
    @GetMapping(value = "/exportPdfTemplate")
    @ResponseBody
    public R exportPdfTemplate(HttpServletResponse response) throws IOException {

        ServletOutputStream outputStream = null;
        byte[] bytes = null;
        try {
            String fileName = "研学旅行安全协议书";

            //处理数据返回byte[]
            HashMap<String, String> hashMap = new HashMap<>();
            hashMap.put("registerName", "青青草原机构");
            hashMap.put("parentName", "懒洋洋");
            hashMap.put("organizationalSeal", "");
            hashMap.put("registerSignature", "");
            hashMap.put("registerSignTime", new SimpleDateFormat("yyyy年MM月dd日").format(new Date()));
            hashMap.put("studentSignature", "");
            hashMap.put("schoolImg", "https://linkjoint-school.oss-cn-shenzhen.aliyuncs.com/school/2/2023/photo/3717/1697534970832199680.png");
            hashMap.put("parentSignTime", "");

            bytes = PdfUtil.stuffPdf("/Users/yyyz/Documents/测试文件/registerSign.pdf", hashMap);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
            //如果想导出自己看导出内容是否正确，可以放到响应头，否则是传给前端byte[]即可
            response.addHeader("Content-Type", "application/pdf; charset=utf-8");
            // 下载文件的默认名称
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName + ".pdf", "utf-8"));
            outputStream = response.getOutputStream();
            outputStream.write(bytes);
            return R.ok(bytes, "导出成功");
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
        } catch (Exception e) {
            System.out.println("--------导出pdf模板失败:" + e);
        } finally {
            CloseUtil.close(outputStream);
//            IOUtils.closeQuietly(outputStream);
        }
        return R.fail(bytes, "导出失败");
    }


    public static void main(String[] args) throws IOException {
        File file = new File("/Users/yyyz/Desktop/导入学生信息列表(5).xlsx");
        byte[] bytes = fileConvertToByteArray(file);
        System.out.println(bytes);

        String content = "aaaaa";
        byte b[] = content.getBytes("utf-8"); //这里是必须要设置编码的，不然导出中文就会乱码。
        ByteArrayInputStream bais = new ByteArrayInputStream(b);//将字节数组包装到流中

        byte[] bytes1 = readInputStream(bais);
        OutputStream out = System.out;
        out.write(bytes1);//把byte数组写入文件，相当于把字符串写入文件中
    }



    /**
     * 从输入流中获取字节数组
     */
    private static byte[] readInputStream(InputStream inputStream) throws IOException {
        byte[] buffer = new byte[1024];
        int len = 0;
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        while ((len = inputStream.read(buffer)) != -1) {
            bos.write(buffer, 0, len);
        }
        bos.close();
        return bos.toByteArray();
    }



    /**
     * 把一个文件转化为byte字节数组。
     *
     * @return
     */
    private static byte[] fileConvertToByteArray(File file) {
        byte[] data = null;
        FileInputStream fis = null;
        ByteArrayOutputStream baos = null;

        try {
            fis = new FileInputStream(file);
            baos = new ByteArrayOutputStream();

            int len;
            byte[] buffer = new byte[1024];
            while ((len = fis.read(buffer)) != -1) {
                baos.write(buffer, 0, len);
            }
            data = baos.toByteArray(); //返回base64文件流 需要根据对应的文件前缀拼接才会获取到 例如图片的是 'data:image/jpeg;base64,'+res.data
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            CloseUtil.close(fis, baos);
        }
        return data;
    }

/**
 经典批量导入功能实现  包括返回成功数，失败数，失败文件

    控制层
    @ApiOperation("批量导入老师")
    @PostMapping(value = "/importTeacherByExcel")
    @ResponseBody public CommonResult importTeacherByExcel(@RequestParam(value = "file") MultipartFile file, @RequestParam(value = "tenantId") Long tenantId,HttpServletResponse response){
        if(file==null){
            return new CommonResult().failed("请选择文件!");
        }
        if(tenantId==null){
            return new CommonResult().failed("请选择学校!");
        }
        AnalysisExcelResultDTO analysisExcelResultDTO = null;
        try {
            analysisExcelResultDTO = schoolTeacherService.importTeacherByExcel(file,tenantId);
        } catch (LinkjointException e) {
            e.printStackTrace();
            return new CommonResult().failed(e.getMessage());
        } catch (Exception e){
            return new CommonResult().failed("上传文件格式请使用规范模板并规范填写");
        }

        return new CommonResult().success("新增成功！",analysisExcelResultDTO);
    }


    实体类
    @Data
    public class AnalysisExcelResultDTO implements Serializable {
        @ApiModelProperty(value="成功数量",name="successNum")
        private Integer successNum;
        @ApiModelProperty(value="失败数量",name="errorNum")
        private Integer errorNum;
        @ApiModelProperty(value="文件内容",name="content")
        private byte[] content;
    }



    实现类
    @Transactional(rollbackFor = Exception.class)
    @Override
    public AnalysisExcelResultDTO importTeacherByExcel(MultipartFile file, Long tenantId) throws LinkjointException {
        if(file==null){
            return null;
        }
        //Excel文件内容
        List<List<String>> excelContent = null;
        //Excel错误内容记录
        List<List<String>> excelContent2 = new ArrayList<>();

        try {
            InputStream in = new BufferedInputStream(file.getInputStream());
            org.apache.poi.util.IOUtils.closeQuietly(file.getInputStream());
            //读取文件内容
            excelContent = ExcelUtils.getExcelContent(in, 0,null,null);

        }catch (IOException e) {
            throw new LinkjointException("文件解析失败！");
        }
        if(CollectionUtils.isEmpty(excelContent)||excelContent.size()==0){
            throw new LinkjointException("文件内容为空！");
        }


        //去除提示及表头
        excelContent.remove(0);
        excelContent.remove(0);
        excelContent.remove(0);
        excelContent.remove(0);
        excelContent.remove(0);
        excelContent.remove(0);

        int successNum=0;//成功次数
        boolean ifSuccess;//判断失败成功

        for(List<String> s:excelContent) {
            ifSuccess=true;//先设为成功，失败在设置失败
            try {
                //判断必填项是否为空
                if (StringUtils.isEmpty(s.get(0)) || StringUtils.isEmpty(s.get(1)) || StringUtils.isEmpty(s.get(2))) {
                    //必填写都为空则不算错误内容
                    if(s.size()>0) {
                        for(int i=0;i<3;i++){
                            if(!StringUtils.isEmpty(s.get(i))){
                                List<String> strList2 = new ArrayList<>();
                                strList2.add("必填项为空");
                                strList2.addAll(s);
                                excelContent2.add(strList2);
                                break;
                            }
                        }
                    }
                    continue;
                }
                if (s.get(0).length()>10){
                    List<String> strList2 = new ArrayList<>();
                    strList2.add("姓名字数过长");
                    strList2.addAll(s);
                    excelContent2.add(strList2);
                    continue;
                }
                if (!isMobile(s.get(1))){
                    List<String> strList2 = new ArrayList<>();
                    strList2.add("手机号无效");
                    strList2.addAll(s);
                    excelContent2.add(strList2);
                    continue;
                }
                String[] split = s.get(2).split(",");

                List<TeacherLabel> teacherLabels = teacherLabelDao.selectAllLablel(tenant.getId());

                List<String> collect = teacherLabels.stream().map(TeacherLabel::getName).collect(Collectors.toList());
                System.out.println(compareList(collect,split)+"~~~~~~~~~~~~~`");
                if (!compareList(collect,split)){
                    List<String> strList2 = new ArrayList<>();
                    strList2.add("教师标签不存在");
                    strList2.addAll(s);
                    excelContent2.add(strList2);
                    continue;
                }
                List<AddSchoolTeacherVO> schoolTeacher = generateSchoolTeacher(tenant,s.get(0),s.get(1),s.get(2));
                if( ObjectUtils.isEmpty(schoolTeacher)){
                    List<String> strList2 = new ArrayList<>();
                    strList2.add("手机号存在");
                    strList2.addAll(s);
                    excelContent2.add(strList2);
                    System.out.println("^^^^^^^^^^^^^^^^^^^^");
                    continue;
                }
                this.addSchoolTeacher(schoolTeacher);
                if(ifSuccess){
                    successNum++;
                }
            }catch (Exception e){
                List<String> strList2 = new ArrayList<>();
                strList2.add("其他错误，请检查输入内容");
                strList2.addAll(s);
                excelContent2.add(strList2);
                continue;
            }
        }
        AnalysisExcelResultDTO analysisExcelResultDTO = new AnalysisExcelResultDTO();
        analysisExcelResultDTO.setErrorNum(excelContent2.size());
        System.out.println(excelContent2.toString());
        analysisExcelResultDTO.setSuccessNum(successNum);
        try {
            ClassPathResource classPathResource = new ClassPathResource(exportTeacherFailPath);
            InputStream in = classPathResource.getInputStream();
            XSSFWorkbook wb = new XSSFWorkbook(in);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();//构建字节输出流
            try {
                this.createRow(wb,0,excelContent2);
                wb.write(baos);
            } catch (Exception e){
                e.printStackTrace();
            } finally {
                org.apache.poi.util.IOUtils.closeQuietly(baos);
                org.apache.poi.util.IOUtils.closeQuietly(wb);
            }
            byte[] bytes = baos.toByteArray(); //返回base64文件流 需要根据对应的文件前缀拼接才会获取到 例如图片的是 'data:image/jpeg;base64,'+res.data

            analysisExcelResultDTO.setContent(bytes);

            return analysisExcelResultDTO;
        } catch (Exception e) {
            log.error("--------写入错误文件失败:{}",e);

        }
        return null;
    }
 */




}
