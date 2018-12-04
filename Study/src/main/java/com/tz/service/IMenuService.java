package com.tz.service;

import com.tz.entity.Menu;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.lang.management.MemoryUsage;
import java.util.List;

/**
 * Created by Administrator on 2018/1/4 0004.
 */
public interface IMenuService {
    /**
     * 根据父节点来查询子节点
     */
    List<Menu> findParentByPid(Integer pId);
    /**
     * 加载所有的菜单信息
     * @return
     */
    List<Menu> findAll();

    /**
     * 保存节点
     */
    void saveNodes(Menu menu);

    /**
     * 删除节点
     */
    void deleteNodes(Menu menu);

    /**
     * 根据菜单id来加载菜单
     */
    Menu getById(Integer id);

    /**
     * 更新菜单
     */
    void update(Menu menu);
}
