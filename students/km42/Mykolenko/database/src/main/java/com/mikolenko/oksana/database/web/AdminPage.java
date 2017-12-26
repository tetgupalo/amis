package com.mikolenko.oksana.database.web;

import com.mikolenko.oksana.database.persistense.dao.UserDao;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@Controller
public class AdminPage {
    private final UserDao userDao;

    @Autowired
    public AdminPage(UserDao userDao) {
        this.userDao = userDao;
    }



    @RequestMapping(path = "/admin")
    public ModelAndView MainPage(ModelAndView modelAndView, HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        String name = principal.getName();
        String role = "/admin";
        modelAndView.setViewName("admin_page");
        modelAndView.addObject("myPage", role);
        modelAndView.addObject("UserArray", userDao.getViewAllUsers());




        return modelAndView;
    }
    @RequestMapping(value ="/admin_delete/", method = RequestMethod.POST)
    public void process(@RequestBody String payload){
        System.out.println(payload);
    }



}