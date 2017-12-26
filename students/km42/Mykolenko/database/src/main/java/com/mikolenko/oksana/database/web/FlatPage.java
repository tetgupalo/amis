package com.mikolenko.oksana.database.web;

import com.mikolenko.oksana.database.persistense.dao.BookingDAO;
import com.mikolenko.oksana.database.persistense.dao.FlatDao;
import com.mikolenko.oksana.database.persistense.entry.BookingEntry;
import com.mikolenko.oksana.database.persistense.entry.FlatEntry;
import com.mikolenko.oksana.database.persistense.dao.UserDao;
import com.mikolenko.oksana.database.utils.GetImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class FlatPage {

    private final UserDao userDao;
    private final FlatDao flatDao;
    private  final BookingDAO bookingDAO;

    @Autowired
    public FlatPage(UserDao userDao, FlatDao flatDao, BookingDAO bookingDAO) {

        this.userDao = userDao;
        this.flatDao = flatDao;
        this.bookingDAO = bookingDAO;
    }


    @RequestMapping(path = "/flat")
    public ModelAndView MainPage(ModelAndView modelAndView,
                                 @RequestParam(value = "address",required=true) String address) {

        FlatEntry flatFormItoJ = flatDao.getFlatByAddress(address);
        List<BookingEntry> allByFlatAddress = bookingDAO.getAllByFlatAddress(address);
        modelAndView.setViewName("flat_page");
        modelAndView.addObject("flat",flatFormItoJ);
        modelAndView.addObject("url","/img/"+flatFormItoJ.path);
        modelAndView.addObject("bookingArray",allByFlatAddress);

        return modelAndView;
}


}
