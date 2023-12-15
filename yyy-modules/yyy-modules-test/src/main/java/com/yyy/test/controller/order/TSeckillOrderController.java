package com.yyy.test.controller.order;


import com.yyy.common.core.domain.R;
import com.yyy.common.redis.utils.RedisService;

import com.yyy.rabbit.api.RemoteRabbitService;
import com.yyy.test.service.order.TGoodsService;
import com.yyy.test.service.order.TSeckillOrderService;
import com.yyy.test.vo.GoodsVo;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author yyyz
 * @since 2023-07-01
 */
@RestController
@RequestMapping("/tSeckillOrder")
public class TSeckillOrderController implements InitializingBean {

    @Autowired
    private RedisService redisService;
    @Resource
    private RemoteRabbitService rabbitService;
    @Resource
    private TGoodsService tGoodsService;
    @Resource
    private TSeckillOrderService tSeckillOrderService;


    private Map<Long, Boolean> EmptyStockMap = new HashMap<>();


    /**
     * 库存扣减
     * 先在redis中通过 increment 进行库存的扣减，increment 是一个原子操作，它可以避免并发情况下多个线程对库存进行扣减时产生的数据不一致的问题。
     * 比如此时库存为1，进行扣减后为0，扣减成功，而再进行减库存时，库存会变为-1，这里会进行判断，判断库存是否大于等于0，如果大于等于则表示扣减成功，小于0则表示扣减失败。
     * 每次扣减成功后会往消息队列中放入一个 message 信息，目的是用 RocketMQ 的异步特性来更新数据库中的库存，以此减轻了数据库的压力。
     * 这里引用了事务消息的机制来保证缓存和数据库中数据的一致性，具体的实现方式是，我们需要保证redis进行的库存扣减，和发送消息到消息队列，
     *
     * 这两个操作要么同时成功，要么同时失败，所以生产端在消息队列上开启一个事务，然后给消息队列发送一个半消息，这个半消息包括完整的消息内容，
     * 只是在事务提交前，它对消费端是不可见的。然后执行库存扣减的事务，如果执行成功，就提交事务，事务提交后，半消息就可以被消费了；事务执行失败的话就回滚事务消息。

     */


