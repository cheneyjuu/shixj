package com.chen.shixj.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * User: jpm
 * Date: 13-8-19
 * Time: 上午10:28
 */
//JPA标识
@Entity
@Table(name = "tbl_nav")
public class Nav extends IdEntity{
    private String navName;
    private String navType;
    private Long parentNav;
    private Boolean isShowNav;
    private String navImagePath;
    private String navImageName;
    private int navOrder;

    public String getNavName() {
        return navName;
    }

    public void setNavName(String navName) {
        this.navName = navName;
    }

    public String getNavType() {
        return navType;
    }

    public void setNavType(String navType) {
        this.navType = navType;
    }

    public Long getParentNav() {
        return parentNav;
    }

    public void setParentNav(Long parentNav) {
        this.parentNav = parentNav;
    }

    public Boolean getShowNav() {
        return isShowNav;
    }

    public void setShowNav(Boolean showNav) {
        isShowNav = showNav;
    }

    public String getNavImagePath() {
        return navImagePath;
    }

    public void setNavImagePath(String navImagePath) {
        this.navImagePath = navImagePath;
    }

    public String getNavImageName() {
        return navImageName;
    }

    public void setNavImageName(String navImageName) {
        this.navImageName = navImageName;
    }

    public int getNavOrder() {
        return navOrder;
    }

    public void setNavOrder(int navOrder) {
        this.navOrder = navOrder;
    }
}
