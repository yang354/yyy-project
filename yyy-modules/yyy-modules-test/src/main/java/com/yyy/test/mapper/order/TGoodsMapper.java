package com.yyy.test.mapper.order;

import com.yyy.common.core.web.page.BaseMapperPlus;
import com.yyy.test.domain.order.TGoods;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yyy.test.vo.GoodsVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * <p>
 * 商品表 Mapper 接口
 * </p>
 *
 * @author yyyz
 * @since 2023-07-01
 */
@Mapper
@Component
public interface TGoodsMapper extends BaseMapperPlus<TGoods> {

    GoodsVo findGoodsVobyGoodsId(Long goodsId);

    List<GoodsVo> findGoodsVo();
}
