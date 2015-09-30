package com.yaolan.wxacm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 视图控制器,返回jsp视图给前端
 *
 *
 *
 **/
@Controller
@RequestMapping("/page")
public class PageController {
    /**
     * 登录页
     */
    @RequestMapping("/login/*")
    public String login() {
System.out.println("aaa");
        return "/user/login";
    }

    /**
     * 登录页
     */
    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        return "/user/index";
    }

    /**
     * 登录页
     */
    @RequestMapping("/ac")
    public String ac(HttpServletRequest request) {
        return "/ac/activity";
    }

    /**
     * 登录页
     */
    @RequestMapping("/pz")
    public String pz(HttpServletRequest request) {
        return "/pz/prize";
    }

    /**
     * 登录页
     */
    @RequestMapping("/add_ac")
    public String add_ac(HttpServletRequest request) {
        return "/ac/add_ac";
    }

    /**
     * 登录页
     */
    @RequestMapping("/add_pz")
    public String add_pz(HttpServletRequest request) {
        return "/pz/add_pz";
    }
}
