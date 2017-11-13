package com.huawei.cost.service.impl;

import com.huawei.cost.domain.Cost;
import com.huawei.cost.mapper.CostMapper;
import com.huawei.cost.service.CostService;
import com.huawei.utils.PageBean;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dllo on 17/11/11.
 */
@Service("costService")
public class CostServiceImpl implements CostService {

    @Resource
    private CostMapper costMapper;

    public PageBean<Cost> findAll(Integer pageNum, int pageSize) {
        int totalCount = costMapper.findCount();
        PageBean<Cost> pageBean = new PageBean(pageNum, pageSize, totalCount);
        List<Cost> costs = costMapper.findAll(pageBean);
        pageBean.setData(costs);
        return pageBean;
    }

    public PageBean<Cost> findByCostOrder(Integer pageNum, int pageSize, String condition, String column) {
        int totalCount = costMapper.findCount();
        PageBean<Cost> pageBean = new PageBean(pageNum, pageSize, totalCount, condition, column);
        List<Cost> costs = costMapper.findByCostOrder(pageBean);
        pageBean.setData(costs);
        return pageBean;
    }

    public int save(Cost cost) {
        return costMapper.save(cost);
    }

    public int startCost(Cost cost) {
        return costMapper.startCost(cost);
    }

    public int deleteCost(int id) {
        return costMapper.deleteCost(id);
    }

    public Cost findSingle(int id) {
        return costMapper.findSingle(id);
    }

    public int updateCost(Cost cost) {
        return costMapper.updateCost(cost);
    }


}
