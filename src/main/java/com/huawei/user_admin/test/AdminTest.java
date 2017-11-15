package com.huawei.user_admin.test;

import com.huawei.user_admin.domain.Admin;
import com.huawei.user_admin.domain.Module;
import com.huawei.user_admin.domain.Role;
import com.huawei.user_admin.mapper.AdminMapper;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.util.List;

/**
 * Created by dllo on 17/11/13.
 */
public class AdminTest {

    private ApplicationContext context;

    @Before
    public void init() throws IOException {
        context = new ClassPathXmlApplicationContext("spring-config.xml");
    }

    @Test
    public void test(){
        AdminMapper adminMapper = context.getBean(AdminMapper.class);
        List<Admin> admins = adminMapper.findAll();
        for (Admin admin : admins) {
            System.out.println(admin);
        }
    }

    @Test
    public void test1(){
        AdminMapper adminMapper = context.getBean(AdminMapper.class);
        Admin admin = adminMapper.findAdminToInfo(2000);
        System.out.println(admin);
        for (Role role : admin.getRoles()) {
            System.out.println(role);
            for (Module module : role.getModules()) {
                System.out.println(module);
            }
        }
    }
}
