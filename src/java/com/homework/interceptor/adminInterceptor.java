package com.homework.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.homework.entity.User;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class adminInterceptor extends HandlerInterceptorAdapter {
    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object arg2, Exception arg3)
            throws Exception {
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object arg2, ModelAndView arg3) throws Exception {
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        //获取session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("admin");
        //判断session中是否有用户数据，如果有就返回true，继续向下执行
        if(user!=null){
            return true;
        }
        //给出提示信息，并转发至登录页面
        request.setAttribute("msg", "不是超级管理员！");
        request.getRequestDispatcher("/performProduct1").forward(request, response);
        return false;
    }
}