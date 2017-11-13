package com.huawei.cost.response;

import java.util.Map;

/**
 * Created by dllo on 17/11/13.
 */
public class AjaxCostResult {
    private int errorCode;
    private Map<String, String> map;


    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public Map<String, String> getMap() {
        return map;
    }

    public void setMap(Map<String, String> map) {
        this.map = map;
    }
}
