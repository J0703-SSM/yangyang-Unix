package com.huawei.user_admin.domain;

/**
 * Created by dllo on 17/11/14.
 */
public class Module {
    private int module_id;
    private String name;
    private int role_id;

    public Module() {
    }

    public Module(int module_id, String name) {
        this.module_id = module_id;
        this.name = name;
    }

    @Override
    public String toString() {
        return "Module{" +
                "module_id=" + module_id +
                ", name='" + name + '\'' +
                '}';
    }


    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public int getModule_id() {
        return module_id;
    }

    public void setModule_id(int module_id) {
        this.module_id = module_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
