package com.chen.shixj.entity;


import javax.persistence.*;
import java.util.Set;

/**
 * User: jpm
 * Date: 13-8-21
 * Time: 上午8:53
 * 碰到many为末端的加载就是延迟加载，若one为末端则为立即加载，除了one-to-one。
 */
@Entity
@Table(name = "tbl_story")
public class Story extends IdEntity {

    private String storyTitle;
    private String storyContent;
    private String storyCreateDate;
    private Set<StoryImage> storyImages;

    public String getStoryTitle() {
        return storyTitle;
    }

    public void setStoryTitle(String storyTitle) {
        this.storyTitle = storyTitle;
    }

    public String getStoryContent() {
        return storyContent;
    }

    public void setStoryContent(String storyContent) {
        this.storyContent = storyContent;
    }

    public String getStoryCreateDate() {
        return storyCreateDate;
    }

    public void setStoryCreateDate(String storyCreateDate) {
        this.storyCreateDate = storyCreateDate;
    }
    @OneToMany(mappedBy = "story", cascade = CascadeType.ALL)
    public Set<StoryImage> getStoryImages() {
        return storyImages;
    }

    public void setStoryImages(Set<StoryImage> storyImages) {
        this.storyImages = storyImages;
    }
}