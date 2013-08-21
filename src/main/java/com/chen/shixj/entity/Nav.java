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
    private int parentNav;
    private Boolean isShowNav;

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

    public int getParentNav() {
        return parentNav;
    }

    public void setParentNav(int parentNav) {
        this.parentNav = parentNav;
    }

    public Boolean getShowNav() {
        return isShowNav;
    }

    public void setShowNav(Boolean showNav) {
        isShowNav = showNav;
    }
}
