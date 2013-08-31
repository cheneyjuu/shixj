package com.chen.shixj.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * User: jpm
 * Date: 13-8-31
 * Time: 上午11:03
 */
@Entity
@Table(name = "tbl_info_image")
public class InfoImage  extends IdEntity{
    private Info info;
    private String imagePath;
    private String originImageName;
    private String pcImageName;
    private String mobileImageName;

    @ManyToOne
    @JoinColumn(name = "info_id")
    public Info getInfo() {
        return info;
    }

    public void setInfo(Info info) {
        this.info = info;
    }

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
}
