package com.huawei.cost.mapper;

import com.huawei.cost.domain.Cost;
import com.huawei.base.utils.PageBean;

import java.util.List;

/**
 * Created by dllo on 17/11/11.
 */
public interface CostMapper {

    int save(Cost cost);

    int startCost(Cost cost);

    int deleteCost(int id);

    Cost findSingle(int id);

    int updateCost(Cost cost);

    int findCount();

    List<Cost> findAll(PageBean<Cost> pageBean);

    List<Cost> findByCostOrder(PageBean<Cost> pageBean);

    Cost findByCost(Cost cost);
}
