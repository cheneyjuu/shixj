package com.chen.shixj.entity;

import org.springframework.stereotype.Component;

import java.util.List;

/**
 * User: Juchen
 * Date: 13-8-22
 * Time: 下午2:40
 */
@Component
public class NavHelper {
    private Long id;
    private String navName;
    private String navType;
    private List<Nav> navList;

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

    public List<Nav> getNavList() {
        return navList;
    }

    public void setNavList(List<Nav> navList) {
        this.navList = navList;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
