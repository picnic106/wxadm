package com.yaolan.wxacm.web.model;





import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by Yaolan on 2015/8/12.
 */
public class Wxac {
    private Long id;
    private String name;

    private Date startTime;

    private Date endTime;
    private String imgUrl;
    private String tinyImgUrl;
    private String intro;
    private Integer stats;
    private Integer type;
    private Date createTime;


    public Wxac(){
    }

    public Wxac(Long id){
        this.id=id;

    }

    public Wxac(String name,Date startTime,Date endTime,String intro){
        this.name=name;
        this.startTime=startTime;
        this.endTime=endTime;
        this.intro=intro;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
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

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public int getStats() {
        return stats;
    }

    public void setStats(Integer stats) {
        this.stats = stats;
    }

    public int getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }


    @Override
    public String toString() {
        return "User [id=" + id + ", name=" +name+ ", intro=" + intro +"]";
    }

}
