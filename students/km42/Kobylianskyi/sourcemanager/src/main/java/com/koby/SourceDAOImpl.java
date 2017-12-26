package com.koby;

import com.koby.model.Account;
import com.koby.model.Source;
import com.koby.model.Technology;
import oracle.jdbc.OracleTypes;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.annotation.PostConstruct;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@ManagedBean(name = "sourceDao")
@ApplicationScoped
public class SourceDAOImpl implements SourceDAO {

    JdbcTemplate jdbcTemplate;
    SimpleJdbcCall getAllAccountsCall;
    SimpleJdbcCall saveAccountCall;
    SimpleJdbcCall deleteAccountCall;
    SimpleJdbcCall getAllTechnologiesCall;
    SimpleJdbcCall saveTechnologyCall;
    SimpleJdbcCall getAllSourcesCall;
    SimpleJdbcCall saveSourceCall;
    SimpleJdbcCall deleteSourceCall;
    SimpleJdbcCall getAllAccountsOfSourceCall;
    SimpleJdbcCall addAccountToSourceCall;
    SimpleJdbcCall getAllTechnologiesOfSourceCall;
    SimpleJdbcCall addTechnologyToSourceCall;

    //    private final String getAllUsers = "GET_ALL_USERS";
    @PostConstruct
    public void init() {
        DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
        driverManagerDataSource.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
        driverManagerDataSource.setUsername("roma");
        driverManagerDataSource.setPassword("1111");
        driverManagerDataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
        jdbcTemplate = new JdbcTemplate(driverManagerDataSource);
        getAllAccountsCall = new SimpleJdbcCall(jdbcTemplate);
        saveAccountCall = new SimpleJdbcCall(jdbcTemplate);
        deleteAccountCall = new SimpleJdbcCall(jdbcTemplate);

        getAllTechnologiesCall = new SimpleJdbcCall(jdbcTemplate);
        saveTechnologyCall = new SimpleJdbcCall(jdbcTemplate);

        getAllSourcesCall = new SimpleJdbcCall(jdbcTemplate);
        saveSourceCall = new SimpleJdbcCall(jdbcTemplate);
        deleteSourceCall = new SimpleJdbcCall(jdbcTemplate);
        getAllAccountsOfSourceCall = new SimpleJdbcCall(jdbcTemplate);
        addAccountToSourceCall = new SimpleJdbcCall(jdbcTemplate);
        getAllTechnologiesOfSourceCall = new SimpleJdbcCall(jdbcTemplate);
        addTechnologyToSourceCall = new SimpleJdbcCall(jdbcTemplate);


        getAllAccountsCall.withProcedureName("GET_ALL_USERS")
                .addDeclaredParameter(
                        new SqlOutParameter("ACCOUNT_LOGIN", OracleTypes.CURSOR, new RowMapper<List<Account>>() {
                            public List<Account> mapRow(ResultSet rs, int rowNum) {
                                List<Account> accounts = new ArrayList<Account>();
                                try {
                                    do {
                                        Account u = new Account();
                                        u.setLogin(rs.getString("LOGIN"));
                                        u.setDescription(rs.getString("DESCRIPTION"));
                                        accounts.add(u);
                                    } while (rs.next());
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                                return accounts;
                            }
                        })
                );

        saveAccountCall.withProcedureName("CREATE_ACCOUNT")
                .declareParameters(
                        new SqlParameter("LOGIN_IN", OracleTypes.VARCHAR),
                        new SqlParameter("DESCR_IN", OracleTypes.VARCHAR),
                        new SqlOutParameter("ERROR_MSG", OracleTypes.VARCHAR)
                );

        deleteAccountCall.withProcedureName("DELETE_USER")
                .declareParameters(
                        new SqlParameter("LOGIN_IN", OracleTypes.VARCHAR),
                        new SqlOutParameter("ERROR_MSG", OracleTypes.VARCHAR)
                );

        getAllTechnologiesCall.withProcedureName("GET_ALL_TECHNOLOGY")
                .addDeclaredParameter(
                        new SqlOutParameter("TECHNOLOGY", OracleTypes.CURSOR, new RowMapper<List<Technology>>() {
                            public List<Technology> mapRow(ResultSet rs, int rowNum) {
                                List<Technology> technologies = new ArrayList<Technology>();
                                try {
                                    do {
                                        Technology u = new Technology();
                                        u.setName(rs.getString("NAME"));
                                        u.setDescription(rs.getString("DESCRIPTION"));
                                        technologies.add(u);
                                    } while (rs.next());
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                                return technologies;
                            }
                        })
                );

        saveTechnologyCall.withProcedureName("CREATE_TECHNOLOGY")
                .declareParameters(
                        new SqlParameter("NAME_IN", OracleTypes.VARCHAR),
                        new SqlParameter("DESCR_IN", OracleTypes.VARCHAR),
                        new SqlOutParameter("ERROR_MSG", OracleTypes.VARCHAR)
                );

        getAllSourcesCall.withProcedureName("GET_ALL_SOURCE_CODE")
                .addDeclaredParameter(
                        new SqlOutParameter("SOURCE_CODE", OracleTypes.CURSOR, new RowMapper<List<Source>>() {
                            public List<Source> mapRow(ResultSet rs, int rowNum) {
                                List<Source> sources = new ArrayList<Source>();
                                try {
                                    do {
                                        Source u = new Source();
                                        u.setCode(rs.getString("CODE"));
                                        u.setDescription(rs.getString("DESCRIPTION"));
                                        u.setCreateDate(rs.getTimestamp("C_TIME"));
                                        sources.add(u);
                                    } while (rs.next());
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                                return sources;
                            }
                        })
                );
        saveSourceCall.withProcedureName("CREATE_SOURCE_CODE")
                .declareParameters(
                        new SqlParameter("NAME_IN", OracleTypes.VARCHAR),
                        new SqlParameter("DESCRIPTION_IN", OracleTypes.VARCHAR),
                        new SqlOutParameter("ERROR_MSG", OracleTypes.VARCHAR)
                );

        getAllAccountsOfSourceCall.withProcedureName("GET_ACCOUNTS_IN_SOURCE")
                .declareParameters(
                        new SqlParameter("CODE_IN", OracleTypes.VARCHAR),
                        new SqlOutParameter("ACCOUNT_LOGIN", OracleTypes.CURSOR, new RowMapper<List<Account>>() {
                            public List<Account> mapRow(ResultSet rs, int rowNum) {
                                List<Account> accounts = new ArrayList<Account>();
                                try {
                                    do {
                                        Account u = new Account();
                                        u.setLogin(rs.getString("LOGIN"));
                                        u.setDescription(rs.getString("DESCRIPTION"));
                                        accounts.add(u);
                                    } while (rs.next());
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                                return accounts;
                            }
                        })
                );
        addAccountToSourceCall.withProcedureName("ADD_ACCOUNT_TO_SOURCE")
                .declareParameters(new SqlParameter("ACC_NAME", OracleTypes.VARCHAR),
                        new SqlParameter("SOURCE_CODE", OracleTypes.VARCHAR),
                        new SqlOutParameter("ERROR_MSG", OracleTypes.VARCHAR));

        getAllTechnologiesOfSourceCall.withProcedureName("GET_TECHNOLOGIES_IN_SOURCE").declareParameters(
                new SqlParameter("CODE_IN", OracleTypes.VARCHAR),
                new SqlOutParameter("TECHNOLOGY", OracleTypes.CURSOR, new RowMapper<List<Technology>>() {
                    public List<Technology> mapRow(ResultSet rs, int rowNum) {
                        List<Technology> technologies = new ArrayList<Technology>();
                        try {
                            do {
                                Technology u = new Technology();
                                u.setName(rs.getString("NAME"));
                                u.setDescription(rs.getString("DESCRIPTION"));
                                technologies.add(u);
                            } while (rs.next());
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return technologies;
                    }
                })
        );
        addTechnologyToSourceCall.withProcedureName("ADD_TECHNOLOGY_TO_SOURCE")
                .declareParameters(new SqlParameter("NAME_IN", OracleTypes.VARCHAR),
                        new SqlParameter("SOURCE_CODE", OracleTypes.VARCHAR),
                        new SqlOutParameter("ERROR_MSG", OracleTypes.VARCHAR));
    }

    public SourceDAOImpl() {
        super();
    }


    public List<Account> getAccounts() {
        Map<String, Object> out = getAllAccountsCall.execute();
        //System.out.println(out);
        return (List<Account>) ((List) out.get("ACCOUNT_LOGIN")).get(0);
    }

    public void createAccount(Account acc) {
        Map<String, Object> inParams = new HashMap<>();
        inParams.put("LOGIN_IN", acc.getLogin());
        inParams.put("DESCR_IN", acc.getDescription());
        Map<String, Object> out = saveAccountCall.execute(inParams);
        System.out.println(out);
    }

    @Override
    public void deleteAccount(Account acc) {
        Map<String, Object> inParams = new HashMap<>();
        inParams.put("LOGIN_IN", acc.getLogin());
        Map<String, Object> out = deleteAccountCall.execute(inParams);
        System.out.println(out);
    }

    @Override
    public List<Technology> getTechnologies() {
        Map<String, Object> out = getAllTechnologiesCall.execute();
        //System.out.println(out);
        return (List<Technology>) ((List) out.get("TECHNOLOGY")).get(0);
    }

    @Override
    public void createTechnology(Technology tech) {
        Map<String, Object> inParams = new HashMap<>();
        inParams.put("NAME_IN", tech.getName());
        inParams.put("DESCR_IN", tech.getDescription());
        Map<String, Object> out = saveTechnologyCall.execute(inParams);
        System.out.println(out);
    }

    @Override
    public List<Source> getSources() {
        Map<String, Object> out = getAllSourcesCall.execute();
        System.out.println(out);
        return (List<Source>) ((List) out.get("SOURCE_CODE")).get(0);
    }

    @Override
    public void createSource(Source src) {
        Map<String, Object> inParams = new HashMap<>();
        inParams.put("NAME_IN", src.getCode());
        inParams.put("DESCRIPTION_IN", src.getDescription());
        Map<String, Object> out = saveSourceCall.execute(inParams);
        System.out.println(out);
    }

    @Override
    public void deleteSource(Source src) {

    }

    @Override
    public List<Account> getAccountsOfSource(Source src) {
        Map<String, Object> inParams = new HashMap<>();
        inParams.put("CODE_IN", src.getCode());
        Map<String, Object> out = getAllAccountsOfSourceCall.execute(inParams);
        //System.out.println(out);
        return (List<Account>) ((List) out.get("ACCOUNT_LOGIN")).get(0);
    }

    @Override
    public List<Technology> getTechnologiesOfSource(Source src) {
        Map<String, Object> inParams = new HashMap<>();
        inParams.put("CODE_IN", src.getCode());
        Map<String, Object> out = getAllTechnologiesOfSourceCall.execute(inParams);
        if( ((List) out.get("TECHNOLOGY")).isEmpty())
            return null;
        return (List<Technology>) ((List) out.get("TECHNOLOGY")).get(0);
    }

    @Override
    public void addAccountToSource(Source src, String login) {
        Map<String, Object> inParams = new HashMap<>();
        inParams.put("SOURCE_CODE", src.getCode());
        inParams.put("ACC_NAME", login);
        Map<String, Object> out = addAccountToSourceCall.execute(inParams);
    }

    @Override
    public void addTechnologyToSource(Source src, String name) {
        Map<String, Object> inParams = new HashMap<>();
        inParams.put("SOURCE_CODE", src.getCode());
        inParams.put("NAME_IN", name);
        Map<String, Object> out = addTechnologyToSourceCall.execute(inParams);
    }


}
