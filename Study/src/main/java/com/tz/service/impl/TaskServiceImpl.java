package com.tz.service.impl;

import com.tz.dao.ITaskDao;
import com.tz.entity.*;
import com.tz.service.ITaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/1/11 0011.
 */
@Service
@Transactional
public class TaskServiceImpl implements ITaskService{
    @Autowired
    private ITaskDao taskDao;

    @Override
    public UploadJsonVo save(MultipartFile file,User user) {

        //获取上传文件的文件名称
        String fileName = file.getOriginalFilename();

        //拼接新的文件名
        fileName = user.getRealName()+"_"+System.currentTimeMillis()+"_"+fileName;

        //layui中上传文件的控件要想能够成功执行,必须要返回一个合格的json语句,
        //否则会抛出上传接口的异常.
        UploadJsonVo vo = new UploadJsonVo();
        vo.setCode("0");
        vo.setMsg("");
        JsonData jsonData = new JsonData();
        jsonData.setSrc("http://localhost:9999/Study/upload/"+fileName);
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
            taskDao.save(t);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return vo;
    }

    @Override
    public void clearAllTask() {

    }

    @Override
    public PageBean<Task> queryPage(String realName, Integer pageNow, Integer pageSize) {
        PageBean<Task> pageBean = new PageBean<>();
        pageBean.setPageNow(pageNow);
        pageBean.setPageSize(pageSize);

        int rows = taskDao.getRows(realName);
        pageBean.setRows(rows);

        Integer pageCount = rows/pageSize;
        if(rows%pageSize!=0)
            pageCount++;
        pageBean.setPageCount(pageCount);
        List<Task> tasks = taskDao.findAll(realName,pageNow,pageSize);
        pageBean.setList(tasks);
        return pageBean;
    }

    @Override
    public void delById(Long id) {
        taskDao.delById(id);
    }
}
