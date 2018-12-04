package com.tz.service;

import com.tz.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.springframework.test.context.web.WebAppConfiguration;
import org.testng.annotations.Test;

/**
 * Created by Administrator on 2018/1/2 0002.
 */
@ContextConfiguration(locations = {"classpath:spring/*.xml"})
@WebAppConfiguration
public class TestMenuService extends AbstractTestNGSpringContextTests{

    @Autowired
    private IMenuService menuService;

    @Test
    public void testMenuService(){
        Menu m = new Menu();
        m.setId(7);
        m.setpId(1003);
        menuService.deleteNodes(m);
    }

    @Test
    public void testUpdate(){
        Menu m = menuService.getById(11);
        m.setName("作业");
        menuService.update(m);
    }
}
