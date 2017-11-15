package com.huawei.user_admin.domain;

import java.util.List;

/**
 * Created by dllo on 17/11/14.
 */
public class Role {
    private int role_id;
    private String name;
    private List<Module> modules;
    private int admin_id;

    public Role() {
    }

    public Role(int role_id, String name) {
        this.role_id = role_id;
        this.name = name;
    }

    @Override
    public String toString() {
        return "Role{" +
                "role_id=" + role_id +
                ", name='" + name + '\'' +
                '}';
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Module> getModules() {
        return modules;
    }

    public void setModules(List<Module> modules) {
        this.modules = modules;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }
}
