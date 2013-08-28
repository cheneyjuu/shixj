package com.chen.shixj.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * User: jpm
 * Date: 13-8-22
 * Time: 下午11:23
 * 在one-to-many双向关联中，多的一方为关系维护端，关系维护端负责外键记录的更新
 * 关系被维护端是没有权力更新外键记录的
 */
@Entity
@Table(name = "tbl_story_image")
public class StoryImage extends IdEntity{
    private Story story;
    private String imagePath;
    private String originImageName;
    private String pcImageName;
    private String mobileImageName;

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getOriginImageName() {
        return originImageName;
    }

    public void setOriginImageName(String originImageName) {
        this.originImageName = originImageName;
    }

    public String getPcImageName() {
        return pcImageName;
    }

    public void setPcImageName(String pcImageName) {
        this.pcImageName = pcImageName;
    }

    public String getMobileImageName() {
        return mobileImageName;
    }

    public void setMobileImageName(String mobileImageName) {
        this.mobileImageName = mobileImageName;
    }

    @ManyToOne
    @JoinColumn(name = "story_id")
    public Story getStory() {
        return story;
    }

    public void setStory(Story story) {
        this.story = story;
    }
}
