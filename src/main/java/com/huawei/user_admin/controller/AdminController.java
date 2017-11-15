package com.huawei.user_admin.controller;

import com.huawei.base.utils.AjaxResult;
import com.huawei.base.utils.PageBean;
import com.huawei.user_admin.domain.Admin;
import com.huawei.user_admin.domain.Module;
import com.huawei.user_admin.domain.Role;
import com.huawei.user_admin.service.AdminService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by dllo on 17/11/13.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Resource
    private AdminService adminService;
    private int pageSize = 2;

    /**
     * 跳转
     */
    @RequestMapping("/admin_list")
    public String admin_list(Integer pageNum, Model model) {
        if (pageNum == null) {
            pageNum = 1;
        }
        PageBean<Admin> pageBean = adminService.findAllAdminToInfo(pageNum, pageSize);
        model.addAttribute("pageBean", pageBean);
        return "admin/admin_list";
    }

    /**
     * 跳转
     */
    @RequestMapping("/role_add")
    public String role_add() {
        return "role/role_add";
    }

    /**
     * 登录
     *
     * @param admin admin对象
     * @param model 驱动
     */
    @RequestMapping("/userLogin")
    public String login(@Validated Admin admin,
                        BindingResult result,
                        HttpServletRequest request, Model model) {
        String code1 = (String) request.getSession().getAttribute("code");
        String code = admin.getCode();
        if (result.hasErrors()) {
            FieldError nameErr = result.getFieldError("name");
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
                    request.getSession().setAttribute("admin", admin2);
                    return "index";
                }
            }
        }
        return "login";
    }


    /**
     * 查询所有role分页
     *
     * @param pageNum 当前页码数
     * @param model   驱动
     */
    @RequestMapping("/role_list")
    public String role_list(Integer pageNum, Model model) {
        if (pageNum == null) {
            pageNum = 1;
        }
        PageBean<Role> pageBean = adminService.findRoleToInfo(pageNum, pageSize);
        model.addAttribute("pageBean", pageBean);
        return "role/role_list";
    }

    /**
     * 添加role
     *
     * @param name    role的name
     * @param modules module集合
     */
    @ResponseBody
    @RequestMapping("/addRole_module")
    public AjaxResult addRole_module(String name, String modules) {
        AjaxResult ajaxResult = new AjaxResult();
        Map<String, Object> map = new HashMap<String, Object>();
        if (name.trim().length() == 0) {
            map.put("nameErr", "不能为空，且为20长度的字母、数字和汉字的组合");
            ajaxResult.setErrorCode(1);
        } else if (modules.trim().length() == 0) {
            map.put("moduleErr", "至少选择一个权限");
            ajaxResult.setErrorCode(1);
        } else {
            Role role1 = adminService.findRule(name);
            if (role1 == null) {
                adminService.addRule(name);
                Role role = adminService.findRule(name);
                String[] module_ids = modules.split(",");
                for (String module_id : module_ids) {
                    Module module = new Module();
                    module.setRole_id(role.getRole_id());
                    module.setModule_id(Integer.parseInt(module_id));
                    int count = adminService.addRule_module(module);
                    if (count > 0) {
                        ajaxResult.setSuccess(true);
                    } else {
                        ajaxResult.setSuccess(false);
                    }
                }
            } else {
                ajaxResult.setSuccess(false);
            }
        }
        ajaxResult.setMap(map);
        return ajaxResult;
    }

    /**
     * 删除role
     *
     * @param role_id role id
     */
    @ResponseBody
    @RequestMapping("/deleteRole")
    public AjaxResult deleteRole(int role_id) {
        AjaxResult ajaxResult = new AjaxResult();
        int count = adminService.deleteRole(role_id);
        if (count > 0) {
            ajaxResult.setSuccess(true);
            ajaxResult.setMessage("删除成功");
        } else {
            ajaxResult.setSuccess(false);
            ajaxResult.setMessage("删除失败");
        }
        return ajaxResult;
    }

    /**
     * 编辑role
     *
     * @param role_id role id
     * @param model   驱动
     */
    @RequestMapping("/role_modi")
    public String role_modi(int role_id, Model model) {
        Role role = adminService.findRoleById(role_id);
        model.addAttribute("role", role);
        return "role/role_modi";
    }

    /**
     * 删除role
     *
     * @param role_id role id
     * @param name    role name
     * @param modules module集合
     */
    @ResponseBody
    @RequestMapping("/updateRole")
    public AjaxResult updateRole(int role_id, String name, String modules) {
        AjaxResult ajaxResult = new AjaxResult();
        Map<String, Object> map = new HashMap<String, Object>();
        if (name.trim().length() == 0) {
            map.put("nameErr", "不能为空，且为20长度的字母、数字和汉字的组合");
            ajaxResult.setErrorCode(1);
        } else if (modules.trim().length() == 0) {
            map.put("moduleErr", "至少选择一个权限");
            ajaxResult.setErrorCode(1);
        } else {
            Role role = new Role(role_id, name);
            adminService.updateRole(role);
            String[] module_ids = modules.split(",");
            Module module = new Module();
            module.setRole_id(role_id);
            adminService.deleteRole_module(role_id);
            for (String module_id : module_ids) {
                module.setModule_id(Integer.parseInt(module_id));
                adminService.addRule_module(module);
                ajaxResult.setSuccess(true);
            }
        }
        ajaxResult.setMap(map);
        return ajaxResult;
    }

    /**
     * 跳转
     */
    @RequestMapping("/admin_add")
    public String admin_add(Model model) {
        List<Role> roles = adminService.findAllRole();
        model.addAttribute("roles", roles);
        return "admin/admin_add";
    }

    @ResponseBody
    @RequestMapping("/addAdmin")
    public AjaxResult addAdmin(@Validated Admin admin, BindingResult result) {
        AjaxResult ajaxResult = new AjaxResult();
        Map<String, Object> errors = getErrors(result);
        if (result.hasErrors()) {
            ajaxResult.setMap(errors);
            ajaxResult.setErrorCode(1);
        } else {
            Admin admin1 = adminService.findByAdmin_code(admin.getAdmin_code());
            if (admin1 != null) {
                errors.put("admin_codeErr", "管理员账户已存在,请重新输入");
                ajaxResult.setErrorCode(1);
            } else if (!admin.getPassword().equals(admin.getPassword1())) {
                errors.put("passErr", "两次密码必须相同");
                ajaxResult.setErrorCode(1);
            } else {
                admin.setEnrolldate(new Timestamp(new Date().getTime()));
                adminService.addAdmin(admin);
                int admin_id = admin.getAdmin_id();
                Role role = new Role();
                role.setAdmin_id(admin_id);
                adminService.deleteAdmin_rule(admin_id);
                String[] role_ids = admin.getCbValue().split(",");
                for (String role_id : role_ids) {
                    role.setRole_id(Integer.parseInt(role_id));
                    int count = adminService.addAdmin_Rule(role);
                }
                ajaxResult.setSuccess(true);
            }
            ajaxResult.setMap(errors);
        }
        return ajaxResult;
    }

    @ResponseBody
    @RequestMapping("/deleteAdmin")
    public AjaxResult deleteAdmin(int admin_id) {
        AjaxResult ajaxResult = new AjaxResult();
        int count = adminService.deleteAdmin(admin_id);
        if (count > 0) {
            adminService.deleteAdmin_rule(admin_id);
            ajaxResult.setSuccess(true);
            ajaxResult.setMessage("删除成功!");
        } else {
            ajaxResult.setSuccess(false);
            ajaxResult.setMessage("删除失败");
        }
        return ajaxResult;
    }

    @RequestMapping("/admin_modi")
    public String admin_modi(int admin_id, Model model) {
        Admin admin = adminService.findAdminById(admin_id);
        List<Role> roles = adminService.findAllRole();
        model.addAttribute("admin", admin);
        model.addAttribute("roles", roles);
        return "admin/admin_modi";
    }

    @ResponseBody
    @RequestMapping("/updateAdmin")
    public AjaxResult updateAdmin(@Validated Admin admin, BindingResult result) {
        AjaxResult ajaxResult = new AjaxResult();
        Map<String, Object> errors = getErrors(result);
        if (result.hasErrors()) {
            ajaxResult.setMap(errors);
            ajaxResult.setErrorCode(1);
        } else {
            adminService.updateAdmin(admin);
            adminService.deleteAdmin_rule(admin.getAdmin_id());
            int admin_id = admin.getAdmin_id();
            Role role = new Role();
            role.setAdmin_id(admin_id);
            adminService.deleteAdmin_rule(admin_id);
            String[] role_ids = admin.getCbValue().split(",");
            for (String role_id : role_ids) {
                role.setRole_id(Integer.parseInt(role_id));
                int count = adminService.addAdmin_Rule(role);
            }
            ajaxResult.setSuccess(true);
        }
        ajaxResult.setMap(errors);
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
}