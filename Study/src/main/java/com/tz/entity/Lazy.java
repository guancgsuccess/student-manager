package com.tz.entity;

import com.sun.javafx.beans.IDProperty;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "tpcs_lazy")
public class Lazy implements Serializable{
    private Long id;

    private Date lazyDate;//记录时间

    private String remarks;//备注

    private int status;//0代表旷课,1代表迟到,2代表早退,3代表玩手机睡觉....

    private User user;//记录当前的用户

    public Lazy() {

    }

    public Lazy(Date lazyDate, String remarks, int status, User user) {
        this.lazyDate = lazyDate;
        this.remarks = remarks;
        this.status = status;
        this.user = user;
    }

    @Id
    @GeneratedValue
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    public Date getLazyDate() {
        return lazyDate;
    }

    public void setLazyDate(Date lazyDate) {
        this.lazyDate = lazyDate;
    }

    @Column
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Column
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @ManyToOne
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Lazy{");
        sb.append("id=").append(id);
        sb.append(", lazyDate=").append(lazyDate);
        sb.append(", remarks='").append(remarks).append('\'');
        sb.append(", status=").append(status);
        sb.append('}');
        return sb.toString();
    }
}
