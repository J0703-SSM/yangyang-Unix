package com.huawei.cost.service;

import com.huawei.cost.domain.Cost;
import com.huawei.base.utils.PageBean;

/**
 * Created by dllo on 17/11/11.
 */
public interface CostService {

    int save(Cost cost);

    int startCost(Cost cost);

    int deleteCost(int id);

    Cost findSingle(int id);

    int updateCost(Cost cost);

    PageBean<Cost> findAll(Integer pageNum, int pageSize);


    PageBean<Cost> findByCostOrder(Integer pageNum, int pageSize, String condition,String column);

    Cost findByCost(Cost cost);
}
