package com.huawei.cost.domain;

import org.hibernate.validator.constraints.Length;

import java.sql.Timestamp;


/**
 * Created by dllo on 17/11/11.
 */
public class Cost {
    private int cost_id;
    @Length(min = 1, max = 50, message = "100长度的字母、数字、汉字和下划线的组合")
    private String name;
    private int base_duration;
    private double base_cost;
    private double unit_cost;
    private String status;
    @Length(min = 1, max = 100, message = "100长度的字母、数字、汉字和下划线的组合")
    private String descr;
    private Timestamp creatime;
    private Timestamp startime;
    private String cost_type;

    public Cost() {
    }

    @Override
    public String toString() {
        return "Cost{" +
                "cost_id=" + cost_id +
                ", name='" + name + '\'' +
                ", base_duration=" + base_duration +
                ", base_cost=" + base_cost +
                ", unit_cost=" + unit_cost +
                ", status='" + status + '\'' +
                ", descr='" + descr + '\'' +
                ", creatime=" + creatime +
                ", startime=" + startime +
                ", cost_type='" + cost_type + '\'' +
                '}';
    }

    public int getCost_id() {
        return cost_id;
    }

    public void setCost_id(int cost_id) {
        this.cost_id = cost_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBase_duration() {
        return base_duration;
    }

    public void setBase_duration(int base_duration) {
        this.base_duration = base_duration;
    }

    public double getBase_cost() {
        return base_cost;
    }

    public void setBase_cost(double base_cost) {
        this.base_cost = base_cost;
    }

    public double getUnit_cost() {
        return unit_cost;
    }

    public void setUnit_cost(double unit_cost) {
        this.unit_cost = unit_cost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public Timestamp getCreatime() {
        return creatime;
    }

    public void setCreatime(Timestamp creatime) {
        this.creatime = creatime;
    }

    public Timestamp getStartime() {
        return startime;
    }

    public void setStartime(Timestamp startime) {
        this.startime = startime;
    }

    public String getCost_type() {
        return cost_type;
    }

    public void setCost_type(String cost_type) {
        this.cost_type = cost_type;
    }
}
