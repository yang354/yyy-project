package com.yyy.common.redis.factory;






import com.yyy.common.redis.constant.ServerPattern;
import com.yyy.common.redis.exception.FatalException;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 * Redis服务模式工厂类
 * 
 * @author yyy 2019年4月4日下午2:48:10
 */
public class ServerPatternFactory {
    
    private static final Map<String, ServerPattern> serverPatternMap = new HashMap<>();

    static {
        serverPatternMap.put(ServerPattern.SINGLE.getPattern(), ServerPattern.SINGLE);
        serverPatternMap.put(ServerPattern.CLUSTER.getPattern(), ServerPattern.CLUSTER);
        serverPatternMap.put(ServerPattern.MASTER_SLAVE.getPattern(), ServerPattern.MASTER_SLAVE);
        serverPatternMap.put(ServerPattern.REPLICATED.getPattern(), ServerPattern.REPLICATED);
        serverPatternMap.put(ServerPattern.SENTINEL.getPattern(), ServerPattern.SENTINEL);
    }

    /**
     * 根据字符串模式标识返回服务器模式枚举类
     * 
     * @param pattern
     * @return
     */
    public static ServerPattern getServerPattern(String pattern) throws FatalException {
        ServerPattern serverPattern = serverPatternMap.get(pattern);
        if (serverPattern == null) {
            throw new FatalException(-1,"没有找到相应的服务器模式,请检测参数是否正常,pattern的值为:" + pattern);
        }
        return serverPattern;
    }
}
