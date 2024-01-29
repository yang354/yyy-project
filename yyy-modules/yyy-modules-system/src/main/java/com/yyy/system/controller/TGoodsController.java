package com.yyy.system.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.yyy.common.log.annotation.Log;
import com.yyy.common.log.enums.BusinessType;
import com.yyy.common.security.annotation.RequiresPermissions;
import com.yyy.system.domain.TGoods;
import com.yyy.system.service.ITGoodsService;
import com.yyy.common.core.web.controller.BaseController;
import com.yyy.common.core.web.domain.AjaxResult;
import com.yyy.common.core.utils.poi.ExcelUtil;
import com.yyy.common.core.web.page.TableDataInfo;

/**
 * 商品Controller
 *
 * @author yyy
 * @date 2024-01-02
 */
@RestController
@RequestMapping("/goods")
public class TGoodsController extends BaseController
{
    @Autowired
    private ITGoodsService tGoodsService;

    /**
     * 查询商品列表
     */
    @RequiresPermissions("system:goods:list")
    @GetMapping("/list")
    public TableDataInfo list(TGoods tGoods)
    {
        startPage();
        List<TGoods> list = tGoodsService.selectTGoodsList(tGoods);
        return getDataTable(list);
    }

    /**
     * 导出商品列表
     */
    @RequiresPermissions("system:goods:export")
    @Log(title = "商品", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TGoods tGoods)
    {
        List<TGoods> list = tGoodsService.selectTGoodsList(tGoods);
        ExcelUtil<TGoods> util = new ExcelUtil<TGoods>(TGoods.class);
        util.exportExcel(response, list, "商品数据");
    }

    /**
     * 获取商品详细信息
     */
    @RequiresPermissions("system:goods:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(tGoodsService.selectTGoodsById(id));
    }

    /**
     * 新增商品
     */
    @RequiresPermissions("system:goods:add")
    @Log(title = "商品", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TGoods tGoods)
    {
        return toAjax(tGoodsService.insertTGoods(tGoods));
    }

    /**
     * 修改商品
     */
    @RequiresPermissions("system:goods:edit")
    @Log(title = "商品", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TGoods tGoods)
    {
        System.out.println("fdsfs");
        return toAjax(tGoodsService.updateTGoods(tGoods));
    }

    /**
     * 删除商品
     */
    @RequiresPermissions("system:goods:remove")
    @Log(title = "商品", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tGoodsService.deleteTGoodsByIds(ids));
    }
}
