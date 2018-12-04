package com.tz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018/1/2 0002.
 */
@Controller
@RequestMapping("/nav")
public class NavController {

    @RequestMapping("/index")
    public String index(){
        return "index";
    }
}
