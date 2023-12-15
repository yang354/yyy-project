package com.yyy.test.thread;

import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
* @author yyy
* @date 2020/4/9 13:50
*/
@Component
@ConfigurationProperties(prefix = "yyy.common.spring")
@Data
@Accessors(chain = true)
public class SpringProperties {

    /** cors跨域配置 */
    private Cors cors = new Cors();
    /** 线程池配置 */
    private Executor executor = new Executor();



	/**
	* @author yyy
	* @date 2021/6/11
	*/
	@Data
	public static class Executor {
        /** 线程池维护线程的最少数量 */
        private int corePoolSize = 10;

        /** 线程池维护线程的最大数量 */
        private int maxPoolSize = 50;

        /** 缓存队列容量 */
        private int queueCapacity = 5000;

        /** 保持活动秒数 */
        private int keepAliveSeconds = 60;
    }

    @Data
    public static class Cors {
        /** 允许跨域发送身份凭证 */
        private String enable;

        /** 预检请求有效期(秒) */
        private Integer maxAge = 3600;

        /** 允许的请求头 */
        private String allowedHeaders = "*";

        /** 允许的请求方法 */
        private String allowedMethods = "*";

        /** 允许跨域的源为，注意与origin:进行区分 */
        private String allowedOriginPatterns = "*";

    }
}
