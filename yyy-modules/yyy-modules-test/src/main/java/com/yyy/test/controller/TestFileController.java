package com.yyy.test.controller;

import com.yyy.common.core.constant.SecurityConstants;
import com.yyy.common.core.domain.R;
import com.yyy.common.core.utils.StringUtils;
import com.yyy.common.core.utils.file.FileTypeUtils;
import com.yyy.common.core.utils.file.MimeTypeUtils;
import com.yyy.common.core.utils.uuid.UUID;
import com.yyy.common.core.web.domain.AjaxResult;
import com.yyy.common.file.service.ISysFileService;
import com.yyy.common.security.utils.SecurityUtils;

import com.yyy.system.api.vo.SysFileVO;
import com.yyy.system.api.vo.login.LoginUserVO;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Arrays;

/**
 * @Author yyy
 * @Date 2023/6/10 上午12:14
 */

@Api(tags = {"测试文件功能"})
@Slf4j
@RestController
@RequestMapping("file")
public class TestFileController {

    @Value("${fileTemplate.profile}")
    private String profilePath;


    @Autowired
    private ISysFileService sysFileService;


    /**
     * 文件上传请求   @RequestPart使用了这个注解，swagger的ui上就出现了文件选择框
     */
    @ApiOperation("测试文件上传请求")
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
            String url = fileResult.getData().getName();

            return R.ok(url);

        }
        return R.fail("上传图片异常，请联系管理员");
    }


    /**
     * 测试获取项目本地文件
     */
    @ApiOperation("测试获取项目本地文件")
    @GetMapping("/testProjectLocalFile")
    public R getFileTemplate() {
        File file1 = new File(profilePath);

        System.out.println(file1.length() + "~~~~~~~~~~" + file1.getName());
        return R.ok("获取成功");
    }

}
