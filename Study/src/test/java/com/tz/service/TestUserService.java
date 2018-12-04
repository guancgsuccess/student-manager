package com.tz.service;

import com.tz.dao.IUserDao;
import com.tz.entity.Gender;
import com.tz.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.springframework.test.context.web.WebAppConfiguration;
import org.testng.annotations.Test;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/1/2 0002.
 */
@ContextConfiguration(locations = {"classpath:spring/*.xml"})
@WebAppConfiguration
public class TestUserService extends AbstractTestNGSpringContextTests{
    @Autowired
    private IUserService userService;

    @Test
    public void testFindByUserName(){
        System.out.println(userService.findByUserName("admin"));
    }
}
