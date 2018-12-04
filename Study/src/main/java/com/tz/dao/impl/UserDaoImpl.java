package com.tz.dao.impl;

import com.tz.dao.IUserDao;
import com.tz.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by Administrator on 2018/1/2 0002.
 */
@Repository
@Transactional
public class UserDaoImpl implements IUserDao{

    @Autowired
    private SessionFactory sessionFactory;

    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(User user) {
        getSession().save(user);
    }

    @Override
    public List<User> findAll(Integer pageNow,Integer pageSize) {
        if(pageNow==null && pageSize==null){
            return getSession().createQuery("from User").list();
        }
        return getSession().createQuery("select u from User u")
                .setFirstResult((pageNow-1)*pageSize).setMaxResults(pageSize).list();
    }

    @Override
    public User findByUserName(String username) {
        return (User) getSession().createQuery("select u from User u where u.username=:username or u.phone=:phone")
                .setParameter("username",username).setParameter("phone",username).uniqueResult();
    }

    @Override
    public User findByRealName(String realName) {
        return (User) getSession().createQuery("select u from User u where u.realName=:realName")
                .setParameter("realName",realName).uniqueResult();

    }

    @Override
    public void delById(Long id) {
        getSession().createQuery("delete from User u where u.id=:id").setParameter("id",id).executeUpdate();
    }

    @Override
    public void update(User user) {
        getSession().update(user);
    }

    @Override
    public User getById(Long id) {
        return (User) getSession().get(User.class,id);
    }
}
