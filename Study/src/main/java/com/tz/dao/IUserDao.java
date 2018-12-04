package com.tz.dao;

import com.tz.entity.User;

import java.util.List;

/**
 * 用户接口
 */
public interface IUserDao {
    /**
     * 保存一个用户
     * @param user
     */
    void save(User user);

    /**
     * 查询所有的用户
     * @return
     */
    List<User> findAll(Integer pageNow,Integer pageSize);

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
     * 根据用户的id进行删除
     */
    void delById(Long id);

    /**
     * 更新用户
     * @param user
     */
    void update(User user);

    /**
     * 根据id进行查询
     * @param id
     * @return
     */
    User getById(Long id);
}
