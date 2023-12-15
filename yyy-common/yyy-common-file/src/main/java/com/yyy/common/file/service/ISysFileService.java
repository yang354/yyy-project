package com.yyy.common.file.service;

import com.yyy.common.core.domain.R;
import com.yyy.common.core.vo.SysMediaInfoVO;
import com.yyy.system.api.vo.SysFileVO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

/**
 * 文件上传接口
 * 
* @author 羊扬杨
 */
public interface ISysFileService
{
    /**
     * 文件上传接口
     * 
     * @param file 上传的文件
     * @return 访问地址
     * @throws Exception
     */
    public R<SysFileVO> uploadFile(MultipartFile file) throws Exception;


    void download(HttpServletResponse response, SysMediaInfoVO sysMediaInfoVO) throws Exception;
}
