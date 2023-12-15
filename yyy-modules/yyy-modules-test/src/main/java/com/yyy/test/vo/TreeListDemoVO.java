package com.yyy.test.vo;




import com.alibaba.fastjson.JSON;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;


/**
 * @Author yyy
 * @Date 2023/6/16 下午2:36
 */

public class TreeListDemoVO {
    List<CityEntityVO> cityEntities;
    /**
     * id  name  pid
     * 1   浙江   0
     * 2   杭州   1
     * 3   嘉兴   1
     * 4   南湖   3
     * 5   桐乡   3
     * 6   余杭   2
     * 7   西湖   2
     * 8   云南   0
     * 9   昆明   8
     * 10  昭通   8
     */



    /**
     * 递归，List转Tree
     * 主要思想：获取所有根节点、顶级节点，再从List中查找根节点的子节点；
     * 时间复杂度：N*(1+N)/2，O(N^2)，因为递归方法中，最好是List的第一元素就是要找的子节点，最坏是
     * List的最后一个元素是子节点
     */

    public void testList2Tree() {
        List<CityEntityVO> resultCities = new ArrayList<>();
        for (CityEntityVO city : cityEntities) {
            if(0 == city.getPid()) { //获取所有根节点、顶级节点，再根据根节点进行递归
                CityEntityVO topCity = findChild(cityEntities, city); //此时的topCity已经包含它的所有子节点
                resultCities.add(topCity);
            }
        }

        System.out.println(JSON.toJSONString(resultCities));
    }

    /**
     *
     * @param cityEntities 在那个里面找
     * @param curCity 找谁的子节点
     * @return curCity的子节点
     */
    public CityEntityVO findChild(List<CityEntityVO> cityEntities, CityEntityVO curCity) {
        for (CityEntityVO city : cityEntities) {
            if(curCity.getId().equals(city.getPid())) {
                if(null == curCity.getSubCityList()) {
                    curCity.setSubCityList(new ArrayList<>());
                }
                CityEntityVO subChild = findChild(cityEntities, city); //每次递归，都从头开始查找有没有city的子节点
                curCity.getSubCityList().add(subChild);
            }
        }
        return curCity;
    }

}

