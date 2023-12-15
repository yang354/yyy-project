package com.yyy.common.file.service;

import cn.hutool.core.date.DateTime;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.OSSObject;
import com.yyy.common.core.domain.R;
import com.yyy.common.core.exception.ServiceException;
import com.yyy.common.core.utils.StringUtils;
import com.yyy.common.core.utils.uuid.UUID;
import com.yyy.common.core.vo.SysMediaInfoVO;
import com.yyy.common.file.config.AliyunConfig;
import com.yyy.system.api.vo.SysFileVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;

/**
 * 阿里云 文件存储
 *
 * @author ai-cloud
 */
//@Primary  三个实现类继承了同一个接口，优先使用添加了@Primary的注解的实现类
//@Primary
@Service
public class AliyunServiceImpl implements ISysFileService {

    /**
     * 阿里云api的内或外网域名
     */
    @Value("${aliyun.endpoint}")
    public String endpoint;
    /**
     * 阿里云api的密钥access key id
     */
    @Value("${aliyun.accessKeyId}")
    public String accessKeyId;
    @Value("${aliyun.bucketName}")
    public String bucketName;
    /**
     * 阿里云api的密钥access key secret
     */
    @Value("${aliyun.accessKeySecret}")
    public String accessKeySecret;
    @Autowired
    private AliyunConfig aliyunConfig;

    @Override
    public R<SysFileVO> uploadFile(MultipartFile file) throws Exception {
        // 创建OSS实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        //获取上传文件输入流
        InputStream inputStream = file.getInputStream();
        //获取文件名称
        String fileName = file.getOriginalFilename();
        //1、在文件名称里面添加随机唯一值（因为如果上传文件名称相同的话，后面的问价会将前面的文件给覆盖了）
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");//因为生成后的值有横岗，我们就把它去除，不替换也可以，也没有错
        fileName = uuid + fileName;
        //2、把文件安装日期进行分类： 2022/10/11/1.jpg
        //获取当前日期
        String datePath = new DateTime().toString("yyyy/MM/dd");//在依赖中引入了该工具类
        //拼接
        fileName = datePath + "/" + fileName;
        //调用oss方法实现上传
        //参数一：Bucket名称  参数二：上传到oss文件路径和文件名称  比如 /aa/bb/1.jpg 或者直接使用文件名称  参数三：上传文件的流
        ossClient.putObject(aliyunConfig.getBucketName(), fileName, inputStream);
        //关闭OSSClient
        ossClient.shutdown();
        //把上传之后的文件路径返回
        //需要把上传到阿里云路径返回    https://edu-guli-eric.oss-cn-beijing.aliyuncs.com/1.jpg
        SysFileVO sysFile = new SysFileVO();
        String url = "https://" + aliyunConfig.getBucketName() + "." + aliyunConfig.getEndpoint() + "/" + fileName;
        sysFile.setUrl(url);
        return R.ok(sysFile);
    }

    @Override
    public void download(HttpServletResponse response, SysMediaInfoVO sysMediaInfoVO)throws Exception {
        //https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2023/06/24/7809cc9c442a402a873acc5897a07f00164953-desktop_new_imac_2021_announcement-5120x2880.jpeg
        String filename = StringUtils.substringAfterLast(sysMediaInfoVO.getUrl(), "/");
        //得到 7809cc9c442a402a873acc5897a07f00164953-desktop_new_imac_2021_announcement-5120x2880.jpeg

        //https://aicloud888.oss-cn-hangzhou.aliyuncs.com/2023/06/24/7809cc9c442a402a873acc5897a07f00164953-desktop_new_imac_2021_announcement-5120x2880.jpeg
        String filePath = sysMediaInfoVO.getUrl().substring(sysMediaInfoVO.getUrl().indexOf(".com")+5);
        //得到 2023/06/24/7809cc9c442a402a873acc5897a07f00164953-desktop_new_imac_2021_announcement-5120x2880.jpeg


        System.out.println(filename+"~~~~~~~~~~~~~~");
        System.out.println(filePath+"~~~~~~~~~~~~~~");


        BufferedInputStream bufferedInputStream = null;
        OutputStream outputStream  = null;
        try {
            response.reset();
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/x-msdownload");
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes("UTF-8"), "iso8859-1"));
            // 创建OSSClient实例。
            OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
            //public OSSObject getObject(String bucketName, String key) throws OSSException, ClientException;
            // key值为 不包含Bucket名称在内的Object完整路径，例如2021/11/04/129904d9-d959-44e1-bcaa-5f7a0b663287.txt。
            OSSObject object = ossClient.getObject(bucketName, filePath);
            bufferedInputStream = new BufferedInputStream(object.getObjectContent());
            outputStream = response.getOutputStream();

            byte[] bytes = new byte[1024];
            int len = 0;
            while (((len=bufferedInputStream.read(bytes))!=-1)){
                outputStream.write(bytes,0,len);
            }
            outputStream.flush();
            ossClient.shutdown();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                if (outputStream != null) {
                    outputStream.close();
                }
                if (bufferedInputStream != null) {
                    bufferedInputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
