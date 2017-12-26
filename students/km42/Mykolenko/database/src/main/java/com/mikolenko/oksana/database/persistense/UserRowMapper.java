package com.mikolenko.oksana.database.persistense;

import com.mikolenko.oksana.database.persistense.entry.UserEntry;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRowMapper implements RowMapper<UserEntry> {
    @Override
    public UserEntry mapRow(ResultSet rs, int rowNum) throws SQLException {
        if (rs == null) return  null;
        UserEntry userEntry = new UserEntry();
        userEntry.setFirstName(rs.getString("user_firstname"));
        userEntry.setSecondName(rs.getString("user_secondname"));
        userEntry.setEmail(rs.getString("user_email"));
        userEntry.setPassword(rs.getString("user_pass"));
        userEntry.setType(rs.getInt("user_type"));
        return userEntry;
    }
}