package com.tz.service.impl;

import com.tz.dao.ILazyDao;
import com.tz.entity.Lazy;
import com.tz.service.ILazyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

/**
 * Created by Administrator on 2018/1/12 0012.
 */
@Service
@Transactional
public class LazyServiceImpl implements ILazyService{

    @Autowired
    private ILazyDao lazyDao;

    @Override
    public void save(Lazy lazy) {
        lazyDao.save(lazy);
    }
}
