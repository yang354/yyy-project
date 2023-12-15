package com.yyy.test.service.order;

import com.yyy.test.domain.order.TOrder;
import com.yyy.test.vo.GoodsVo;

/**
 * @Author yyy
 * @Date 2023/7/1 下午2:10
 */

public interface TOrderService {
    TOrder secKill(GoodsVo goodsVo);
}
