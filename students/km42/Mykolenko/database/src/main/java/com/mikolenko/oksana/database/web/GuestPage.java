package com.mikolenko.oksana.database.web;

import com.mikolenko.oksana.database.domain.User;
import com.mikolenko.oksana.database.persistense.dao.BookingDAO;
import com.mikolenko.oksana.database.persistense.dao.UserDao;
import com.mikolenko.oksana.database.persistense.entry.FlatEntry;
import com.mikolenko.oksana.database.persistense.entry.UserEntry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;

public class GuestPage {
    private final UserDao userDao;
    private final BookingDAO bookingDAO;

    @Autowired
    public GuestPage(UserDao userDao, BookingDAO bookingDAO, BookingDAO bookingDAO1) {
        this.userDao = userDao;
        this.bookingDAO = bookingDAO1;
    }


    @RequestMapping(path = "/guest")
    public ModelAndView MainPage(ModelAndView modelAndView, HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        String name = principal.getName();

        String role = "/user";
        modelAndView.setViewName("guest_page");
        modelAndView.addObject("myPage", role);
        modelAndView.addObject("UserArray", userDao.getViewAllUsers());
        modelAndView.addObject("BookingArray",bookingDAO.getHostBooking(1) );

        return modelAndView;
    }

}
