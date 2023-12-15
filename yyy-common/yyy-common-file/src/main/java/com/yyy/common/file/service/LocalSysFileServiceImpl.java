package com.yyy.common.file.service;


import com.yyy.common.core.domain.R;
import com.yyy.common.core.exception.ServiceException;
import com.yyy.common.core.utils.StringUtils;
import com.yyy.common.core.vo.SysMediaInfoVO;
import com.yyy.common.file.utils.FileUploadUtils;
import com.yyy.common.file.utils.FileUtils;
import com.yyy.system.api.vo.SysFileVO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Primary;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

/**
 * 本地文件存储
 * 
* @author 羊扬杨
 */
@Primary
@Service
public class LocalSysFileServiceImpl implements ISysFileService {
    /**
     * 资源映射路径 前缀
     */
    @Value("${file.prefix}")
    public String localFilePrefix;

    /**
     * 域名或本机访问地址
     */
    @Value("${file.domain}")
    public String domain;

    /**
     * 上传文件存储在本地的根路径
     */
    @Value("${file.path}")
    private String localFilePath;

    /**
     * 本地文件上传接口
     *
     * @param file 上传的文件
     * @return 访问地址
     * @throws Exception
     */
    @Override
    public R<SysFileVO> uploadFile(MultipartFile file) throws Exception {
        SysFileVO sysFile = new SysFileVO();
        String name = FileUploadUtils.upload(localFilePath, file);
        String url = domain + localFilePrefix + name;
        sysFile.setUrl(url);
        sysFile.setName(name);
        return R.ok(sysFile);
    }

    @Override
    public void download(HttpServletResponse response, SysMediaInfoVO sysMediaInfoVO)throws Exception {
        if (sysMediaInfoVO.getFileName()==null){
            throw new ServiceException("该文件使用oss上传，没有文件名，不支持下载");
        }
        String storePath = localFilePath + sysMediaInfoVO.getFileName();
        String downloadName = StringUtils.substringAfterLast(storePath, "/");

        response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
        FileUtils.setAttachmentResponseHeader(response, downloadName);
        FileUtils.writeBytes(storePath, response.getOutputStream());
    }


}
