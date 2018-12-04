package com.tz.service;

import com.tz.entity.Leave;
import com.tz.entity.LeaveVo;
import com.tz.entity.PageBean;

import java.util.List;

/**
 * Created by Administrator on 2018/1/3 0003.
 */
public interface ILeaveService   {
    /**
     * 保存所有的请假记录
     * @param leave
     */
    void save(Leave leave);

    PageBean<LeaveVo> findByPage(Integer pageNow, Integer pageSize);
}
