package com.yyy.common.file.config;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClient;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * aliyun 配置信息
 *
 * @author ai-cloud
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "aliyun") //使用@ConfigurationProperties一定要加上@Configuration或@Component才会生效
public class AliyunConfig {
    /**
     * 阿里云api的内或外网域名
     */
    private String endpoint;
    /**
     * 阿里云api的密钥access key id
     */
    private String accessKeyId;
    /**
     * 阿里云api的密钥access key secret
     */
    private String accessKeySecret;
    /**
     * 阿里云api的bucket名称
     */
    private String bucketName;
    /**
     * 外部访问域名
     */
    private String urlPrefix;

    @Bean
    public OSS oSSClient() {
        return new OSSClient(endpoint, accessKeyId, accessKeySecret);
    }
}
