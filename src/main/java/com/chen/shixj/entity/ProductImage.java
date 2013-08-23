package com.chen.shixj.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * User: jpm
 * Date: 13-8-22
 * Time: 下午11:23
 */
@Entity
@Table(name = "tbl_product_image")
public class ProductImage  extends IdEntity{
    private Long productId;
    private String imagePath;
    private String originImageName;
    private String pcImageName;
    private String mobileImageName;

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
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
