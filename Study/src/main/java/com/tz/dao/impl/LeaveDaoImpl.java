package com.tz.dao.impl;

import com.tz.dao.ILeaveDao;
import com.tz.entity.Leave;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by Administrator on 2018/1/3 0003.
 */
@Repository
@Transactional
public class LeaveDaoImpl implements ILeaveDao{
    @Autowired
    private SessionFactory sessionFactory;

    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(Leave leave) {
        getSession().save(leave);
    }

    @Override
    public List<Leave> findAll(Integer pageNow,Integer pageSize) {
        if(pageNow==null && pageSize==null){
            return getSession().createQuery("from Leave").list();
        }
        return getSession().createQuery("select u from Leave u")
                .setFirstResult((pageNow-1)*pageSize).setMaxResults(pageSize).list();
    }
}
