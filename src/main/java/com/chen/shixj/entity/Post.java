package com.chen.shixj.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * User: jpm
 * Date: 13-8-20
 * Time: 下午1:08
 */
@Entity
@Table(name = "tbl_post")
public class Post extends IdEntity {
    private int navId;
    private String postContent;
    private String postTitle;
    private String postCreateDate;

    public int getNavId() {
        return navId;
    }

    public void setNavId(int navId) {
        this.navId = navId;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostCreateDate() {
        return postCreateDate;
    }

    public void setPostCreateDate(String postCreateDate) {
        this.postCreateDate = postCreateDate;
    }
}
