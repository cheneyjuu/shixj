package com.chen.shixj.web.frontend;

import com.chen.shixj.entity.Nav;
import com.chen.shixj.entity.NavHelper;
import com.chen.shixj.entity.Product;
import com.chen.shixj.entity.Story;
import com.chen.shixj.service.nav.NavService;
import com.chen.shixj.service.product.ProductService;
import com.chen.shixj.service.story.StoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * User: Juchen
 * Date: 13-8-22
 * Time: 下午2:28
 */
@Controller
public class HomeController {

    @Autowired
    private NavService navService;
    @Autowired
    private StoryService storyService;
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/home" ,method = RequestMethod.GET)
    public String home(Model model){
        List<Nav> parentList = navService.getAllNavForParentNav(new Long(0));
        List<NavHelper> navHelperList = new ArrayList<NavHelper>();
        for (Nav pnav : parentList){
            NavHelper navHelper = new NavHelper();
            navHelper.setNavName(pnav.getNavName());
            navHelper.setNavType(pnav.getNavType());
            navHelper.setNavList(navService.getAllNavForParentNav(pnav.getId()));
            navHelperList.add(navHelper);
        }
        model.addAttribute("navHelperList", navHelperList);
        Story story = storyService.getLastStory();
        model.addAttribute("storyModel", story);
        List<Product> productList = productService.getIndexProduct();
        model.addAttribute("productList", productList);
        return "frontend/home";
    }

    @RequestMapping (value = "/left", method = RequestMethod.GET)
    public String left(Model model){
        List<Nav> parentList = navService.getAllNavForParentNav(new Long(0));
        List<NavHelper> navHelperList = new ArrayList<NavHelper>();
        for (Nav pnav : parentList){
            NavHelper navHelper = new NavHelper();
            navHelper.setNavName(pnav.getNavName());
            navHelper.setNavType(pnav.getNavType());
            navHelper.setNavList(navService.getAllNavForParentNav(pnav.getId()));
            navHelperList.add(navHelper);
        }
        model.addAttribute("navHelperList", navHelperList);
        return "frontend/left";
    }
}
