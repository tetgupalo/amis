package com.mikolenko.oksana.database.persistense.dao;

import com.mikolenko.oksana.database.persistense.UserRowMapper;
import com.mikolenko.oksana.database.persistense.entry.UserEntry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.validation.constraints.NotNull;
import java.util.List;

@Component
public class UserDao {
    private static String FIND_BY_EMAIL = "SELECT * FROM \"User\"  WHERE USER_EMAIL=?";
    private static String FIND_ROLE_USER_BY_EMAIL = "SELECT USER_TYPE FROM \"User\"  WHERE USER_EMAIL=?";
    private static String ADD_NEW_USER = "INSERT INTO \"User\" (USER_ID,USER_FIRSTNAME, USER_SECONDNAME, USER_EMAIL, USER_PASS, USER_TYPE) VALUES (User_SEQ.nextval,?,?,?,?,?)";
    private static String VIEW_ALL_USERS ="SELECT * FROM \"User\" WHERE USER_TYPE='1' OR USER_TYPE='0'";
    private static String  DELETE_USER="DELETE FROM \"User\" WHERE USER_EMAIL='?' ";

    private final JdbcTemplate JDBCTemplate;

    @Autowired
    public UserDao(JdbcTemplate JDBCTemplate) {
        this.JDBCTemplate = JDBCTemplate;
    }

    public UserEntry findByEmail(@NotNull String email) {

        try {
            return JDBCTemplate.queryForObject(FIND_BY_EMAIL, new Object[]{email}, new UserRowMapper());
        } catch (EmptyResultDataAccessException e) {
            return null;
        }

    }
    public UserEntry deleteUser(@NotNull String email) {

        try {
            return JDBCTemplate.queryForObject(DELETE_USER, new Object[]{email}, new UserRowMapper());
        } catch (EmptyResultDataAccessException e) {
            return null;
        }

    }


    public void saveUser(UserEntry user) {

        JDBCTemplate.update(ADD_NEW_USER, user.getFirstName(), user.getSecondName(), user.getEmail(), user.getPassword(), user.getType());
    }

    public String getRoleUser(String name) {
        Integer user_type = JDBCTemplate.queryForObject(FIND_ROLE_USER_BY_EMAIL, new Object[]{name},
                (rs, rowNum) -> {
                    return rs.getInt("USER_TYPE");
                }
        );

        if (user_type == 0)
            return "user";
        else if (user_type == 1) return "host";

        return "admin";
    }

    public List<UserEntry> getViewAllUsers(){
        return JDBCTemplate.query(VIEW_ALL_USERS, new UserRowMapper()

        );

       // VIEW_ALL_USERS
    }

}
