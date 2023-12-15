package com.yyy.test.service.impl.order;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.yyy.common.redis.utils.RedisService;
import com.yyy.test.domain.order.TOrder;
import com.yyy.test.domain.order.TSeckillGoods;
import com.yyy.test.domain.order.TSeckillOrder;
import com.yyy.test.mapper.order.TOrderMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yyy.test.mapper.order.TSeckillGoodsMapper;
import com.yyy.test.mapper.order.TSeckillOrderMapper;
import com.yyy.test.service.order.TOrderService;
import com.yyy.test.service.order.TSeckillGoodsService;
import com.yyy.test.service.order.TSeckillOrderService;
import com.yyy.test.vo.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author yyyz
 * @since 2023-07-01
 */
@Service
public class TOrderServiceImpl extends ServiceImpl<TOrderMapper, TOrder> implements TOrderService {
    @Autowired
    private TSeckillGoodsService tSeckillGoodsService;
    @Resource
    private TSeckillOrderMapper tSeckillOrderMapper;
    @Resource
    private TSeckillGoodsMapper tSeckillGoodsMapper;
    @Resource
    private TOrderMapper tOrderMapper;
    @Autowired
    private RedisService redisService;


    @Transactional
    @Override
    public TOrder secKill(GoodsVo goodsVo) {
//    public TOrder secKill(User user,GoodsVo goodsVo) {


        TSeckillGoods seckillGoods = tSeckillGoodsMapper.selectOne(new QueryWrapper<TSeckillGoods>().eq("goods_id", goodsVo.getId()));
        //减库存
        UpdateWrapper<TSeckillGoods> tSeckillGoodsUpdateWrapper = new UpdateWrapper<>();
        TSeckillGoods tSeckillGoods = new TSeckillGoods();
        tSeckillGoods.setStockCount(seckillGoods.getStockCount()-1);
        tSeckillGoodsUpdateWrapper.eq("goods_id", goodsVo.getId())
                .gt("stock_count", 0);
        Integer result = tSeckillGoodsMapper.update(tSeckillGoods,tSeckillGoodsUpdateWrapper);

        if(result<1){
            return null;
        }


        //生成订单
        TOrder order = new TOrder();
        order.setGoodsId(goodsVo.getId());
        order.setDeliveryAddrId(0L);
        order.setGoodsName(goodsVo.getGoodsName());
        order.setGoodsCount(1);
        order.setGoodsPrice(seckillGoods.getSeckillPrice());
        order.setOrderChannel(1);
        order.setUserId(1l);
//        order.setUserId(user.getId());
        order.setStatus(0);
        order.setCreateDate(new Date());
        tOrderMapper.insert(order);
        //生成秒杀订单
        TSeckillOrder tSeckillOrder = new TSeckillOrder();
        tSeckillOrder.setOrderId(order.getId());
        tSeckillOrder.setGoodsId(goodsVo.getId());
        tSeckillOrder.setUserId(1l);
//        tSeckillOrder.setUserId(user.getId());
        tSeckillOrderMapper.insert(tSeckillOrder);
//        redisService.setCacheObject("order:"+user.getId()+":"+goodsVo.getId(),tSeckillOrder);  //为判断重复用户下单做的准备

        return order;
    }
}
