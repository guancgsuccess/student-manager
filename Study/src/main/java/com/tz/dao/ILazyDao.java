package com.tz.dao;

import com.tz.entity.Lazy;

import java.util.List;

/**
 * 违纪
 */
public interface ILazyDao {
    void save(Lazy lazy);

    List<Lazy> findByStatus(String status,Integer pageNow,Integer pageSize);
}
