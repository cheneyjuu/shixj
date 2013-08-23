package com.chen.shixj.web.frontend;

import com.chen.shixj.entity.Nav;
import com.chen.shixj.service.nav.NavService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * User: Juchen
 * Date: 13-8-22
 * Time: 下午2:28
 */
@Controller
@RequestMapping (value = "/home")
public class HomeController {

    @Autowired
    private NavService navService;

    public String home(Model model){
        List<Nav> navList = navService.getAllNav();
        return "frontend/home";
    }
}
