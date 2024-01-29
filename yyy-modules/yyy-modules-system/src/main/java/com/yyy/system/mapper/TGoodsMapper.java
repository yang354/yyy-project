package com.yyy.system.mapper;

import java.util.List;
import com.yyy.system.domain.TGoods;

/**
 * 商品Mapper接口
 *
 * @author yyy
 * @date 2024-01-02
 */
public interface TGoodsMapper
{
    /**
     * 查询商品
     *
     * @param id 商品主键
     * @return 商品
     */
    public TGoods selectTGoodsById(Long id);

    /**
     * 查询商品列表
     *
     * @param tGoods 商品
     * @return 商品集合
     */
    public List<TGoods> selectTGoodsList(TGoods tGoods);

    /**
     * 新增商品
     *
     * @param tGoods 商品
     * @return 结果
     */
    public int insertTGoods(TGoods tGoods);

    /**
     * 修改商品
     *
     * @param tGoods 商品
     * @return 结果
     */
    public int updateTGoods(TGoods tGoods);

    /**
     * 删除商品
     *
     * @param id 商品主键
     * @return 结果
     */
    public int deleteTGoodsById(Long id);

    /**
     * 批量删除商品
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTGoodsByIds(Long[] ids);
}
