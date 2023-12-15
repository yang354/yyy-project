package com.yyy.test.controller;


import com.alibaba.fastjson.JSON;
import com.github.pagehelper.util.StringUtil;
import com.yyy.common.core.annotation.CountTime;
import com.yyy.common.core.domain.R;


import com.yyy.common.core.enums.OaTypeEnum;
import com.yyy.common.core.utils.SpringUtils;
import com.yyy.common.sms.service.SmsService;


import com.yyy.system.api.vo.SysUserVO;
import com.yyy.test.service.AccountInfoService;
import com.yyy.test.thread.AsyncFactory;
import com.yyy.test.thread.AsyncManager;
import com.yyy.test.vo.CityEntityVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.*;
import java.util.stream.Collectors;

/**
 * @Author yyy
 * @Date 2023/5/30 下午6:36
 */

@Api(tags = {"测试功能"})
@Slf4j
@RestController
@RequestMapping("test")
public class TestController {


    @Autowired
    private SmsService smsService;


    @ApiOperation("测试获取手机验证码")
    @GetMapping("/sendVerificationCode")
    @ResponseBody
    public R sendVerificationCode(String phone) {
        try {
            System.out.println("你好");
//            if (StringUtils.isBlank(phone)){
//                return R.fail("phone不能为空!");
//            }
            return R.ok(smsService.sendVerificationCode("18289339306"),"发送成功!");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return R.fail("请求失败");
    }


    @Autowired
    private AccountInfoService accountInfoService;

    /**
     * 测试多数据源
     */
    @ApiOperation("测试多数据源")
    @GetMapping("/testDS")
    public String transfer( Double amount){
        accountInfoService.updateAccountBalance("1",amount);
        return "bank1"+amount;
    }


    /**
     * 测试树形扁平化
     */
    @ApiOperation("测试树形扁平化")
    @GetMapping("/testTree")
    public R testTree(){
        List<CityEntityVO> treeList = JSON.parseArray("[{\"id\":1,\"name\":\"浙江\",\"pid\":0,\"subCityList\":[" +
                "{\"id\":2,\"name\":\"杭州\",\"pid\":1,\"subCityList\":[{\"id\":6,\"name\":\"余杭\",\"pid\":2},{\"id\":7,\"name\":\"西湖\",\"pid\":2}]}," +
                "{\"id\":3,\"name\":\"嘉兴\",\"pid\":1,\"subCityList\":[{\"id\":4,\"name\":\"南湖\",\"pid\":3},{\"id\":5,\"name\":\"桐乡\",\"pid\":3}]}]}," +
                "{\"id\":8,\"name\":\"云南\",\"pid\":0,\"subCityList\":[{\"id\":9,\"name\":\"昆明\",\"pid\":8},{\"id\":10,\"name\":\"昭通\",\"pid\":8}]}]", CityEntityVO.class);

        HashMap<String, Object> map = new HashMap<>();
        map.put("tree",treeList);

        List<CityEntityVO> resList = new ArrayList<>();

        //这一层for的目的是：遍历根节点
        for (CityEntityVO city : treeList) {
            reversion(city,resList);
        }
        System.out.println(JSON.toJSONString(resList));

        map.put("list",resList);
        return R.ok(map);
    }


    public void reversion(CityEntityVO curNode, List<CityEntityVO> resList) {
        resList.add(beanCopy(curNode));

        List<CityEntityVO> subCityList = curNode.getSubCityList();
        if(subCityList != null && !subCityList.isEmpty()) {
            for (CityEntityVO city : subCityList) { //递归寻找子节点的子节点们
                reversion(city, resList);
            }
        }

        //递归的出口就是subCityList为null或者empty
    }




    private CityEntityVO beanCopy(CityEntityVO source) {
        CityEntityVO res = new CityEntityVO();
        res.setId(source.getId());
        res.setName(source.getName());
        res.setPid(source.getPid());
        return res;
    }


    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    /**
     * 测试list()转Map
     */
    @ApiOperation("测试list()转Map")
    @GetMapping("/testList")
    public R testList(){
        List<CityEntityVO> cityEntities = JSON.parseArray("[{\"id\":1,\"name\":\"浙江\",\"pid\":0},\n" +
                "{\"id\":2,\"name\":\"杭州\",\"pid\":1},\n" +
                "{\"id\":3,\"name\":\"嘉兴\",\"pid\":1},\n" +
                "{\"id\":4,\"name\":\"南湖\",\"pid\":3},\n" +
                "{\"id\":5,\"name\":\"桐乡\",\"pid\":3},\n" +
                "{\"id\":6,\"name\":\"余杭\",\"pid\":2},\n" +
                "{\"id\":7,\"name\":\"西湖\",\"pid\":2},\n" +
                "{\"id\":8,\"name\":\"云南\",\"pid\":0},\n" +
                "{\"id\":9,\"name\":\"昆明\",\"pid\":8},\n" +
                "{\"id\":10,\"name\":\"昭通\",\"pid\":8}]", CityEntityVO.class);


        //收集每个PID下的节点为Map
        Map<Long, List<CityEntityVO>> cityMapByPid = cityEntities.stream().collect(Collectors.groupingBy(CityEntityVO::getPid));

        List<CityEntityVO> resultCityList = new ArrayList<>();
        for (CityEntityVO city : cityEntities) {
            if(0 == city.getPid()) { //根节点、顶点
                resultCityList.add(city);
            }

            List<CityEntityVO> citiesByPid = cityMapByPid.get(city.getId());
            if(null != citiesByPid && citiesByPid.size() > 0) { //有子节点
                if(null == city.getSubCityList()) {
                    city.setSubCityList(new ArrayList<>());
                }
                city.getSubCityList().addAll(citiesByPid); //塞入
            }
        }

        System.out.println(JSON.toJSONString(resultCityList));


        return R.ok(resultCityList);
    }


    /**
     * 测试枚举的使用
     */
    @ApiOperation("测试枚举的使用")
    @GetMapping("/testEnum")
    public String testEnum(){

        return OaTypeEnum.getText(1);
    }


    /**
     * 测试stream的使用
     */
    @ApiOperation("测试stream的使用")
    @GetMapping("/testStream")
    public R testStream(){
        SysUserVO sysUserVO = new SysUserVO();
        ArrayList<SysUserVO> sysUserVOS = new ArrayList<>();
        sysUserVOS.add(sysUserVO);
        List<String> collect = sysUserVOS.stream().filter(t -> !StringUtil.isEmpty(t.getPhonenumber())).map(SysUserVO::getPhonenumber).collect(Collectors.toList());
//        List<String> collect = sysUserVOS.stream().map(SysUserVO::getPhonenumber).collect(Collectors.toList());
        return R.ok(collect);
    }


    @Autowired
    private ScheduledExecutorService scheduledExecutorService;
    @Autowired
    private ThreadPoolTaskExecutor springRawExecutor;
    @Autowired
    private ExecutorService asyncExecutorService;
    @Autowired
    private Executor bigExecutor;
    @Autowired
    private Executor asyncExecutor;
    @Resource
    private ThreadPoolTaskExecutor threadPoolExecutor;


    /**
     * 测试获取线程池对象
     */
    @CountTime
    @ApiOperation("测试获取testThreadPool对象")
    @GetMapping("/testThreadPool")
    public R testThreadPool(){

        System.out.println(scheduledExecutorService.toString());

        System.out.println(springRawExecutor.toString());
        System.out.println(asyncExecutorService.toString());
        System.out.println(bigExecutor.toString());

        System.out.println(asyncExecutor.toString());
        System.out.println(threadPoolExecutor.toString());
        return R.ok();
    }




    @ApiOperation("测试多线程异步编排")
    @GetMapping("/testCompletableFuture")
    private R testCompletableFuture(){
        long start = System.currentTimeMillis();

        //0、获取线程池  可以通过手动获取的方式，这里通过使用 @Autowired的方式获取了
//        ThreadPoolTaskExecutor threadPoolExecutor = SpringUtils.getBean("springRawExecutor");

        //1、等待10000
        CompletableFuture<String> articleCompletableFuture = CompletableFuture.supplyAsync(() -> {
            System.out.println("子线程执行了。。。start   线程名："+Thread.currentThread().getName());
            try {
                Thread.sleep(10000);
            } catch (Exception e){

            }
            System.out.println("子线程执行了。。。end   线程名："+Thread.currentThread().getName());
            return "abc";
        }, threadPoolExecutor);
        //2、等待10000 并行处理3000
        CompletableFuture<Void> userCompletableFuture = articleCompletableFuture.thenAcceptAsync(articleEntity -> {
            System.out.println("子线程执行了。。。start   线程名："+Thread.currentThread().getName());
            try {
                Thread.sleep(3000);
            } catch (Exception e){

            }
            System.out.println(articleEntity);
            System.out.println("子线程执行了。。。end   线程名："+Thread.currentThread().getName());
        }, threadPoolExecutor);
        //3、 等待10000 并行处理3000
        CompletableFuture<Void> userOtherArticleCompletableFuture = articleCompletableFuture.thenAcceptAsync(articleEntity -> {
            System.out.println("子线程执行了。。。start   线程名："+Thread.currentThread().getName());
            try {
                Thread.sleep(3000);
            } catch (Exception e){

            }
            System.out.println(articleEntity);
            System.out.println("子线程执行了。。。end   线程名："+Thread.currentThread().getName());
        }, threadPoolExecutor);
        //4、无需等待10000 并行处理3000
        CompletableFuture<Void> commentsCompletableFuture =  CompletableFuture.runAsync(() -> {
            System.out.println("子线程执行了。。。start   线程名："+Thread.currentThread().getName());
            try {
                Thread.sleep(3000);
            } catch (Exception e){

            }
            System.out.println("子线程执行了。。。end   线程名："+Thread.currentThread().getName());
        }, threadPoolExecutor);

        // 多任务执行组合 CompletableFuture.allOf()
        CompletableFuture.allOf(articleCompletableFuture, userCompletableFuture, userOtherArticleCompletableFuture,
                commentsCompletableFuture).join();


        long end = System.currentTimeMillis();
        System.out.println("花费时间："+(end-start));

        return R.ok();
    }


    @ApiOperation("测试ExecutorService")
    @GetMapping("/testExecutorService")
    private R testExecutorService() throws InterruptedException {
        System.out.println("开始");
        //注意：不影响主线程的执行
        AsyncManager.me().execute(AsyncFactory.testThread());
        System.out.println("结束");
        return R.ok();
    }

    @ApiOperation("测试ScheduledExecute")
    @GetMapping("/testScheduledExecute")
    private R testScheduledExecute() throws InterruptedException {
        System.out.println("开始");
        //注意：会延时10秒后才会执行，不影响主线程的执行
        AsyncManager.me().scheduledExecute(AsyncFactory.testThread());
        System.out.println("结束");
        return R.ok();
    }

}
