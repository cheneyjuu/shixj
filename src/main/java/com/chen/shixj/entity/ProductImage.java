package com.chen.shixj.entity;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;

/**
 * User: jpm
 * Date: 13-8-22
 * Time: 下午11:23
 * 在one-to-many双向关联中，多的一方为关系维护端，关系维护端负责外键记录的更新
 * 关系被维护端是没有权力更新外键记录的
 */
@Entity
@Table(name = "tbl_product_image")
public class ProductImage  extends IdEntity{
    private Product product;
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
    @JoinColumn(name = "product_id")
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
