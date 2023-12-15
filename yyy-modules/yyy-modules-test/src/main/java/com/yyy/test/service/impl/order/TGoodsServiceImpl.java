package com.yyy.test.service.impl.order;

import com.yyy.test.domain.order.TGoods;
import com.yyy.test.mapper.order.TGoodsMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yyy.test.service.order.TGoodsService;
import com.yyy.test.vo.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 商品表 服务实现类
 * </p>
 *
 * @author yyyz
 * @since 2023-07-01
 */
@Service
public class TGoodsServiceImpl implements TGoodsService {

    @Autowired
    private TGoodsMapper tGoodsMapper;



    @Override
    public GoodsVo findGoodsVobyGoodsId(Long goodsId) {
        return tGoodsMapper.findGoodsVobyGoodsId(goodsId);
    }

    @Override
    public List<GoodsVo> findGoodsVo() {
        return tGoodsMapper.findGoodsVo();
    }
}
