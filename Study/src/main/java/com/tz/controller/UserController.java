package com.tz.controller;

import com.tz.entity.PageBean;
import com.tz.entity.User;
import com.tz.entity.UserQueryVo;
import com.tz.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by Administrator on 2018/1/2 0002.
 */
@Controller
@RequestMapping("/user")
public class UserController {
   @Autowired
   private IUserService userService;

    @RequestMapping("/registerView")
    public String registerView() {
        return "user/register";
    }

    @RequestMapping("/login")
    @ResponseBody
    public String login(String username, String password, String flag, HttpServletResponse response,HttpServletRequest request) {
        //根据用户名查询
        User user = userService.findByUserName(username);
        System.out.println(user);
        if(user==null){
            return "0";
        }else{
            if(user.getPassword().equals(password)){
                //将用户放入到session作用域中
               request.getSession().setAttribute("user",user);

               //判断是否记住密码
                if(flag!=null){
                    //创建一个Cookie
                    Cookie c = new Cookie("login",username+":"+password);
                    c.setPath("/");
                    c.setMaxAge(24*60*60*30);
                    //写入到本地
                    response.addCookie(c);
                }
                return "1";
            }else{
                return "2";
            }
        }
    }

    /**
     * 安全退出
     * @return
     */
    @RequestMapping("/exit")
    public String exit(HttpSession session){
        session.invalidate();
        return "redirect:loginView";
    }

    @RequestMapping("/loginView")
    public String loginView() {
        return "user/login";
    }

    @RequestMapping("/success")
    public String success() {
        return "user/success";
    }

    @RequestMapping("/register")
    public String register(User user) {
        user.setCreateDate(new Date());
        userService.save(user);
        return "redirect:loginView";
    }

    /**
     * 注册的时候,用来判断用户名是否已经存在了
     */
    @RequestMapping("/checkUserName")
    @ResponseBody
    public String checkUserName(String username){
        User user = userService.findByUserName(username);
        if(user!=null){
            return "error";
        }
        return "ok";
    }

    @RequestMapping("/getPhone")
    @ResponseBody
    public String getPhone(String realName){
        User user = userService.findByRealName(realName);
        if(user!=null){
            return user.getPhone();
        }
        return "error";
    }

    @RequestMapping("/list")
    public String list(){
        return "user/list";
    }

    @RequestMapping("/query")
    @ResponseBody
    public UserQueryVo query(Integer page, Integer limit){
        PageBean<User> pages = userService.findByPage(page,limit);
        UserQueryVo vo = new UserQueryVo();
        vo.setCode("0");
        vo.setMsg("");
        vo.setCount(String.valueOf(pages.getRows()));
        vo.setData(pages.getList());
        return vo;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(Long id){
        userService.delById(id);
        return "success";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(String remark,Long id){
        User user = userService.getById(id);
        user.setRemark(remark);
        userService.update(user);
        return "success";
    }
}