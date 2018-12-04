package com.tz.dao;

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
public class TestUserDao extends AbstractTestNGSpringContextTests{
    @Autowired
    private IUserDao userDao;

    @Test
    public void testSave(){
        User user = new User();
        user.setPassword("success");
        user.setUsername("success@@");
        user.setCreateDate(new Date());
        user.setPower(1);
        user.setGender(Gender.M);
        user.setPhone("15906128572");
        user.setRealName("管成功");
        user.setRemark("超级管理员");
        user.setStatus(1);

        userDao.save(user);
    }

    @Test
    public void testFindAll(){
        List<User> users = userDao.findAll(2,6);
        if(null!=users && users.size()>0){
           for(User user:users){
               System.out.println(user.getId());
           }
        }
    }

    @Test
    public void testFindByUserName(){
        System.out.println(userDao.findByUserName("admin"));
    }
}
