package com.tz.dao;

import com.tz.entity.Gender;
import com.tz.entity.Menu;
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
public class TestMenuDao extends AbstractTestNGSpringContextTests{
    @Autowired
    private IMenuDao menuDao;

    @Test
    public void testFindAll(){
        List<Menu> menus = menuDao.findAll();
        if(null!=menus && menus.size()>0){
            for (Menu m:menus){
                System.out.println(m);
            }
        }
    }

    @Test
    public void testFindParentByPid(){
        List<Menu> list = menuDao.findParentByPid(1003);
        if(null!=list&&list.size()>0){
            for (Menu m:list){
                System.out.println(m);
            }
        }
    }
}
