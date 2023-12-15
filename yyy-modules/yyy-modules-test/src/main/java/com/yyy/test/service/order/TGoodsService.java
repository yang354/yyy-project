package com.yyy.test.service.order;

import com.yyy.test.vo.GoodsVo;

import java.util.List;

/**
 * @Author yyy
 * @Date 2023/7/1 下午2:10
 */

public interface TGoodsService {
    GoodsVo findGoodsVobyGoodsId(Long goodsId);

    List<GoodsVo> findGoodsVo();
}
