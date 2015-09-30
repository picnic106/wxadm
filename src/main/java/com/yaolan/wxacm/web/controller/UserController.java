package com.yaolan.wxacm.web.controller;

import com.yaolan.wxacm.core.util.MD5;
import com.yaolan.wxacm.web.model.User;
import com.yaolan.wxacm.web.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * Created by Yaolan on 2015/8/11.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    Logger logger=Logger.getLogger(UserController.class);
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user, BindingResult result, Model model, HttpServletRequest request) {
        logger.info("come in:"+user.getUsername()+";"+user.getPassword());
        String passmd5= MD5.GetMD5Code(user.getPassword());
        logger.info("come in:"+user.getUsername()+";"+passmd5);
        user.setPassword(passmd5);
        // 验证成功在Session中保存用户信息
        User authUserInfo = userService.authentication(user);
        if (authUserInfo!=null){
            request.getSession().setAttribute("userInfo", authUserInfo);
            return "/user/index";//redirect:/index.jsp
        }else{
            request.setAttribute("ms","用户名或者密码错误，请确认用户名和密码后重新输入！！");
            return "/user/login";
        }

    }

    @RequestMapping(value = "/logout")
    public String logout(User user, BindingResult result, Model model,HttpServletRequest request){
             request.getSession().invalidate();
             request.setAttribute("ms","退出成功！！");
             return "/user/login";
    }


}
