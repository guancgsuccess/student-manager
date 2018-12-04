package com.tz.entity;

import java.util.List;

/**
 * Created by Administrator on 2018/1/3 0003.
 */
public class PageBean<T> {

    private Integer pageNow;

    private Integer pageSize;

    private Integer pageCount;

    private int rows;

    private List<T> list;

    public PageBean() {
    }

    public Integer getPageNow() {
        return pageNow;
    }

    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("PageBean{");
        sb.append("pageNow=").append(pageNow);
        sb.append(", pageSize=").append(pageSize);
        sb.append(", pageCount=").append(pageCount);
        sb.append(", rows=").append(rows);
        sb.append('}');
        return sb.toString();
    }
}
