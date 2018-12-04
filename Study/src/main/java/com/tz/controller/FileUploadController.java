package com.tz.controller;

import com.tz.entity.*;
import com.tz.service.ITaskService;
import org.jboss.logging.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 文件上传
 */
@Controller
@RequestMapping("/file")
public class FileUploadController {
    @Autowired
    private ITaskService taskService;

    @RequestMapping("/uploadView")
    public String uploadView(){
        return "upload/fileUpload";
    }

    @RequestMapping("/list")
    public String list(){
        return "upload/list";
    }

    @RequestMapping("/queryPage")
    public String query(Model model, String realName, @RequestParam(defaultValue = "1") Integer pageNow,@RequestParam(defaultValue = "30") Integer pageSize){
        PageBean<Task> pageBean = taskService.queryPage(realName,pageNow,pageSize);
        model.addAttribute("page",pageBean);
        return "upload/queryPage";
    }

    @RequestMapping("upload")
    @ResponseBody
    public UploadJsonVo upload(MultipartFile file, HttpServletRequest req){
        //获取应用的上下文路径
        //String contextPath = req.getContextPath();
        //获取上传文件的filename
        //由于上传文件是必须等到用户登录之后才能够进行操作,所以为了保证上传文件到服务器的某个目录中的名称是一样的
        //所以此处需要对上传文件的名称进行处理,主要是为了保证唯一性
        //从session作用域中获取当前登录的用户.
        User user = (User) req.getSession().getAttribute("user");

        //获取上传文件的文件名称
        //String fileName = file.getOriginalFilename();

        //拼接新的文件名
        //fileName = user.getRealName()+"_"+System.currentTimeMillis()+"_"+fileName;

       /* //layui中上传文件的控件要想能够成功执行,必须要返回一个合格的json语句,
        //否则会抛出上传接口的异常.
        UploadJsonVo vo = new UploadJsonVo();
        vo.setCode("0");
        vo.setMsg("");
        JsonData jsonData = new JsonData();
        jsonData.setSrc("http://localhost:9999"+contextPath+"/upload/"+fileName);
        List<JsonData> list = new ArrayList<>();
        list.add(jsonData);
        vo.setData(list);

        //拼接上传目录
        String uploadDir = "src\\main\\webapp\\upload\\"+fileName;
        //写入到磁盘中
        try {
            file.transferTo(new File(uploadDir));
            //保存到数据
            Task t = new Task();
            t.setCreateDate(new Date());
            t.setRealName(user.getRealName());
            t.setUserName(user.getUsername());
            t.setTaskUrl("/upload/"+fileName);
            t.setTitle(fileName);
            taskService.save(t);

        } catch (IOException e) {
            e.printStackTrace();
        }*/
        return taskService.save(file,user);
    }
}
