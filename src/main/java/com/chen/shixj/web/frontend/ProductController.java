package com.chen.shixj.web.frontend;

import com.chen.shixj.entity.Nav;
import com.chen.shixj.entity.NavHelper;
import com.chen.shixj.entity.Product;
import com.chen.shixj.service.nav.NavService;
import com.chen.shixj.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * User: Juchen
 * Date: 13-8-29
 * Time: 下午10:52
 */
@Controller (value = "frontEndProductController")
public class ProductController {

    @Autowired
    private NavService navService;
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/views/{navId}")
    public String views(@PathVariable(value = "navId") Long navId, Model model){
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
        List<Product> productList = productService.getAllProductForNavId(navId.intValue());
        model.addAttribute("productList", productList);
        if (navType.equals("0")){
            return "frontend/postViews";
        } else {
            return "frontend/productViews";
        }
    }
}
