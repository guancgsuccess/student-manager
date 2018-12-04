package com.tz.service.impl;

import com.tz.dao.ILeaveDao;
import com.tz.entity.Leave;
import com.tz.entity.LeaveVo;
import com.tz.entity.PageBean;
import com.tz.entity.Leave;
import com.tz.service.ILeaveService;
import com.tz.service.IUserService;
import com.tz.util.DateUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/1/3 0003.
 */
@Service
@Transactional
public class LeaveServiceImpl implements ILeaveService{
    @Autowired
    private ILeaveDao leaveDao;

    @Autowired
    private IUserService userService;

    @Override
    public void save(Leave leave) {
        leave.setUser(userService.findByUserName(leave.getPhone()));
        leaveDao.save(leave);
    }

    @Override
    public PageBean<LeaveVo> findByPage(Integer pageNow, Integer pageSize) {
        PageBean<LeaveVo> pageBean = new PageBean<>();
        pageBean.setPageNow(pageNow);
        pageBean.setPageSize(pageSize);
        int rows = leaveDao.findAll(null,null).size();
        pageBean.setRows(rows);
        if(rows%pageSize==0){
            pageBean.setPageCount(rows/pageSize);
        }else{
            pageBean.setPageCount(rows/pageSize+1);
        }
        List<LeaveVo> list = new ArrayList<>();
        List<Leave> leaves = leaveDao.findAll(pageNow,pageSize);
        for (Leave e:leaves){
            LeaveVo vo = new LeaveVo();
            BeanUtils.copyProperties(e,vo);
            vo.setsDate(e.getStartDate().toString());
            vo.seteDate(e.getEndDate().toString());
            list.add(vo);
        }
        pageBean.setList(list);
        return pageBean;
    }
}
