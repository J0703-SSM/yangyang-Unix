package com.huawei.base.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by dllo on 17/11/15.
 * 全局异常处理器
 */
public class CustomExceptionResolver implements HandlerExceptionResolver {
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) {
        CustomException customException = null;
        if (e instanceof CustomException) {
            customException = (CustomException) e;
        } else {
            customException = new CustomException("未知错误");
        }
        String message = customException.getMessage();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("message", message);
        modelAndView.setViewName("error");
        return modelAndView;
    }
}
