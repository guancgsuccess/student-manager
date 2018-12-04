package com.tz.dao;

import com.tz.entity.Menu;

import java.util.List;

/**
 * Created by Administrator on 2018/1/4 0004.
 */
public interface IMenuDao {
    /**
     * 加载所有的菜单信息
     * @return
     */
    List<Menu> findAll();

    //更新节点isParent字段状态
    void updateMenuIsParent(Menu menu,String isParent);

    /**
     * 保存一个节点信息
     * @param menu
     */
    void save(Menu menu);

    /**
     * 删除节点
     * @param menu
     */
    void delete(Menu menu);

    /**
     * 根据父节点来查询子节点
     */
    List<Menu> findParentByPid(Integer pId);

    /**
     * 根据菜单的id来加载菜单
     */
    Menu getById(Integer id);

    /**
     * 更新节点
     */
    void update(Menu menu);
}
