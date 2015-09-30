package com.yaolan.wxacm.web.model;

import java.util.Date;

/**
 * Created by Yaolan on 2015/8/14.
 */
public class Prize {
    private Long id;
    private String name;
    private String imgUrl;
    private String tinyImgUrl;
    private Integer grade;
    private Integer stats;
    private Date createTime;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Prize(){

    }

    public Prize(Long id){
      this.id=id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getTinyImgUrl() {
        return tinyImgUrl;
    }

    public void setTinyImgUrl(String tinyImgUrl) {
        this.tinyImgUrl = tinyImgUrl;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getStats() {
        return stats;
    }

    public void setStats(Integer stats) {
        this.stats = stats;
    }


}
