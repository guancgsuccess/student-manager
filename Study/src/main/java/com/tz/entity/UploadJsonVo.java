package com.tz.entity;

import java.util.List;

/**
 * Created by Administrator on 2018/1/6 0006.
 */
public class UploadJsonVo {
    private String code;

    private String msg;

    private List<JsonData> data;

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

    public List<JsonData> getData() {
        return data;
    }

    public void setData(List<JsonData> data) {
        this.data = data;
    }
}
