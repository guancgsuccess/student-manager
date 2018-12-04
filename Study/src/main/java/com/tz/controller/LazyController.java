package com.tz.controller;

import com.tz.entity.Lazy;
import com.tz.entity.User;
import com.tz.service.ILazyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * 违纪控制层
 */
@Controller
@RequestMapping("/lazy")
public class LazyController {
    @Autowired
    private ILazyService lazyService;
    /**
     * 保存迟到
     */
    @RequestMapping("/lazy")
    @ResponseBody
    public String lazy(User user){
        Lazy lazy = new Lazy();
        lazy.setUser(user);
        lazy.setRemarks("");
        lazy.setStatus(1);//迟到
        lazy.setLazyDate(new Date());
        lazyService.save(lazy);
        return "success";
    }

    @RequestMapping("/kuang")
    @ResponseBody
    public String kuang(User user){
        Lazy lazy = new Lazy();
        lazy.setUser(user);
        lazy.setRemarks("");
        lazy.setStatus(0);//旷课
        lazy.setLazyDate(new Date());
        lazyService.save(lazy);
        return "success";
    }
    @RequestMapping("/tui")
    @ResponseBody
    public String tui(User user){
        Lazy lazy = new Lazy();
        lazy.setUser(user);
        lazy.setRemarks("");
        lazy.setStatus(2);//旷课
        lazy.setLazyDate(new Date());
        lazyService.save(lazy);
        return "success";
    }
}
