package com.mikolenko.oksana.database.web;

import com.mikolenko.oksana.database.persistense.dao.FlatDao;
import com.mikolenko.oksana.database.persistense.entry.FlatEntry;
import com.mikolenko.oksana.database.persistense.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;

@Controller
public class HomePage {

    private final UserDao userDao;
    private final FlatDao flatDao;

    @Autowired
    public HomePage(UserDao userDao, FlatDao flatDao) {

        this.userDao = userDao;
        this.flatDao = flatDao;
    }

    @RequestMapping(path = "/")
    public ModelAndView MainPage(ModelAndView modelAndView, HttpServletRequest request ) {
        Principal principal = request.getUserPrincipal();
        String name = principal.getName();
        String role =  "/" + userDao.getRoleUser(name);
        List<FlatEntry> flatFormItoJ = flatDao.getFlatFormItoJ(1, 30);
        modelAndView.setViewName("home_page");
        modelAndView.addObject("flatArray",flatFormItoJ);
        modelAndView.addObject("myPage",role);

        return modelAndView;
    }


}
