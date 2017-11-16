package com.huawei.account.test;

import com.huawei.account.mapper.AccountMapper;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;


/**
 * Created by dllo on 17/11/16.
 */
public class AccountTest {

    private ApplicationContext context;

    @Before
    public void init() throws IOException {
        context = new ClassPathXmlApplicationContext("spring-config.xml");
    }

    @Test
    public void test(){
        AccountMapper accountMapper = context.getBean(AccountMapper.class);

    }
}
