package com.tz.dao.impl;

import com.tz.dao.IMenuDao;
import com.tz.entity.Menu;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
@Repository
@Transactional
public class MenuDaoImpl implements IMenuDao{
    @Autowired
    private SessionFactory sessionFactory;

    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<Menu> findAll() {
        return getSession().createCriteria(Menu.class).list();
    }

    @Override
    public void updateMenuIsParent(Menu menu, String isParent) {
        getSession().createQuery("update Menu set isParent=:isparent where id=:id")
                    .setParameter("isparent",isParent)
                    .setParameter("id",menu.getpId()).executeUpdate();
    }

    @Override
    public void save(Menu menu) {
        getSession().save(menu);
    }

    @Override
    public void delete(Menu menu) {
        getSession().delete(menu);
    }

    @Override
    public List<Menu> findParentByPid(Integer pId) {
        return getSession().createQuery("select m from Menu m where m.pId=:pId").setParameter("pId",pId).list();
    }

    @Override
    public Menu getById(Integer id) {
        return (Menu) getSession().get(Menu.class,id);
    }

    @Override
    public void update(Menu menu) {
        getSession().update(menu);
    }
}
