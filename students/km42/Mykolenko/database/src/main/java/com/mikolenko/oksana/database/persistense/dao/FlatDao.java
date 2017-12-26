package com.mikolenko.oksana.database.persistense.dao;

import com.mikolenko.oksana.database.persistense.entry.FlatEntry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class FlatDao {
    private static String FIND_BY_FLAT = "SELECT * FROM\n" +
            "  (SELECT rownum rn, FLAT.flat_adress,FLAT.flat_price,FLAT.FLAT_TYPE, FLAT.FLAT_DESCRIPTION, FLAT_IMG_URL  FROM FLAT)\n" +
            "WHERE rn BETWEEN ? " +
            " AND ?";

    private static String ADD_NEW_USER = "INSERT INTO \"User\" (USER_ID,USER_FIRSTNAME, USER_SECONDNAME, USER_EMAIL, USER_PASS, USER_TYPE) VALUES (User_SEQ.nextval,?,?,?,?,?)";
    private static String FIND_FLAB_BY_ADDRESS = "Select * FROM FLAT where FLAT_ADRESS = ?";

    private final JdbcTemplate JDBCTemplate;

    @Autowired
    public FlatDao(JdbcTemplate JDBCTemplate) {
        this.JDBCTemplate = JDBCTemplate;
    }

    public List<FlatEntry> getFlatFormItoJ(int from, int to) {

        return JDBCTemplate.query(
                FIND_BY_FLAT,
                new Object[]{from,to},
                (rs, rowNum) -> {
                FlatEntry Flat = new FlatEntry();
                Flat.setFlatAddress(rs.getString("FLAT_ADRESS"));
                Flat.setFlatDescription(rs.getString("FLAT_DESCRIPTION"));
                Flat.setFlatPrice(rs.getInt("FLAT_PRICE"));
                Flat.setFlatType(rs.getString("FLAT_TYPE"));
                Flat.setPath(rs.getString("FLAT_IMG_URL"));
                return Flat;
            });
    }

    public FlatEntry getFlatByAddress(String address) {
        return JDBCTemplate.queryForObject(
                FIND_FLAB_BY_ADDRESS,
                new Object[]{address},
                (rs, rowNum) -> {
                    FlatEntry Flat = new FlatEntry();
                    Flat.setFlatAddress(rs.getString("FLAT_ADRESS"));
                    Flat.setFlatDescription(rs.getString("FLAT_DESCRIPTION"));
                    Flat.setFlatPrice(rs.getInt("FLAT_PRICE"));
                    Flat.setFlatType(rs.getString("FLAT_TYPE"));
                    Flat.setPath(rs.getString("FLAT_IMG_URL"));
                    return Flat;
                });
    }
}


