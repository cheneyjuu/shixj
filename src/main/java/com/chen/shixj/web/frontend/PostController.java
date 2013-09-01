package com.chen.shixj.web.frontend;

import com.chen.shixj.entity.Info;
import com.chen.shixj.entity.Nav;
import com.chen.shixj.entity.NavHelper;
import com.chen.shixj.service.info.InfoService;
import com.chen.shixj.service.nav.NavService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * User: Juchen
 * Date: 13-9-1
 * Time: 下午12:07
 */
@Controller
@RequestMapping (value = "/post")
public class PostController {

    @Autowired
    private NavService navService;
    @Autowired
    private InfoService infoService;

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
        Info info = infoService.getInfo(id);
        model.addAttribute("infoModel", info);
        return "frontend/storyDetails";
    }
}
