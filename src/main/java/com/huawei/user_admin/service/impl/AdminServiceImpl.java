package com.huawei.user_admin.service.impl;

import com.huawei.base.utils.PageBean;
import com.huawei.user_admin.domain.Admin;
import com.huawei.user_admin.domain.Module;
import com.huawei.user_admin.domain.Role;
import com.huawei.user_admin.mapper.AdminMapper;
import com.huawei.user_admin.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dllo on 17/11/13.
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    public Admin findByAdmin(Admin admin) {
        return adminMapper.findByAdmin(admin);
    }

    public Admin findAdminToInfo(int admin_id) {
        return adminMapper.findAdminToInfo(admin_id);
    }

    public PageBean<Role> findRoleToInfo(Integer pageNum, int pageSize) {
        int totalCount = adminMapper.findCount();
        PageBean<Role> pageBean = new PageBean(pageNum, pageSize, totalCount);
        List<Role> roles = adminMapper.findRoleInfo(pageBean);
        pageBean.setData(roles);
        return pageBean;
    }

    public void addRule(String name) {
        adminMapper.addRole(name);
    }

    public Role findRule(String name) {
        return adminMapper.findRule(name);
    }

    public int addRule_module(Module module) {
        return adminMapper.addRule_module(module);
    }

    public int deleteRole(int role_id) {
        return adminMapper.deleteRole(role_id);
    }

    public Role findRoleById(int role_id) {
        return adminMapper.findRoleById(role_id);
    }

    public int updateRole(Role role) {
        return adminMapper.updateRole(role);
    }

    public void deleteRole_module(int role_id) {
        adminMapper.deleteRole_module(role_id);
    }

    public PageBean<Admin> findAllAdminToInfo(Integer pageNum, int pageSize) {
        int totalCount = adminMapper.findAdminCount();
        PageBean<Admin> pageBean = new PageBean(pageNum, pageSize, totalCount);
        List<Admin> admins = adminMapper.findAllAdminToInfo(pageBean);
        pageBean.setData(admins);
        return pageBean;
    }

    public List<Role> findAllRole() {
        return adminMapper.findAllRole();
    }

    public int addAdmin(Admin admin) {
        return adminMapper.addAdmin(admin);
    }

    public int addAdmin_Rule(Role role) {
        return adminMapper.addAdmin_rule(role);
    }

    public Admin findByAdmin_code(String admin_code) {
        return adminMapper.findByAdmin_code(admin_code);
    }

    public void deleteAdmin_rule(int admin_id) {
        adminMapper.deleteAdmin_rule(admin_id);
    }

    public int deleteAdmin(int admin_id) {
        return adminMapper.deleteAdmin(admin_id);
    }

    public Admin findAdminById(int admin_id) {
        return adminMapper.findAdminById(admin_id);
    }

    public void updateAdmin(Admin admin) {
        adminMapper.updateAdmin(admin);
    }

    public List<Admin> findAllAdmin() {
        return adminMapper.findAllAdmin();
    }

    public PageBean<Admin> findAdminToInfoByCQ(Integer pageNum,int pageSize,int module_id, String role_name) {
        PageBean<Admin> pageBean = new PageBean<Admin>();
        pageBean.setId(module_id);
        pageBean.setCondition(role_name);
        int totalCount = adminMapper.findCountByCQ(pageBean);
        PageBean<Admin> pageBean1 = new PageBean<Admin>(pageNum,pageSize,totalCount);
        pageBean1.setId(module_id);
        pageBean1.setCondition(role_name);
        List<Admin> admins = adminMapper.findAdminByCQ(pageBean1);
        pageBean1.setData(admins);
        return pageBean1;
    }

    public int resetPwd(Admin admin) {
        return adminMapper.resetPwd(admin);
    }

    public int modi_user_info(Admin admin) {
        return adminMapper.modi_user_info(admin);
    }

    public int modi_pwd(Admin admin) {
        return adminMapper.modi_pwd(admin);
    }

    public Admin checkAdmin(String admin_code) {
        return adminMapper.checkAdmin(admin_code);
    }

    public Role findRoleByName(String name) {
        return adminMapper.findRoleByName(name);
    }

    public List<Module> findAllModule() {
        return adminMapper.findAllModule();
    }

    public int findAdmin_role(int role_id) {
        return adminMapper.findAdmin_role(role_id);
    }

}
