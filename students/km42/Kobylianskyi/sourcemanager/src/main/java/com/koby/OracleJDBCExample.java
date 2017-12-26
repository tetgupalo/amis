package com.koby;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class OracleJDBCExample {

    public static void main(String[] argv) {

        System.out.println("-------- Oracle JDBC Connection Testing ------");
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        SourceDAO dao = context.getBean(SourceDAO.class);
        System.out.println(dao.getAccounts());
    }
}