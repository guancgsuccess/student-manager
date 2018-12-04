package com.tz.service.impl;

import com.tz.dao.IMenuDao;
import com.tz.entity.Menu;
import com.tz.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by Administrator on 2018/1/4 0004.
 */
@Service
@Transactional
public class MenuServiceImpl implements IMenuService{
    @Autowired
    private IMenuDao menuDao;

    @Override
    public List<Menu> findParentByPid(Integer pId) {
        return menuDao.findParentByPid(pId);
    }

    @Override
    public List<Menu> findAll() {
        return menuDao.findAll();
    }

    @Override
    public void saveNodes(Menu menu) {
        //设置默认为不是父目录
        menu.setIsParent("0");
        //更新它对应的父目录的状态为父目录
        menuDao.updateMenuIsParent(menu,"1");
        menuDao.save(menu);
    }

    @Override
    public void deleteNodes(Menu menu) {
        //删除节点
        menuDao.delete(menu);

        //获取该父节点下面所有的子节点.
        List<Menu> menusList = menuDao.findParentByPid(menu.getpId());

        System.out.println("menusList:"+menusList);

        //如果当前父节点下面已经没有任何的子节点记录的话.
        //则表示该父节点已经成为了一级目录
        if(null==menusList || menusList.size()==0){
            //更新该父节点的状态
            menuDao.updateMenuIsParent(menu,"0");
        }
    }

    @Override
    public Menu getById(Integer id) {
        return menuDao.getById(id);
    }

    @Override
    public void update(Menu menu) {
        menuDao.update(menu);
    }
}
