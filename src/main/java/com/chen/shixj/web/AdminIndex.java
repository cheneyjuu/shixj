package com.chen.shixj.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * User: Juchen
 * Date: 13-8-18
 * Time: 下午6:11
 */
@Controller
public class AdminIndex {

    @RequestMapping (value = "/admin/index")
    public String index(){
        return "/admin/index";
    }
}
