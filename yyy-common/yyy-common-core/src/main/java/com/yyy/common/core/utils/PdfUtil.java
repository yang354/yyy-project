package com.yyy.common.core.utils;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.ObjectUtil;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.*;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

/**
 * @Author yyy
 * @Date 2023/5/24 下午4:47
 */

public class PdfUtil {
    /**
     * 对pdf进行填充，并输出到指定路径下
     * @param templatePath 模板绝对路径地址，包括文件名
     * @param stuffData    填充的数据，数据的key与表单的命名和顺序保持一致(key命名要规范：图片则一定要带上Img后缀，其他随意)
     * @Return void
     */
    public static byte[] stuffPdf(String templatePath,  Map<String, String> stuffData) {
        PdfReader reader = null;
        ByteArrayOutputStream bos = null;
        PdfStamper stamper = null;

        try {
            reader = new PdfReader(templatePath);
            bos = new ByteArrayOutputStream();
            stamper = new PdfStamper(reader, bos);
            AcroFields form = stamper.getAcroFields();

            // 创建字体,使用字体。如果要支持中文，则此处必须添加！！
            BaseFont baseFont = BaseFont.createFont( "STSong-Light", "UniGB-UCS2-H",  BaseFont.NOT_EMBEDDED);
            // 支持中文的设置，不然填充后的pdf中文不显示
            form.addSubstitutionFont(baseFont);

            java.util.Iterator<String> it = form.getFields().keySet().iterator();
            while (it.hasNext()) {
                String name = it.next(); //key
                String data = stuffData.get(name) == null ? "" : stuffData.get(name);  //value
                if (!name.contains("img")){
                    // 设置普通文本数据
                    form.setField(name, data);
                } else {
                    //填充图片
                    //通过域名获取所在页和坐标，左下角为起点
                    int pageno = form.getFieldPositions(name).get(0).page;
                    Rectangle signrect = form.getFieldPositions(name).get(0).position;
                    float x = signrect.getLeft()-10; //往左偏移
                    float y = signrect.getBottom()-20; //往下偏移
                    // 读图片 根据路径或Url读取图片
                    Image image = Image.getInstance(data);
                    //获取图片页面
                    PdfContentByte under = stamper.getOverContent(pageno);
                    //图片大小自适应
                    //image.scaleToFit(signrect.getWidth(), signrect.getHeight());
                    image.scaleToFit(100, 100);
                    // 添加图片
                    image.setAbsolutePosition(x, y);
                    under.addImage(image);
                }
            }
            //true代表生成的PDF文件不可编辑
            stamper.setFormFlattening(true);
            stamper.close();
            return bos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeSource(stamper, reader, bos);
        }
        return null;
    }

    private static void closeSource(PdfStamper stamper,PdfReader reader,ByteArrayOutputStream bos) {
        if (ObjectUtil.isNotEmpty(stamper)) {
            try {
                stamper.close();
            } catch (DocumentException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (ObjectUtil.isNotEmpty(reader)) {
            reader.close();
        }
        if (ObjectUtil.isNotEmpty(bos)) {
            try {
                bos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
