package com.huawei.user_admin.mapper;

import com.huawei.base.utils.PageBean;
import com.huawei.user_admin.domain.Admin;
import com.huawei.user_admin.domain.Module;
import com.huawei.user_admin.domain.Role;

import java.util.List;


/**
 * Created by dllo on 17/11/13.
 */
public interface AdminMapper {
    List<Admin> findAll();

    Admin findByAdmin(Admin admin);

    Admin findAdminToInfo(int admin_id);

    List<Admin> findAllAdminToInfo(PageBean pageBean);

    int findCount();

    List<Role> findRoleInfo(PageBean pageBean);

    void addRole(String name);

    Role findRule(String name);

    int addRule_module(Module module);

    int deleteRole(int role_id);

    Role findRoleById(int role_id);

    int updateRole(Role role);

    void deleteRole_module(int role_id);


    int findAdminCount();

    List<Role> findAllRole();

    int addAdmin(Admin admin);

    int addAdmin_rule(Role role);

    Admin findByAdmin_code(String admin_code);

    void deleteAdmin_rule(int admin_id);

    int deleteAdmin(int admin_id);

    Admin findAdminById(int admin_id);

    void updateAdmin(Admin admin);

    List<Admin> findAllAdmin();

    int findCountByCQ(PageBean<Admin> pageBean);

    List<Admin> findAdminByCQ(PageBean<Admin> pageBean);

    int resetPwd(Admin admin);

    int modi_user_info(Admin admin);

    int modi_pwd(Admin admin);

    Admin checkAdmin(String admin_code);

    Role findRoleByName(String name);

    List<Module> findAllModule();

    int findAdmin_role(int role_id);
}
