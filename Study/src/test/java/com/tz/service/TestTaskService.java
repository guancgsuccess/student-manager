package com.tz.service;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import com.tz.entity.PageBean;
import com.tz.entity.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.springframework.test.context.web.WebAppConfiguration;
import org.testng.annotations.Test;

import java.util.List;

/**
 * Created by Administrator on 2018/1/11 0011.
 */
@ContextConfiguration(locations = {"classpath:spring/*.xml"})
@WebAppConfiguration
public class TestTaskService extends AbstractTestNGSpringContextTests{
    @Autowired
    private ITaskService taskService;

    @Test
    public void testQueryPage(){
        PageBean<Task> pageBean = taskService.queryPage("success",1,2);
        System.out.println("总的条数:"+pageBean.getRows());
        System.out.println("总的页数:"+pageBean.getPageCount());
        System.out.println("当前页:"+pageBean.getPageNow());
        System.out.println("每页显示多少条:"+pageBean.getPageSize());
        List<Task> list = pageBean.getList();
        if(null!=list && list.size()>0){
            System.out.println("数据展示如下:>");
            for(Task t:list){
                System.out.println("\t"+t);
            }
        }else{
            System.out.println("sorry,no any data!");
        }
    }
}
