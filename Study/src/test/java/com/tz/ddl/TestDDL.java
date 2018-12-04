package com.tz.ddl;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
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
public class TestDDL extends AbstractTestNGSpringContextTests{
    @Autowired
    private SessionFactory sessionFactory;

    @Test
    public void testFacotry(){
        System.out.println(sessionFactory);
    }

    @Test
    public void testDDL(){
        Configuration cfg = new Configuration().configure("hibernate/hibernate.cfg.xml");
        SchemaExport se = new SchemaExport(cfg);
        se.create(true,true);
    }
}
