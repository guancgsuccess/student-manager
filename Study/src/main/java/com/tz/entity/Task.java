package com.tz.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 任务提交
 */
@Entity
@Table(name="tpcs_task")
public class Task implements Serializable{
    private Long id;

    private String realName;//上传的作者的名称

    private Date createDate;//上传时间

    private String title;//上传文件的标题

    private String taskUrl;//上传的路径

    private String userName;//用户名

    public Task() {
    }

    public Task(String realName, Date createDate, String title,String taskUrl,String userName) {
        this.realName = realName;
        this.createDate = createDate;
        this.title = title;
        this.taskUrl = taskUrl;
        this.userName = userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Column
    public String getUserName() {
        return userName;
    }

    public void setTaskUrl(String taskUrl) {
        this.taskUrl = taskUrl;
    }

    @Column
    public String getTaskUrl() {
        return taskUrl;
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
    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
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
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Task{");
        sb.append("id=").append(id);
        sb.append(", realName='").append(realName).append('\'');
        sb.append(", createDate=").append(createDate);
        sb.append(", title='").append(title).append('\'');
        sb.append(", taskUrl='").append(taskUrl).append('\'');
        sb.append(", userName='").append(userName).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
