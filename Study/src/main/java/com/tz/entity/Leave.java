package com.tz.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 请假类
 * id number(7) primary key,
     phone varchar2(20) not null,
     startdate TIMESTAMP,
     enddate TIMESTAMP,
     hours number(4,2),
     day number(2),
     remarks varchar2(20),
     user_id number(7) REFERENCES tpcs_user(id)
 */
@Entity
@Table(name = "tpcs_leave")
public class Leave implements Serializable{
    private Long id;

    private String phone;

    //@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date startDate;

  // @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date endDate;

    private double hours;

    private int day;

    private String remarks;

    private User user;

    private String realName;

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Leave() {
    }

    public Leave(String phone, Date startDate, Date endDate, double hours, int day, String remarks) {
        this.phone = phone;
        this.startDate = startDate;
        this.endDate = endDate;
        this.hours = hours;
        this.day = day;
        this.remarks = remarks;
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
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Column
    public double getHours() {
        return hours;
    }

    public void setHours(double hours) {
        this.hours = hours;
    }

    @Column
    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    @Column
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @ManyToOne
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Leave lazy = (Leave) o;

        return id != null ? id.equals(lazy.id) : lazy.id == null;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Leave{");
        sb.append("id=").append(id);
        sb.append(", phone='").append(phone).append('\'');
        sb.append(", startDate=").append(startDate);
        sb.append(", endDate=").append(endDate);
        sb.append(", hours=").append(hours);
        sb.append(", day=").append(day);
        sb.append(", remarks='").append(remarks).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
