package com.yyy.test.mapper.order;

import com.yyy.common.core.web.page.BaseMapperPlus;
import com.yyy.test.domain.order.TGoods;
import com.yyy.test.domain.order.TOrder;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author yyyz
 * @since 2023-07-01
 */
@Mapper
@Component
public interface TOrderMapper extends BaseMapperPlus<TOrder> {

}
