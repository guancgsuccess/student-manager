package com.tz.dao;

import com.tz.entity.Gender;
import com.tz.entity.Lazy;
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
public class TestLazyDao extends AbstractTestNGSpringContextTests{
    @Autowired
    public ILazyDao lazyDao;

    @Test
    public void testFindByStatus(){
        List<Lazy> list = lazyDao.findByStatus("1",1,2);
        if(null!=list && list.size()>0){
            for(Lazy lazy:list){
                System.out.println(lazy);
            }
        }else{
            System.out.println("没有信息!");
        }
    }
}
