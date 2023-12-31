package com.yyy.common.redis.handler;



import com.yyy.common.redis.annotation.Lock;
import com.yyy.common.redis.annotation.LockKey;
import com.yyy.common.redis.entity.LockInfo;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * 锁信息支持类
 *
 * @author yyy 2019年1月14日下午7:08:06
 */
@Slf4j
@Service
@RequiredArgsConstructor   //@RequiredArgsConstructor：只会对被final修饰或者no-null修饰的字段完成对象注入。可以代替@Autowired注入bean对象
public class LockInfoProvider {

    private final ExpressionParser parser = new SpelExpressionParser();

    /**
     * 获取锁信息
     */
    public LockInfo getLockInfo(JoinPoint joinPoint, Lock lock) {
        Method method = getMethod(joinPoint);
        Object[] parameterValues = joinPoint.getArgs();
        // Spel表达式的上下文
        EvaluationContext context = new StandardEvaluationContext();
        Parameter[] parameters = method.getParameters();
        for (int i = 0; i < parameters.length; i++) {
            String name = parameters[i].getName();
            Object value = parameterValues[i];
            context.setVariable(name, value);
        }

        String lockName = lock.name();
        List<String> keyList = this.getKeyList(joinPoint, lock.keys(), context);
        // 获取KEY
        if (lockName.length() > 0) {
            // name使用
            if (lock.enableNameSpEl()) {
                Object value = parser.parseExpression(lockName).getValue(context);
                if (value != null) {
                    lockName = value.toString();
                }
            }
        } else {
            lockName = getLockName((MethodSignature) joinPoint.getSignature(), keyList);
        }
        // 获取锁等待时间
        long waitTime = lock.waitTime();
        // 获取锁默认释放时间
        long leaseTime = lock.leaseTime();
        // 获取锁默认时间单位
        TimeUnit timeUnit = lock.timeUnit();
        // 增加前缀
        lockName = "yyy:lock:"+lockName;
        return new LockInfo(lockName, keyList, waitTime, leaseTime, timeUnit);
    }

    /**
     * 获取锁KEY名称
     */
    private List<String> getKeyList(JoinPoint joinPoint, String[] keys, EvaluationContext context) {
        Method method = getMethod(joinPoint);
        List<String> definitionKeys = getSpElDefinitionKey(keys, context);
        List<String> keyList = new ArrayList<>(definitionKeys);
        List<String> parameterKeys = getParameterKey(method.getParameters(), joinPoint.getArgs());
        keyList.addAll(parameterKeys);
        return keyList;
    }

    /**
     * 获取拦截方法
     */
    @SneakyThrows
    private Method getMethod(JoinPoint joinPoint) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        if (method.getDeclaringClass().isInterface()) {
            try {
                method = joinPoint.getTarget().getClass().getDeclaredMethod(signature.getName(),
                        method.getParameterTypes());
            } catch (Exception e) {
                log.error(e.getMessage(),e);
                throw e;
            }
        }
        return method;
    }

    /**
     * 获取方法定义KEY
     */
    private List<String> getSpElDefinitionKey(String[] definitionKeys, EvaluationContext context) {
        List<String> definitionKeyList = new ArrayList<>();
        for (String definitionKey : definitionKeys) {
            if (definitionKey == null || definitionKey.isEmpty()) {
                continue;
            }
            Object value = parser.parseExpression(definitionKey).getValue(context);
            if (value != null) {
                definitionKeyList.add(value.toString());
            }
        }
        return definitionKeyList;
    }

    /**
     * 获取参数KEY
     */
    private List<String> getParameterKey(Parameter[] parameters, Object[] parameterValues) {
        List<String> parameterKey = new ArrayList<>();
        for (int i = 0; i < parameters.length; i++) {
            if (parameters[i].getAnnotation(LockKey.class) != null) {
                LockKey keyAnnotation = parameters[i].getAnnotation(LockKey.class);
                if (keyAnnotation.value().isEmpty()) {
                    parameterKey.add(parameterValues[i].toString());
                } else {
                    StandardEvaluationContext context = new StandardEvaluationContext(parameterValues[i]);
                    Object value = parser.parseExpression(keyAnnotation.value()).getValue(context);
                    if (value != null) {
                        parameterKey.add(value.toString());
                    }
                }
            }
        }
        return parameterKey;
    }

    /**
     * 获取锁名称
     */
    private String getLockName(MethodSignature signature, List<String> keyList) {
        return String.format("%s.%s.%s", signature.getDeclaringTypeName(), signature.getMethod().getName(),
                StringUtils.collectionToDelimitedString(keyList, "", "-", ""));
    }
}
