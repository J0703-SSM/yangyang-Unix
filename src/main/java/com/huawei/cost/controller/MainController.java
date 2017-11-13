package com.huawei.cost.controller;

import com.huawei.utils.VerifyCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * Created by dllo on 17/11/10.
 */
@Controller
public class MainController {

    @RequestMapping("/")
    public String login(){
        return "login";
    }

    @RequestMapping("/getVerifyCode")
    public void getVerifyCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        VerifyCode code = new VerifyCode();
        BufferedImage image = code.getImage();
        request.getSession().setAttribute("code",code.getText());
        VerifyCode.output(image, response.getOutputStream());
    }

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping("/role_list")
    public String role_list() {
        return "role/role_list";
    }

    @RequestMapping("/admin_list")
    public String admin_list() {
        return "admin/admin_list";
    }

    @RequestMapping("/cost_add")
    public String cost_add(){
        return "cost/cost_add";
    }

    @RequestMapping("/account_list")
    public String account_list() {
        return "account/account_list";
    }

    @RequestMapping("/service_list")
    public String service_list() {
        return "service/service_list";
    }

    @RequestMapping("/bill_list")
    public String bill_list() {
        return "bill/bill_list";
    }

    @RequestMapping("/report_list")
    public String report_list() {
        return "report/report_list";
    }

    @RequestMapping("/user_info")
    public String user_info() {
        return "user/user_info";
    }

    @RequestMapping("/user_modi_pwd")
    public String user_modi_pwd() {
        return "user/user_modi_pwd";
    }

}
