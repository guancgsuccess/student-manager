package com.tz.service;

import com.tz.entity.PageBean;
import com.tz.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2018/1/2 0002.
 */
public interface IUserService {

    PageBean<User> findByPage(Integer pageNow, Integer pageSize);

    /**
     * 保存一个用户
     * @param user
     */
    void save(User user);

    /**
     * 根据用户的用户名或者联系方式进行查询
     * @param
     * @return
     */
    User findByUserName(String username);

    /**
     * 根据用户的真实姓名来查询用户
     */
    User findByRealName(String realName);

    /**
     * 根据用户的id进行删除操作
     */
    void delById(Long id);

    /**
     * 更新用户
     */
    void update(User user);

    User getById(Long id);
}
