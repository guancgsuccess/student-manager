package com.tz.service.impl;

import com.tz.dao.IUserDao;
import com.tz.entity.PageBean;
import com.tz.entity.User;
import com.tz.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

/**
 * Created by Administrator on 2018/1/2 0002.
 */
@Service
@Transactional
public class UserServiceImpl implements IUserService{
    @Autowired
    private IUserDao userDao;

    @Override
    public PageBean<User> findByPage(Integer pageNow, Integer pageSize) {
        PageBean<User> pageBean = new PageBean<>();
        pageBean.setPageNow(pageNow);
        pageBean.setPageSize(pageSize);
        int rows = userDao.findAll(null,null).size();
        pageBean.setRows(rows);
        if(rows%pageSize==0){
            pageBean.setPageCount(rows/pageSize);
        }else{
            pageBean.setPageCount(rows/pageSize+1);
        }
        pageBean.setList(userDao.findAll(pageNow,pageSize));
        return pageBean;
    }

    @Override
    public void save(User user) {
        userDao.save(user);
    }

    @Override
    public User findByUserName(String username) {
        return userDao.findByUserName(username);
    }

    @Override
    public User findByRealName(String realName) {
        return userDao.findByRealName(realName);
    }

    @Override
    public void delById(Long id) {
        userDao.delById(id);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public User getById(Long id) {
        return userDao.getById(id);
    }
}
