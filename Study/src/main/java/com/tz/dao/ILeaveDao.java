package com.tz.dao;

import com.tz.entity.Leave;

import java.util.List;

/**
 * 请假接口
 */
public interface ILeaveDao {
    /**
     * 保存所有的请假记录
     * @param leave
     */
    void save(Leave leave);

    /**
     * 查询所有的请假记录
     */
    List<Leave> findAll(Integer pageNow,Integer pageSize);
}
