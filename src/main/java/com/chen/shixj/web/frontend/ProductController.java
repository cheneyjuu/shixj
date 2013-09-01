package com.chen.shixj.web.frontend;

import com.chen.shixj.entity.Info;
import com.chen.shixj.entity.Nav;
import com.chen.shixj.entity.NavHelper;
import com.chen.shixj.service.info.InfoService;
import com.chen.shixj.service.nav.NavService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * User: Juchen
 * Date: 13-8-29
 * Time: 下午10:52
 */
@Controller (value = "frontEndProductController")
public class ProductController {

    private static final int PAGE_SIZE = 15;
    @Autowired
    private NavService navService;
    @Autowired
    private InfoService infoService;

    @RequestMapping(value = "/views/{navId}")
    public String views(@PathVariable(value = "navId") Long navId,
                        @RequestParam(value = "page", defaultValue = "1") int pageNumber,
                        Model model){
        List<Nav> parentList = navService.getAllNavForParentNav(new Long(0));
        List<NavHelper> navHelperList = new ArrayList<NavHelper>();
        for (Nav pnav : parentList){
            NavHelper navHelper = new NavHelper();
            navHelper.setId(pnav.getId());
            navHelper.setNavName(pnav.getNavName());
            navHelper.setNavType(pnav.getNavType());
            navHelper.setNavList(navService.getAllNavForParentNav(pnav.getId()));
            navHelperList.add(navHelper);
        }
        model.addAttribute("navHelperList", navHelperList);
        Nav nav = navService.getNav(navId);
        String navType = nav.getNavType();
        List<Nav> navList = this.getAllNavForNavType(new Integer(navType).intValue());
        Page<Info> productPage = infoService.pageInfoWithNavsParam(pageNumber, PAGE_SIZE, navList, "");
        model.addAttribute("productPage", productPage);
        if (navType.equals("1") || navType.equals("3") || navType.equals("4") || navType.equals("5")){
            return "frontend/productViews";
        } else if (navType.equals("6") || navType.equals("7")) {
            return "frontend/postViews";
        } else {
            return "frontend/groupBuying";
        }
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

    @RequestMapping (value = "/details/{id}")
    public String details(@PathVariable (value = "id") Long id, Model model){
        List<Nav> parentList = navService.getAllNavForParentNav(new Long(0));
        List<NavHelper> navHelperList = new ArrayList<NavHelper>();
        for (Nav pnav : parentList){
            NavHelper navHelper = new NavHelper();
            navHelper.setId(pnav.getId());
            navHelper.setNavName(pnav.getNavName());
            navHelper.setNavType(pnav.getNavType());
            navHelper.setNavList(navService.getAllNavForParentNav(pnav.getId()));
            navHelperList.add(navHelper);
        }
        model.addAttribute("navHelperList", navHelperList);
        Info product = infoService.getInfoById(id);
//        Product product = productService.getProduct(id);
        model.addAttribute("productModel", product);
        return "frontend/productDetails";
    }
}