    /**
     * 秒杀功能   可用开发参考
     *     使用了redis预减库存减少对mysql操作、mq异步处理下单、内存标记减少redis访问
     * @param user
     * @param goodsId
     * @return java.lang.String
     * @author LC
     * @operation add
     * @date 11:36 上午 2022/3/4
     **/
    @ApiOperation("秒杀功能")
    @GetMapping(value = "/doSeckill")
    public R doSecKill(Long goodsId) {
//        if (user == null) {
//            return RespBean.error(RespBeanEnum.SESSION_ERROR);
//        }


        //如果不想用下面的项目启动前就加载秒杀商品，可以在这里设置秒杀商品到redis中
        //String data = redisUtil.get(key);
//        if (StringUtils.isEmpty(data)) {
//            //设置缓存
//            //获取机构课程
//            SftStudyCourses sftStudyCourses = studyCoursesDao.selectByPrimaryKey(supportCourse.getCourseId());
//            redisUtil.set(key, String.valueOf(sftStudyCourses.getMaxGroup()-supportCourse.getApplyNum()));
//            throw new LinkjointException("网络异常,请重试！");
//        }
//        if (Integer.parseInt(data) <= 0) {
//            //redisUtil.delete(key);
//            throw new LinkjointException("已售馨!");
//        }


        //redis剩余名额数
//        if(!studySchoolOrderVO.getApplyType().equals(1)) {
//            //减去redis中剩余名额
//            if(supportCourse.getApplyEndTime().getTime()- date.getTime()<0){
//                throw new LinkjointException("报名已截止!");
//            }
//            redisUtil.incrBy(key, -1L);
//            if(supportCourse.getApplyEndTime().getTime()- date.getTime()<15*60*1000){
//                order.setOutTime(supportCourse.getApplyEndTime());
//            }else{
//                Calendar cal = Calendar.getInstance();
//                cal.setTime(new Date());
//                //过期时间
//                cal.add(Calendar.MINUTE, 15);
//                order.setOutTime(cal.getTime());
//            }
//        }else{
//            if(supportCourse.getApplyEndTime().getTime() - date.getTime() > 0){
//                throw new LinkjointException("报名未截止,请前往首页报名!");
//            }
//            redisUtil.incrBy(key, -1L);
//            Calendar cal = Calendar.getInstance();
//            cal.setTime(new Date());
//            //过期时间
//            cal.add(Calendar.MINUTE, 15);
//            order.setOutTime(cal.getTime());
//        }


        //判断是否重复抢购
//        TSeckillOrder tSeckillOrder = (TSeckillOrder) redisTemplate.opsForValue().get("order:" + user.getId() + ":" + goodsId);
//        if (tSeckillOrder != null) {
//            return RespBean.error(RespBeanEnum.REPEATE_ERROR);
//        }

        //内存标记，减少Redis的访问
        if (EmptyStockMap.get(goodsId)) {  //当只有一件商品，两个人进来
            System.out.println("库存不足1：：：：：：");
            return R.fail("库存不足");
        }
        //预减库存  //当只有一件商品，两个人进来
        Long stock = redisService.decr("seckillGoods:" + goodsId,1l);  //redis的increment操作具有原子性
        //做了一个内存标记，减少Redis缓存访问，一旦对于商品库存没有了，stock为真，将直接返回秒杀失败，不进行后面的Redis缓存访问。
        if (stock < 0) { //这里判断不能小于等于，因为减去之后等于 说明还有是正常范围   0-1=-1
            //一旦商品库存没有了，设置对应商品内存标志为真。
            EmptyStockMap.put(goodsId, true);
            //为了保证数据的线程安全性，需要回退数据，将之前减去的redis中库存回退保证最后没有了库存为0  否则的话并发时会一直减，redis数量对不上  -1+1=0
            redisService.incrBy("seckillGoods:" + goodsId,1l); //redis的increment操作具有原子性
            System.out.println("库存不足2：：：：：：");
            return R.fail("库存不足");
        }
        //在异步队列中写入用户信息和对应商品ID，因为服务端可以根据用户ID和商品ID定位用户是否秒杀过对应商品
        // ，并且服务端需要根据商品ID去查询数据库中对应商品的库存是否足够。
//        SeckillMessage seckillMessag = new SeckillMessage(user, goodsId);
//        mqSender.sendSeckillMessage(JsonUtil.object2JsonStr(seckillMessag));
        rabbitService.sendSkillOrderMQ(goodsId);
        //并非直接返回下单结果，而是分步骤进行，相当于将提交操作变成两段式，先申请后确认。
        //申请之后进入排队中，确认是否可以秒杀成功由服务端进行确认。
        return R.ok(); //0代表正在排队中
    }



    @GetMapping(value = "/doOrder/{goodsId}")
    public R doOrder(@PathVariable("goodsId") Long goodsId) {
        tSeckillOrderService.doOrder(goodsId);
        return R.ok(); //0代表正在排队中
    }

    /**
     * 系统初始化，把商品库存数量加载到Redis
     *
     * @param
     * @return void
     * @author LiChao
     * @operation add
     * @date 6:29 下午 2022/3/8
     **/
    @Override
    public void afterPropertiesSet() throws Exception {
        List<GoodsVo> list = tGoodsService.findGoodsVo();
        if (CollectionUtils.isEmpty(list)) {
            return;
        }
        list.forEach(goodsVo -> {
            redisService.setCacheObject("seckillGoods:" + goodsVo.getId(), goodsVo.getStockCount());
            EmptyStockMap.put(goodsVo.getId(), false);
        });
    }







}

