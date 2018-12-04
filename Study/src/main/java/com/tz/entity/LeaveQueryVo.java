package com.tz.entity;

import java.util.List;

/**
 * Created by Administrator on 2017/11/23 0023.
 */
public class LeaveQueryVo {
    private String code;

    private String msg;

    private String count;

    private List<LeaveVo> data;

    public LeaveQueryVo() {

    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public List<LeaveVo> getData() {
        return data;
    }

    public void setData(List<LeaveVo> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("LayerVo{");
        sb.append("code='").append(code).append('\'');
        sb.append(", msg='").append(msg).append('\'');
        sb.append(", count='").append(count).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
