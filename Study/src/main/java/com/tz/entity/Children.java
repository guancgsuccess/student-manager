package com.tz.entity;

/**
 * Created by Administrator on 2018/1/6 0006.
 */
public class Children {
    private String name;

    private String href;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Children{");
        sb.append("name='").append(name).append('\'');
        sb.append(", href='").append(href).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
