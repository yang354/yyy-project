package com.yyy.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yyy.common.core.annotation.Excel;
import com.yyy.common.core.web.domain.BaseEntity;

/**
 * 商品对象 t_goods
 *
 * @author yyy
 * @date 2024-01-02
 */
public class TGoods extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 商品ID */
    private Long id;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String goodsName;

    /** 商品标题 */
    @Excel(name = "商品标题")
    private String goodsTitle;

    /** 商品图片 */
    @Excel(name = "商品图片")
    private String goodsImg;

    /** 商品详情 */
    @Excel(name = "商品详情")
    private String goodsDetail;

    /** 商品价格 */
    @Excel(name = "商品价格")
    private BigDecimal goodsPrice;

    /** 商品库存，-1表示没有限制 */
    @Excel(name = "商品库存，-1表示没有限制")
    private Long goodsStock;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setGoodsName(String goodsName)
    {
        this.goodsName = goodsName;
    }

    public String getGoodsName()
    {
        return goodsName;
    }
    public void setGoodsTitle(String goodsTitle)
    {
        this.goodsTitle = goodsTitle;
    }

    public String getGoodsTitle()
    {
        return goodsTitle;
    }
    public void setGoodsImg(String goodsImg)
    {
        this.goodsImg = goodsImg;
    }

    public String getGoodsImg()
    {
        return goodsImg;
    }
    public void setGoodsDetail(String goodsDetail)
    {
        this.goodsDetail = goodsDetail;
    }

    public String getGoodsDetail()
    {
        return goodsDetail;
    }
    public void setGoodsPrice(BigDecimal goodsPrice)
    {
        this.goodsPrice = goodsPrice;
    }

    public BigDecimal getGoodsPrice()
    {
        return goodsPrice;
    }
    public void setGoodsStock(Long goodsStock)
    {
        this.goodsStock = goodsStock;
    }

    public Long getGoodsStock()
    {
        return goodsStock;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("goodsName", getGoodsName())
                .append("goodsTitle", getGoodsTitle())
                .append("goodsImg", getGoodsImg())
                .append("goodsDetail", getGoodsDetail())
                .append("goodsPrice", getGoodsPrice())
                .append("goodsStock", getGoodsStock())
                .toString();
    }
}
