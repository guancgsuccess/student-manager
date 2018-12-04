package com.tz.entity;

import javax.persistence.*;
import java.io.Serializable;

import java.util.Date;

/**
 * 用户实体类
 */
@Entity
@Table(name = "tpcs_user")
public class User implements Serializable{
    private Long id;

    private String username;

    private String password;

    private String realName;

    private String phone;

    private Date createDate;

    private int power;//权限,0代表普通用户,1代表超级管理员

    private String remark;

    private int status;//状态

    private Gender gender;

    public User() {

    }

    public User(String username, String password, String realName, String phone, Date createDate, int power, String remark, int status,Gender gender) {
        this.username = username;
        this.password = password;
        this.realName = realName;
        this.phone = phone;
        this.createDate = createDate;
        this.power = power;
        this.remark = remark;
        this.status = status;
        this.gender = gender;
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
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column
    public String getPassword() {
        return password;
    }

    @Column
    public void setPassword(String password) {
        this.password = password;
    }

    @Column
    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
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
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Column
    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    @Column
    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Column
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    @Column
    @Enumerated(EnumType.STRING)
    public Gender getGender() {
        return gender;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        return id != null ? id.equals(user.id) : user.id == null;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }


    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("User{");
        sb.append("id=").append(id);
        sb.append(", username='").append(username).append('\'');
        sb.append(", password='").append(password).append('\'');
        sb.append(", realName='").append(realName).append('\'');
        sb.append(", phone='").append(phone).append('\'');
        sb.append(", createDate=").append(createDate);
        sb.append(", power=").append(power);
        sb.append(", remark='").append(remark).append('\'');
        sb.append(", status=").append(status);
        //sb.append(", gender=").append("F".equals(gender.toString())?"女":"男");
        sb.append('}');
        return sb.toString();
    }
}
