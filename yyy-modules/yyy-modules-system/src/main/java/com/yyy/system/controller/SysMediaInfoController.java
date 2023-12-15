package com.yyy.system.controller;


import cn.hutool.core.io.IoUtil;
import com.yyy.common.core.domain.R;
import com.yyy.common.core.exception.ServiceException;
import com.yyy.common.core.utils.StringUtils;
import com.yyy.common.core.utils.file.FileTypeUtils;
import com.yyy.common.core.utils.file.MimeTypeUtils;
import com.yyy.common.core.utils.uuid.UUID;
import com.yyy.common.core.vo.SysMediaInfoVO;
import com.yyy.common.file.service.ISysFileService;
import com.yyy.common.file.utils.FileUtils;
import com.yyy.common.security.annotation.InnerAuth;
import com.yyy.system.api.vo.SysFileVO;
import com.yyy.system.domain.SysMediaInfo;
import com.yyy.system.service.ISysMediaInfoService;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.Operation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

/**
 * <p>
 * 系统媒体信息表 前端控制器
 * </p>
 *
 * @author yyyz
 * @since 2023-06-24
 */
@Slf4j
@RestController
@RequestMapping("/mediaInfo")
public class SysMediaInfoController {

    @Autowired
    private ISysFileService sysFileService;
    @Autowired
    private ISysMediaInfoService mediaInfoService;

    /**
     * 上传文件存储在本地的根路径
     */
    @Value("${file.path}")
    private String localFilePath;

    /**
     * 文件上传请求   @RequestPart使用了这个注解，swagger的ui上就出现了文件选择框
     */
    @ApiOperation("文件上传请求")
    @PostMapping("testUpload")
    public R upload(@RequestPart(value = "file") MultipartFile file) throws Exception {
        if (!file.isEmpty()) {
            String extension = FileTypeUtils.getExtension(file);
            System.out.println(extension);
            if (!StringUtils.equalsAnyIgnoreCase(extension, MimeTypeUtils.IMAGE_EXTENSION)) {
                return R.fail("文件格式不正确，请上传" + Arrays.toString(MimeTypeUtils.IMAGE_EXTENSION) + "格式");
            }
            R<SysFileVO> fileResult = sysFileService.uploadFile(file);
            if (StringUtils.isNull(fileResult) || StringUtils.isNull(fileResult.getData())) {
                return R.fail("文件服务异常，请联系管理员");
            }
            String url = fileResult.getData().getUrl();
            String fileName = fileResult.getData().getName();
            //
            SysMediaInfo sysMediaInfo = new SysMediaInfo();
            sysMediaInfo.setUrl(url);
            sysMediaInfo.setFileName(fileName);
            sysMediaInfo.setFileId(UUID.randomUUID().toString());
            mediaInfoService.save(sysMediaInfo);
            return R.ok(url);

        }
        return R.fail("上传图片异常，请联系管理员");
    }


    @Operation(summary = "下载文件")
    @GetMapping("/download/{id}")
    public void download(@PathVariable Long id, HttpServletResponse response) throws Exception {
        SysMediaInfo sysMediaInfo = mediaInfoService.getById(id);
        SysMediaInfoVO sysMediaInfoVO = new SysMediaInfoVO();
        BeanUtils.copyProperties(sysMediaInfo,sysMediaInfoVO);

        System.out.println(sysMediaInfo.getUrl());
        if (sysMediaInfo==null){
            throw new ServiceException("文件不存在");
        }
        sysFileService.download(response,sysMediaInfoVO);
    }



}

