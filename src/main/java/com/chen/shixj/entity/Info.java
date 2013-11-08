package com.chen.shixj.entity;

import javax.persistence.*;
import java.util.Set;

/**
 * User: jpm
 * Date: 13-8-31
 * Time: 上午10:58
 */
@Entity
@Table(name = "tbl_info")
public class Info  extends IdEntity {
    private Nav nav;
    private String infoTitle;//标题
    private String infoExternalLinks;//外部链接
    private Float infoOriginalPrice;//原价
    private Float infoCurrentPrice;//现价
    private String infoDetails;//详细内容
    private String infoCreateDate;//创建日期
    private Integer infoShowIndex;//是否在首页显示
    private String infoGroupbuyingEndtime;//团购结束时间
    private String infoIntro;//简介
    private Long infoClicks;//点击次数
    private String infoChinaName;//中文名称
    private String infoStandard;//规格
    private String infoPackUnit;//包装单位
    private String infoProduction;//产地
    private String infoDateInProduced;//生产日期
    private String infoShelfLife;//保质期
    private String infoInventoryLevel;//库存量
    private String infoRetailPrice;//零售价
    private String infoWholesalePrice;//批发价格
    private Set<InfoImage> infoImages;

    @ManyToOne
    @JoinColumn(name = "nav_id")
    public Nav getNav() {
        return nav;
    }

    public void setNav(Nav nav) {
        this.nav = nav;
    }

    public String getInfoTitle() {
        return infoTitle;
    }

    public void setInfoTitle(String infoTitle) {
        this.infoTitle = infoTitle;
    }

    public String getInfoExternalLinks() {
        return infoExternalLinks;
    }

    public void setInfoExternalLinks(String infoExternalLinks) {
        this.infoExternalLinks = infoExternalLinks;
    }

    public Float getInfoOriginalPrice() {
        return infoOriginalPrice;
    }

    public void setInfoOriginalPrice(Float infoOriginalPrice) {
        this.infoOriginalPrice = infoOriginalPrice;
    }

    public Float getInfoCurrentPrice() {
        return infoCurrentPrice;
    }

    public void setInfoCurrentPrice(Float infoCurrentPrice) {
        this.infoCurrentPrice = infoCurrentPrice;
    }

    public String getInfoDetails() {
        return infoDetails;
    }

    public void setInfoDetails(String infoDetails) {
        this.infoDetails = infoDetails;
    }

    public String getInfoCreateDate() {
        return infoCreateDate;
    }

    public void setInfoCreateDate(String infoCreateDate) {
        this.infoCreateDate = infoCreateDate;
    }

    public Integer getInfoShowIndex() {
        return infoShowIndex;
    }

    public void setInfoShowIndex(Integer infoShowIndex) {
        this.infoShowIndex = infoShowIndex;
    }

    public String getInfoGroupbuyingEndtime() {
        return infoGroupbuyingEndtime;
    }

    public void setInfoGroupbuyingEndtime(String infoGroupbuyingEndtime) {
        this.infoGroupbuyingEndtime = infoGroupbuyingEndtime;
    }

    public String getInfoIntro() {
        return infoIntro;
    }

    public void setInfoIntro(String infoIntro) {
        this.infoIntro = infoIntro;
    }

    public Long getInfoClicks() {
        return infoClicks;
    }

    public void setInfoClicks(Long infoClicks) {
        this.infoClicks = infoClicks;
    }

    public String getInfoChinaName() {
        return infoChinaName;
    }

    public void setInfoChinaName(String infoChinaName) {
        this.infoChinaName = infoChinaName;
    }

    public String getInfoPackUnit() {
        return infoPackUnit;
    }

    public void setInfoPackUnit(String infoPackUnit) {
        this.infoPackUnit = infoPackUnit;
    }

    public String getInfoProduction() {
        return infoProduction;
    }

    public void setInfoProduction(String infoProduction) {
        this.infoProduction = infoProduction;
    }

    public String getInfoDateInProduced() {
        return infoDateInProduced;
    }

    public void setInfoDateInProduced(String infoDateInProduced) {
        this.infoDateInProduced = infoDateInProduced;
    }

    public String getInfoShelfLife() {
        return infoShelfLife;
    }

    public void setInfoShelfLife(String infoShelfLife) {
        this.infoShelfLife = infoShelfLife;
    }

    public String getInfoInventoryLevel() {
        return infoInventoryLevel;
    }

    public void setInfoInventoryLevel(String infoInventoryLevel) {
        this.infoInventoryLevel = infoInventoryLevel;
    }

    public String getInfoStandard() {
        return infoStandard;
    }

    public void setInfoStandard(String infoStandard) {
        this.infoStandard = infoStandard;
    }

    public String getInfoRetailPrice() {
        return infoRetailPrice;
    }

    public void setInfoRetailPrice(String infoRetailPrice) {
        this.infoRetailPrice = infoRetailPrice;
    }

    public String getInfoWholesalePrice() {
        return infoWholesalePrice;
    }

    public void setInfoWholesalePrice(String infoWholesalePrice) {
        this.infoWholesalePrice = infoWholesalePrice;
    }

    @OneToMany(mappedBy = "info", cascade = CascadeType.ALL)
    public Set<InfoImage> getInfoImages() {
        return infoImages;
    }

    public void setInfoImages(Set<InfoImage> infoImages) {
        this.infoImages = infoImages;
    }
}
//    nav_id：信息对应栏目id
//    info_title:信息标题
//    info_external_links：信息外部链接
//    info_price：信息价格
//    info_details：信息详细内容
//    info_create_date：信息创建时间
//    info_show_index：信息是否首页显示
//    info_intro：信息简介
//    info_groupbuying_endtime：信息团购的结束时间