package com.yaolan.wxacm.web.interceptor;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Yaolan on 2015/8/14.
 */
public class LoginInterceptor implements HandlerInterceptor {
    Logger logger= Logger.getLogger(LoginInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session=httpServletRequest.getSession(false);

//        Object userInfo=null;
//        if (session!=null){
//             userInfo=session.getAttribute("userInfo");
//        }
//        logger.info("session-userInfo:"+session+"-"+userInfo);
//        if (session==null||userInfo==null){
//            httpServletResponse.sendRedirect("/wxacm/rest/page/login");
//            return false;
//        }else{
//            return true;
//        }
        return true;

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
