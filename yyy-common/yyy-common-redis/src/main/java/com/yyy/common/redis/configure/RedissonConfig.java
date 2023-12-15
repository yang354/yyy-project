package com.yyy.common.redis.configure;

import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.ClusterServersConfig;
import org.redisson.config.Config;
import org.redisson.config.SingleServerConfig;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration;
import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * redisson配置
 *
 * @author ai-cloud
 */
@Configuration
@AutoConfigureAfter(RedisAutoConfiguration.class)  //主要是为了拿到 RedisProperties属性
@RequiredArgsConstructor  //@RequiredArgsConstructor：只会对被final修饰或者no-null修饰的字段完成对象注入。可以代替@Autowired注入bean对象
public class RedissonConfig {

    private final RedisProperties redisProperties;
    private final String REDIS_PREFIX = "redis://";

    @Bean(destroyMethod = "shutdown")
    @ConditionalOnMissingBean(RedissonClient.class)
    public RedissonClient redissonClient() {
        // 单机/集群
        Config config = new Config();
        RedisProperties.Cluster cluster = redisProperties.getCluster();
        if (cluster == null || CollUtil.isEmpty(cluster.getNodes())) {
            initSingleConfig(config.useSingleServer());
        } else {
            initClusterConfig(config.useClusterServers());
        }

        return Redisson.create(config);
    }


    /**
     * 单节点模式
     */
    private void initSingleConfig(SingleServerConfig singleServerConfig){
        singleServerConfig.setAddress(REDIS_PREFIX+redisProperties.getHost()+":"+redisProperties.getPort())
                .setDatabase(redisProperties.getDatabase())
                .setPassword(redisProperties.getPassword());
    }

    /**
     * 集群模式
     */
    private void initClusterConfig(ClusterServersConfig clusterServersConfig){
        String[] nodes = redisProperties.getCluster().getNodes().stream()
                .map(node -> REDIS_PREFIX + node)
                .toArray(String[]::new);
        clusterServersConfig.setPassword(redisProperties.getPassword())
                .addNodeAddress(nodes);
    }

}
