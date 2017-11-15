package com.huawei.cost.controller;


import com.huawei.cost.domain.Cost;
import com.huawei.base.utils.AjaxResult;
import com.huawei.cost.service.CostService;
import com.huawei.base.utils.PageBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;


import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

/**
 * Created by dllo on 17/11/11.
 */
@Controller
@RequestMapping("/cost")
public class CostController {
    @Resource
    private CostService costService;
    private int pageSize = 2;

    /**
     * 查询所有自费条目
     *
     * @param pageNum 当前页码数
     * @param model   驱动
     */
    @RequestMapping("/cost_list")
    public String findAll(Integer pageNum, Model model) {
        if (pageNum == null) {
            pageNum = 1;
        }
        PageBean<Cost> pageBean = costService.findAll(pageNum, pageSize);
        model.addAttribute("pageBean", pageBean);
        return "cost/cost_list";
    }

    /**
     * 自费排序查询
     *
     * @param pageNum 当前页码数
     * @param sort    升/降序条件
     * @param column  列名
     * @param model   驱动
     */
    @RequestMapping("/cost_order")
    public String ascCost(Integer pageNum, String sort, String column, Model model) {
        model.addAttribute("column", column);
        model.addAttribute("sort", sort);
        if (pageNum == null) {
            pageNum = 1;
        }
        String condition = sort.split("_")[1];//截取出条件
        PageBean<Cost> pageBean = costService.findByCostOrder(pageNum, pageSize, condition, column);
        if (column.equals("base_cost")) {
            model.addAttribute("cost_sort", sort);
        } else {
            model.addAttribute("date_sort", sort);
        }
        model.addAttribute("pageBean", pageBean);
        return "cost/cost_list";
    }

    @RequestMapping("/cost_add")
    public String cost_add() {
        return "cost/cost_add";
    }

    /**
     * 添加自费条目
     *
     * @param cost   cost对象
     * @param result 校验
     * @return 结果对象
     */
    @ResponseBody
    @RequestMapping("/addCost")
    public AjaxResult addCost(@Validated Cost cost, BindingResult result) {
        AjaxResult ajaxResult = resultMap(cost, result);
        if (ajaxResult.getMap().size() == 0) {
            Cost cost1 = costService.findByCost(cost);
            if (cost1 == null) {
                cost.setStatus("0");
                cost.setCreatime(new Timestamp(new Date().getTime()));
                int count = costService.save(cost);
                ajaxResult.setSuccess(true);
            } else {
                ajaxResult.setSuccess(false);
            }
        }
        return ajaxResult;
    }

    /**
     * 获取发生的所有错误信息, 保存到map中
     *
     * @param result
     */
    private Map<String, Object> getErrors(BindingResult result) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<FieldError> fieldErrors = result.getFieldErrors();
        for (FieldError error : fieldErrors) {
            map.put(error.getField(), error.getDefaultMessage());
        }
        return map;
    }


    /**
     * 启用资费
     *
     * @param cost_id 资费id
     * @return 结果信息
     */
    @ResponseBody
    @RequestMapping("/startCost")
    public Map<String, Object> startCost(int cost_id) {

        Map<String, Object> map = new HashMap<String, Object>();
        Cost cost = new Cost();
        cost.setCost_id(cost_id);
        cost.setStartime(new Timestamp(new Date().getTime()));
        int result = costService.startCost(cost);
        if (result > 0) {
            map.put("msg", "启用成功");
        } else {
            map.put("msg", "启用失败");
        }
        return map;
    }

    /**
     * 删除资费
     *
     * @param cost_id 资费id
     * @return 结果信息
     */
    @ResponseBody
    @RequestMapping("/deleteCost")
    public Map<String, Object> deleteCost(int cost_id) {
        Map<String, Object> map = new HashMap<String, Object>();
        int result = costService.deleteCost(cost_id);
        if (result > 0) {
            map.put("msg", "删除成功");
        } else {
            map.put("msg", "删除失败");
        }
        return map;
    }

    /**
     * 编辑资费表单回显
     *
     * @param cost_id 资费id
     * @param model   驱动
     * @return
     */
    @RequestMapping("/costmodi")
    public String modiCost(int cost_id, Model model) {
        Cost cost = costService.findSingle(cost_id);
        model.addAttribute("cost", cost);
        return "cost/cost_modi";
    }

    /**
     * 编辑资费
     *
     * @param cost   cost对象
     * @param result 校验
     * @return 结果对象
     */
    @ResponseBody
    @RequestMapping("/updateCost")
    public AjaxResult updateCost(@Validated Cost cost, BindingResult result) {
        AjaxResult ajaxResult = resultMap(cost, result);
        if (ajaxResult.getMap().size() == 0) {
            Cost cost1 = costService.findByCost(cost);
            if (cost1 == null || cost1.getCost_id() == cost.getCost_id()) {
                cost.setStatus("0");
                cost.setCreatime(new Timestamp(new Date().getTime()));
                int count = costService.updateCost(cost);
                ajaxResult.setSuccess(true);
            } else {
                ajaxResult.setSuccess(false);
            }
        }
        return ajaxResult;
    }

    /**
     * 表单校验
     *
     * @param cost   cost对象
     * @param result 验证
     * @return
     */
    private AjaxResult resultMap(Cost cost, BindingResult result) {
        AjaxResult ajaxCostResult = new AjaxResult();
        Map<String, Object> map = new HashMap<String, Object>();
        if (cost.getCost_type().equals("2")) {
            if (cost.getBase_duration() < 1 || cost.getBase_duration() > 600) {
                map.put("base_duration", "1-600之间的整数");
                ajaxCostResult.setErrorCode(1);
            }
            if (cost.getBase_cost() == 0 || 99999.99 < cost.getBase_cost()) {
                map.put("base_cost", "0-99999.99之间的数值");
                ajaxCostResult.setErrorCode(1);
            }
            if (cost.getUnit_cost() == 0 || 99999.99 < cost.getUnit_cost()) {
                map.put("unit_cost", "0-99999.99之间的数值");
                ajaxCostResult.setErrorCode(1);
            }
        }
        if (cost.getCost_type().equals("1")) {
            if (cost.getBase_cost() == 0 || 99999.99 < cost.getBase_cost()) {
                map.put("base_cost", "0-99999.99之间的数值");
                ajaxCostResult.setErrorCode(1);
            }
        }
        if (cost.getCost_type().equals("3")) {
            if (cost.getUnit_cost() == 0 || 99999.99 < cost.getUnit_cost()) {
                map.put("unit_cost", "0-99999.99之间的数值");
                ajaxCostResult.setErrorCode(1);
            }
        }
        FieldError nameErr = result.getFieldError("name");
        FieldError descrErr = result.getFieldError("descr");
        if (nameErr != null) {
            map.put("name", nameErr);
            ajaxCostResult.setErrorCode(1);
        }
        if (descrErr != null) {
            map.put("descr", descrErr);
            ajaxCostResult.setErrorCode(1);
        }
        ajaxCostResult.setMap(map);
        return ajaxCostResult;
    }


}
