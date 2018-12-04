package com.tz.dao;

import com.tz.entity.Task;

import java.util.List;

/**
 * Created by Administrator on 2018/1/11 0011.
 */
public interface ITaskDao {

    /**
     * 保存一个上传作业的记录
     * @param task
     */
    void save(Task task);

    /**
     * 查看自己的上传作业的记录
     * 因为userName是唯一的
     */
    List<Task> getByUserName(String userName);

    /**
     * 清空所有的上传的作业
     */
    void clearAllTask();

    /**
     * 查询所有的上传的任务
     * @return
     */
    List<Task> findAll(String realName,Integer pageNow,Integer pageSize);

    /**
     * 查看满足条件的个数
     */
    int getRows(String realName);

    /**
     * 根据id进行删除操作
     */
    void delById(Long id);
}
