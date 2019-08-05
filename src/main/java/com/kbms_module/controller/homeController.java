package com.kbms_module.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/System")
public class homeController {

    //页面跳转
    @RequestMapping("/hom" +
            "" +
            "" +
            "e")
    public String homepage(){
        //跳转到登录注册页面

        return "user/login";
    }




}

