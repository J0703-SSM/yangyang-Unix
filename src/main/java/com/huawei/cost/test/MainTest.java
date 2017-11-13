package com.huawei.cost.test;

import com.huawei.cost.domain.Cost;
import com.huawei.cost.mapper.CostMapper;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import java.io.IOException;
import java.util.List;

/**
 * Created by dllo on 17/11/11.
 */
public class MainTest {

    private ApplicationContext context;

    @Before
    public void init() throws IOException {
        context = new ClassPathXmlApplicationContext("spring-config.xml");
    }

    @Test
    public void testCost(){
        CostMapper costMapper = context.getBean(CostMapper.class);
        System.out.println(costMapper);
//        List<Cost> costs = costMapper.findAll();
//        for (Cost cost : costs) {
//            System.out.println(cost);
//        }
    }

}
