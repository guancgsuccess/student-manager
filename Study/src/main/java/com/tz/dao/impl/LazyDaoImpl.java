package com.tz.dao.impl;

import com.tz.dao.ILazyDao;
import com.tz.entity.Lazy;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by Administrator on 2018/1/12 0012.
 */
@Repository
@Transactional
public class LazyDaoImpl implements ILazyDao{
    @Autowired
    private SessionFactory sessionFactory;

    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(Lazy lazy) {
        getSession().save(lazy);
    }

    @Override
    public List<Lazy> findByStatus(String status, Integer pageNow, Integer pageSize) {
        Criteria c = getSession().createCriteria(Lazy.class);
        if(null!=status && status.length()>0){
            int st = Integer.parseInt(status);
            c.add(Restrictions.eq("status",st));
            c.setFirstResult((pageNow-1)*pageSize);
            c.setMaxResults(pageSize);
        }
        return c.list();
    }
}
