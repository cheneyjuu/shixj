package com.chen.shixj.web.info;

import com.chen.shixj.entity.Nav;
import com.chen.shixj.entity.Info;
import com.chen.shixj.entity.InfoImage;
import com.chen.shixj.service.nav.NavService;
import com.chen.shixj.service.info.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * User: jpm
 * Date: 13-8-21
 * Time: 上午9:44
 */
@Controller
@RequestMapping(value = "/admin/info")
public class InfoController {
    private static final int PAGE_SIZE = 15;

    @Autowired
    private InfoService infoService;

    @Autowired
    private NavService navService;

    @RequestMapping(value = "/add/{navType}", method = RequestMethod.GET)
    public String add(@PathVariable("navType") int navType,Model model) {

        model.addAttribute("navList", this.getAllNavForNavType(navType));
        model.addAttribute("navType", navType);

        return "/admin/" + this.urlStr(navType) + "/add";
    }

    @RequestMapping(value = "/add/{navType}", method = RequestMethod.POST)
    public String add(@Valid Info info,@PathVariable("navType") int navType, @RequestParam(value = "fileNameList", required = false) List<String> fileNameList, @RequestParam(value = "navId") Long navId, RedirectAttributes redirectAttributes) {
        Nav nav = navService.getNav(navId);
        info.setNav(nav);
        info.setInfoImages(this.createInfoImages(fileNameList,info));
        info.setInfoCreateDate(this.createNowData());
        infoService.saveInfo(info);

        redirectAttributes.addAttribute("message", "添加文章成功");
        return "redirect:/admin/info/add/" + navType;

    }

    @RequestMapping(value = "/look/{id}/{navType}", method = RequestMethod.GET)
    public String look(@PathVariable("id") Long id,@PathVariable("navType") int navType, Model model) {

        model.addAttribute("info", infoService.getInfo(id));

        //查询所有一级文章栏目
        List<Nav> navList = navService.getAllNavWithNavTypeParentNav(0, 0L);
        List resultList = new ArrayList();
        for (Nav nav : navList) {
            resultList.add(nav);
            long parentNav = nav.getId();
            List<Nav> subNavList = navService.getAllNavWithNavTypeParentNav(0, parentNav);
            resultList.addAll(subNavList);
        }
        model.addAttribute("navList", resultList);
        model.addAttribute("navType", navType);
        return "/admin/" + this.urlStr(navType) + "/look";
    }

    //获得单个栏目的数据根据栏目id 和搜索条件查询
    @RequestMapping(value = "/list/{navType}", method = RequestMethod.POST)
    public String listForNavId(@RequestParam(value = "navId") int navId,@PathVariable("navType") int navType, @RequestParam(value = "parameter") String parameter, @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model) {
        Page<Info> infoPage = infoService.pageInfo(pageNumber, PAGE_SIZE, navId, parameter);
        model.addAttribute("infoPage", infoPage);

        model.addAttribute("navList", this.getAllNavForNavType(navType));
        model.addAttribute("selectNavId", navId);
        model.addAttribute("parameter", parameter);
        return "/admin/info/list";
    }

    //获得所有栏目的数据
    @RequestMapping(value = "/list/{navType}", method = RequestMethod.GET)
    public String listAll(@PathVariable("navType") int navType,@RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model) {
        //查找所有栏目下文章
        Page<Info> infoPage = infoService.pageInfoWithNavsParam(pageNumber, PAGE_SIZE, this.getAllNavForNavType(navType), "");
//        Page<Info> infoPage = infoService.pageInfo(pageNumber, PAGE_SIZE);
        model.addAttribute("infoPage", infoPage);

        model.addAttribute("navList", this.getAllNavForNavType(navType));
        model.addAttribute("navType", navType);
        return "/admin/" + this.urlStr(navType) + "/list";
    }

    @RequestMapping(value = "/update/{id}/{navType}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id,@PathVariable("navType") int navType, Model model) {
        model.addAttribute("info", infoService.getInfo(id));
        model.addAttribute("navList", this.getAllNavForNavType(navType));
        model.addAttribute("navType", navType);

        return "/admin/" + this.urlStr(navType) + "/update";
    }

    @RequestMapping(value = "/update/{navType}", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("perloadInfo") Info info,@PathVariable("navType") int navType, RedirectAttributes redirectAttributes) {
        infoService.saveInfo(info);
        redirectAttributes.addFlashAttribute("message", "更新文章成功");

        return "redirect:/admin/info/list/"+navType;
    }

    @RequestMapping(value = "/delete/{id}/{navType}")
    public String delete(@PathVariable("id") Long id, @PathVariable("navType") int navType,RedirectAttributes redirectAttributes) {
        infoService.deleteInfo(id);
        redirectAttributes.addFlashAttribute("message", "删除信息成功");
        return "redirect:/admin/info/list/"+navType;
    }

    @ModelAttribute(value = "perloadInfo")
    public Info getInfo(@RequestParam(value = "id", required = false) Long id) {
        if (id != null) {
            return infoService.getInfo(id);
        }
        return null;
    }


    public static String urlStr(int navType){
        if (navType == 1){//
            return "share";
        }else if(navType == 2){
            return "groupBuying";
        }else if(navType == 3){
            return "festival";
        }else if(navType == 4){
            return "classroom";
        }else if(navType == 5){
            return "story";
        }else if(navType == 6){
            return "partner";
        }else if(navType == 7){
            return "about";
        }else {
            return "share";
        }
//        栏目类型 =1食享食分；=2团购实惠；=3有礼有节；=4食享课堂；=5品牌故事；=6合作伙伴；=7关于我们；
    }
    public static Set<InfoImage> createInfoImages(List<String> fileNameList,Info info){
        //处理图片路径
        Set<InfoImage> infoImages = new HashSet<InfoImage>();
        if (fileNameList != null) {
            for (String fileName : fileNameList) {
                if (fileName != "") {
                    InfoImage infoImage = new InfoImage();
                    String[] str = fileName.split("/");
                    String imageName = str[str.length - 1];
                    String imagePath = fileName.substring(0, fileName.length() - imageName.length());
                    infoImage.setMobileImageName("m_" + imageName);
                    infoImage.setOriginImageName("or_" + imageName);
                    infoImage.setPcImageName("pc_" + imageName);
                    infoImage.setImagePath(imagePath);
                    infoImage.setInfo(info);
                    infoImages.add(infoImage);
                }
            }
        }
        return infoImages;
    }
    public static String createNowData(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String createTime = simpleDateFormat.format(new Date());
        return createTime;
    }
    private  List<Nav> getAllNavForNavType(int navType){
        //查询所有一级文章栏目
        List<Nav> navList = navService.getAllNavWithNavTypeParentNav(navType, 0L);
        List<Nav> resultList = new ArrayList();
        for (Nav nav : navList) {
            resultList.add(nav);
            long parentNav = nav.getId();
            List<Nav> subNavList = navService.getAllNavWithNavTypeParentNav(navType, parentNav);
            resultList.addAll(subNavList);
        }
        return resultList;
    }
}
