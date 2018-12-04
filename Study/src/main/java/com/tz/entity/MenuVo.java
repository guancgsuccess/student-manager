package com.tz.entity;

import java.util.List;

/**
 * 满足layui树状结构的json数据
 */
public class MenuVo {
    private String name;
    private List<Children> children;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Children> getChildren() {
        return children;
    }

    public void setChildren(List<Children> children) {
        this.children = children;
    }
}
