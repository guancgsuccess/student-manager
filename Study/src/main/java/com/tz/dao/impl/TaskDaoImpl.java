package com.tz.dao.impl;

import com.tz.dao.ITaskDao;
import com.tz.entity.Task;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by Administrator on 2018/1/11 0011.
 */
@Repository
@Transactional
public class TaskDaoImpl implements ITaskDao{
    @Autowired
    private SessionFactory sessionFactory;

    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(Task task) {
        getSession().save(task);
    }

    @Override
    public List<Task> getByUserName(String userName) {
        return getSession().createQuery("select t from Task t where t.userName=:userName").setParameter("userName",userName).list();
    }

    @Override
    public void clearAllTask() {

    }

    @Override
    public List<Task> findAll(String realName, Integer pageNow, Integer pageSize) {
        Criteria c = getSession().createCriteria(Task.class);
        if(null!=realName && realName.trim().length()>0){
            c.add(Restrictions.eq("realName",realName));
        }
        c.setFirstResult((pageNow-1)*pageSize);
        c.setMaxResults(pageSize);
        return c.list();
    }

    @Override
    public int getRows(String realName) {
        Criteria criteria = getSession().createCriteria(Task.class);
        if (null != realName && realName.trim().length() > 0) {
            criteria.add(Restrictions.eq("realName", realName));
        }
        criteria.setProjection(Projections.rowCount());
        return Integer.parseInt(criteria.uniqueResult().toString());
    }

    @Override
    public void delById(Long id) {
        Task t = (Task) getSession().get(Task.class,id);
        if(null!=t){
            getSession().delete(t);
        }
    }
}
