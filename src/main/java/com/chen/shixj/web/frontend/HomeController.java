package com.chen.shixj.web.frontend;

import com.chen.shixj.entity.*;
import com.chen.shixj.service.info.InfoService;
import com.chen.shixj.service.nav.NavService;
import com.chen.shixj.utility.HTMLSpirit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
    private InfoService infoService;

    @RequestMapping(value = "/home" ,method = RequestMethod.GET)
    public String home(Model model){
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

        Info storyModel = infoService.getLastedInfoWithType(new Integer(Nav.PPGS));
        model.addAttribute("storyModel", storyModel);

        List<Info> infoList = infoService.getIndexInfoWithType(Nav.SXSF);
        model.addAttribute("infoList", infoList);

        List<Info> groupBuyingList = infoService.getIndexInfoWithType(Nav.TGSH);
        model.addAttribute("groupBuyingList", groupBuyingList);

        List<Info> ylyjList = infoService.getIndexInfoWithType(Nav.YLYJ);
        model.addAttribute("ylyjList", ylyjList);
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
