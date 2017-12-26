package com.mikolenko.oksana.database.persistense.dao;

import com.mikolenko.oksana.database.persistense.entry.BookingEntry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.beans.Transient;
import java.util.List;

@Component
public class BookingDAO {


    private static String FIND_BOOKING_BY_ADDRESS = "SELECT * FROM BOOKING WHERE FLAT_ADRESS_FK = ?";
    private static String FIND_BOOKING_BY_USER_STATUS = "SELECT * FROM BOOKING WHERE HOST_ID_FK ='?' AND BOOKING_STATUS ='1';";



    private final JdbcTemplate JDBCTemplate;

    @Autowired
    public BookingDAO(JdbcTemplate JDBCTemplate) {
        this.JDBCTemplate = JDBCTemplate;
    }


    public List<BookingEntry> getAllByFlatAddress(String address) {

        return JDBCTemplate.query(
                FIND_BOOKING_BY_ADDRESS,
                new Object[]{address},
                (rs, rowNum) -> {
                    BookingEntry bookingEntry = new BookingEntry();
                    bookingEntry.setId(rs.getInt("BOOKING_ID"));
                    bookingEntry.setStatus(rs.getString("BOOKING_STATUS"));
                    bookingEntry.setStartDate(rs.getDate("BOOKING_STARTDATE"));
                    bookingEntry.setFinishDate(rs.getDate("BOOKING_FINISHDATE"));
                    bookingEntry.setHostIdFk(rs.getInt("HOST_ID_FK"));
                    bookingEntry.setGuestIdFk(rs.getInt("GUEST_ID_FK"));
                    bookingEntry.setFlatAddressFk(rs.getString("FLAT_ADRESS_FK"));
                    return bookingEntry;
                });
    }

    public List<BookingEntry> getHostBooking(Integer Id) {

        return JDBCTemplate.query(
                FIND_BOOKING_BY_USER_STATUS,
                new Object[]{Id},
                (rs, rowNum) -> {
                    BookingEntry bookingEntry = new BookingEntry();
                    bookingEntry.setId(rs.getInt("BOOKING_ID"));
                    bookingEntry.setStatus(rs.getString("BOOKING_STATUS"));
                    bookingEntry.setStartDate(rs.getDate("BOOKING_STARTDATE"));
                    bookingEntry.setFinishDate(rs.getDate("BOOKING_FINISHDATE"));
                    bookingEntry.setHostIdFk(rs.getInt("HOST_ID_FK"));
                    bookingEntry.setGuestIdFk(rs.getInt("GUEST_ID_FK"));
                    bookingEntry.setFlatAddressFk(rs.getString("FLAT_ADRESS_FK"));
                    return bookingEntry;
                });
    }


}


