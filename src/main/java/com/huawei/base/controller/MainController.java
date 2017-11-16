package com.huawei.base.controller;

import com.huawei.base.utils.VerifyCode;
import com.huawei.user_admin.domain.Admin;
import com.huawei.user_admin.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * Created by dllo on 17/11/10.
 */
@Controller
public class MainController {

    @Resource
    private AdminService adminService;

    /**
     * 跳转登录页面
     */
    @RequestMapping("/")
    public String login(HttpServletRequest request){
        request.getServletContext().removeAttribute("admin");
        return "login";
    }

    /**
     * 登录
     *
     * @param admin admin对象
     * @param model 驱动
     */
    @RequestMapping("/loginAdmin")
    public String login(@Validated Admin admin,
                        BindingResult result,
                        HttpServletRequest request, Model model) {
        String code1 = (String) request.getSession().getAttribute("code");
        String code = admin.getCode();
        if (result.hasErrors()) {
            FieldError nameErr = result.getFieldError("admin_code");
            FieldError passwordErr = result.getFieldError("password");
            model.addAttribute("nameErr", nameErr);
            model.addAttribute("passwordErr", passwordErr);
        } else {
            if (!code.equalsIgnoreCase(code1)) {
                model.addAttribute("codeErr", "验证码错误");
            } else {
                Admin admin1 = adminService.findByAdmin(admin);
                if (admin1 == null) {
                    model.addAttribute("userErr", "用户名或密码错误,请重试");
                } else {
                    Admin admin2 = adminService.findAdminToInfo(admin1.getAdmin_id());
                    request.getServletContext().setAttribute("admin", admin2);
                    return "index";
                }
            }
        }
        return "login";
    }
    /**
     * 获取验证码图片以及值
     * @throws IOException
     */
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

    @RequestMapping("/error")
    public String error(){
        return "error";
    }

}
