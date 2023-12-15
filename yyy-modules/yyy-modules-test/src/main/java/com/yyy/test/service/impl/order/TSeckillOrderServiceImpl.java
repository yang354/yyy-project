package com.yyy.test.service.impl.order;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yyy.test.domain.order.TSeckillOrder;
import com.yyy.test.service.order.TGoodsService;
import com.yyy.test.service.order.TOrderService;
import com.yyy.test.service.order.TSeckillOrderService;
import com.yyy.test.vo.GoodsVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author yyyz
 * @since 2023-07-01
 */
@Slf4j
@Service
public class TSeckillOrderServiceImpl implements TSeckillOrderService {

    @Autowired
    private TGoodsService itGoodsService;

    @Autowired
    private TOrderService itOrderService;


    @Transactional
    @Override
    public void doOrder(Long goodsId) {

        GoodsVo goodsVo = itGoodsService.findGoodsVobyGoodsId(goodsId);
        //商品库存全部秒杀之后，快速响应秒杀请求,通过在redis中设置 isStockEmpty:goodsId的值，有值，表示该商品已经全部秒杀结束，直接返回
        if (goodsVo.getStockCount() < 1) {
            //用来给获取秒杀结果做准备的
//            redisTemplate.opsForValue().set("isStockEmpty:"+goodsId,"0");
            return;
        }
        //判断是否重复抢购
//        TSeckillOrder tSeckillOrder = (TSeckillOrder) redisTemplate.opsForValue().get("order:" + user.getId() + ":" + goodsId);
//        if (tSeckillOrder != null) {
//            return;
//        }


        //下单操作
        itOrderService.secKill(goodsVo);
    }


}
