package com.tz.entity;

/**
 * Created by Administrator on 2018/1/4 0004.
 */
public class LeaveVo extends Leave{
    private String sDate;

    private String eDate;

    public String getsDate() {
        return sDate;
    }

    public void setsDate(String sDate) {
        this.sDate = sDate;
    }

    public String geteDate() {
        return eDate;
    }

    public void seteDate(String eDate) {
        this.eDate = eDate;
    }
}
