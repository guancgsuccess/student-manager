package com.tz.controller;

import com.tz.entity.*;
import com.tz.service.ILeaveService;
import com.tz.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 请假控制层
 */
@Controller
@RequestMapping("/leave")
public class LeaveController {

    @Autowired
    private ILeaveService leaveService;

    /**
     * 录入
     */
    @RequestMapping("/leaveView")
    public String leaveView(){
        return "leave/leaveView";
    }

    @RequestMapping("/list")
    public String list(){
        return "leave/list";
    }

    @RequestMapping("/query")
    @ResponseBody
    public LeaveQueryVo query(Integer page, Integer limit){
        PageBean<LeaveVo> pages = leaveService.findByPage(page,limit);
        LeaveQueryVo vo = new LeaveQueryVo();
        vo.setCode("0");
        vo.setMsg("");
        vo.setCount(String.valueOf(pages.getRows()));
        vo.setData(pages.getList());
        return vo;
    }

    /**
     * 保存请假信息
     */
    @RequestMapping("/save")
    public String save(Leave leave,String start,String end){
       leave.setStartDate(DateUtil.parse(start,"yyyy-MM-dd HH:mm:ss"));
       leave.setEndDate(DateUtil.parse(end,"yyyy-MM-dd HH:mm:ss"));
         leaveService.save(leave);
        return "redirect:/nav/index";
    }
}
