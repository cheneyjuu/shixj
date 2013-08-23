package com.chen.shixj.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * User: jpm
 * Date: 13-8-21
 * Time: 上午8:53
 */
@Entity
@Table(name = "tbl_product")
public class Product extends IdEntity {
    private Long navId;
    private String productName;
    private String tmallLink;
    private float productPrice;
    private String details;
    private String productCreateDate;

    public Long getNavId() {
        return navId;
    }

    public void setNavId(Long navId) {
        this.navId = navId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getTmallLink() {
        return tmallLink;
    }

    public void setTmallLink(String tmallLink) {
        this.tmallLink = tmallLink;
    }

    public float getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(float productPrice) {
        this.productPrice = productPrice;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getProductCreateDate() {
        return productCreateDate;
    }

    public void setProductCreateDate(String productCreateDate) {
        this.productCreateDate = productCreateDate;
    }
}
