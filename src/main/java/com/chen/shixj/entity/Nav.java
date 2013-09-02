package com.chen.shixj.entity;

import javax.persistence.*;
import java.util.Set;

/**
 * User: jpm
 * Date: 13-8-19
 * Time: 上午10:28
 */
//JPA标识
@Entity
@Table(name = "tbl_nav")
public class Nav extends IdEntity{

    public static String SXSF="1";
    public static String TGSH="2";
    public static String YLYJ="3";
    public static String SXKT="4";
    public static String PPGS="5";
    public static String HZHB="6";
    public static String GYWM="7";


    private String navName;
    private String navType;
    private Long parentNav;
    private Boolean isShowNav;
    private String navImagePath;
    private String navImageName;
    private int navOrder;

//    private Set<Post> posts;
//    private Set<Product>  products;

    private Set<Info> infos;

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

//    @OneToMany(mappedBy = "nav", cascade = CascadeType.ALL)
//    public Set<Post> getPosts() {
//        return posts;
//    }
//
//    public void setPosts(Set<Post> posts) {
//        this.posts = posts;
//    }
//    @OneToMany(mappedBy = "nav", cascade = CascadeType.ALL)
//    public Set<Product> getProducts() {
//        return products;
//    }
//
//    public void setProducts(Set<Product> products) {
//        this.products = products;
//    }

    @OneToMany(mappedBy = "nav", cascade = CascadeType.ALL)
    public Set<Info> getInfos() {
        return infos;
    }

    public void setInfos(Set<Info> infos) {
        this.infos = infos;
    }
}
