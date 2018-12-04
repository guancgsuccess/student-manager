package com.tz.service;

import com.tz.entity.PageBean;
import com.tz.entity.Task;
import com.tz.entity.UploadJsonVo;
import com.tz.entity.User;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by Administrator on 2018/1/11 0011.
 */
public interface ITaskService {
    /**
     * 保存一个上传作业的记录
     */
    UploadJsonVo save(MultipartFile file,User user);

    /**
     * 清空所有的上传的作业
     */
    void clearAllTask();

    /**
     * 查询所有的上传的任务
     * @return
     */
    PageBean<Task> queryPage(String realName,Integer pageNow,Integer pageSize);

    /**
     * 根据id进行删除
     */
    void delById(Long id);
}
