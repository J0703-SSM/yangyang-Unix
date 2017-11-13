package com.huawei.cost.controller;


import com.huawei.cost.domain.Cost;
import com.huawei.cost.response.AjaxCostResult;
import com.huawei.cost.service.CostService;
import com.huawei.utils.PageBean;
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
public class CostController {
    @Resource
    private CostService costService;
    private int pageSize = 2;

    /**
     * 查询所有自费条目
     * @param pageNum 当前页码数
     * @param model 驱动
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
     * @param pageNum 当前页码数
     * @param sort 升/降序条件
     * @param column 列名
     * @param model 驱动
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


    /**
     * 添加自费条目
     * @param cost cost对象
     * @param result 校验
     * @return 结果对象
     */
    @ResponseBody
    @RequestMapping("/addCost")
    public AjaxCostResult addCost(@Validated Cost cost, BindingResult result) {
        System.out.println(cost);
        AjaxCostResult ajaxCostResult = new AjaxCostResult();
//        if (result.hasErrors()){
//            Map<String, String> map = getErrors(result);
//            ajaxCostResult.setMap(map);
//
//        }else {
        cost.setStatus("0");
        cost.setCreatime(new Timestamp(new Date().getTime()));
        int count = costService.save(cost);
        ajaxCostResult.setErrorCode(count);
//        }
        return ajaxCostResult;
    }

    /**
     * 获取发生的所有错误信息, 保存到map中
     * @param result
     * @return
     */
    private Map<String, String> getErrors(BindingResult result) {
        Map<String, String> map = new HashMap<String, String>();
        List<FieldError> fieldErrors = result.getFieldErrors();
        for (FieldError error : fieldErrors) {
            map.put(error.getField(), error.getDefaultMessage());
        }
        return map;
    }


    /**
     * 启用资费
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
     * @param cost_id 资费id
     * @param model 驱动
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
     * @param cost cost对象
     * @param result 校验
     * @return 结果对象
     */
    @ResponseBody
    @RequestMapping("/updateCost")
    public AjaxCostResult updateCost(@Validated Cost cost, BindingResult result) {
        AjaxCostResult ajaxCostResult = new AjaxCostResult();
//        if (result.hasErrors()){
//            Map<String, String> map = getErrors(result);
//            ajaxCostResult.setMap(map);
//
//        }else {
        cost.setStatus("0");
        int count = costService.updateCost(cost);
        ajaxCostResult.setErrorCode(count);
//        }
        return ajaxCostResult;
    }


}
