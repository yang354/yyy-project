package com.yyy.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yyy.system.mapper.TGoodsMapper;
import com.yyy.system.domain.TGoods;
import com.yyy.system.service.ITGoodsService;

/**
 * 商品Service业务层处理
 *
 * @author yyy
 * @date 2024-01-02
 */
@Service
public class TGoodsServiceImpl implements ITGoodsService
{
    @Autowired
    private TGoodsMapper tGoodsMapper;

    /**
     * 查询商品
     *
     * @param id 商品主键
     * @return 商品
     */
    @Override
    public TGoods selectTGoodsById(Long id)
    {
        return tGoodsMapper.selectTGoodsById(id);
    }

    /**
     * 查询商品列表
     *
     * @param tGoods 商品
     * @return 商品
     */
    @Override
    public List<TGoods> selectTGoodsList(TGoods tGoods)
    {
        return tGoodsMapper.selectTGoodsList(tGoods);
    }

    /**
     * 新增商品
     *
     * @param tGoods 商品
     * @return 结果
     */
    @Override
    public int insertTGoods(TGoods tGoods)
    {
        return tGoodsMapper.insertTGoods(tGoods);
    }

    /**
     * 修改商品
     *
     * @param tGoods 商品
     * @return 结果
     */
    @Override
    public int updateTGoods(TGoods tGoods)
    {
        return tGoodsMapper.updateTGoods(tGoods);
    }

    /**
     * 批量删除商品
     *
     * @param ids 需要删除的商品主键
     * @return 结果
     */
    @Override
    public int deleteTGoodsByIds(Long[] ids)
    {
        return tGoodsMapper.deleteTGoodsByIds(ids);
    }

    /**
     * 删除商品信息
     *
     * @param id 商品主键
     * @return 结果
     */
    @Override
    public int deleteTGoodsById(Long id)
    {
        return tGoodsMapper.deleteTGoodsById(id);
    }
}
