package com.koby;

import com.koby.model.Account;
import com.koby.model.Source;
import com.koby.model.Technology;

import java.util.List;

public interface SourceDAO {

    List<Account> getAccounts();

    void createAccount(Account acc);

    void deleteAccount(Account acc);

    List<Technology> getTechnologies();

    void createTechnology(Technology tech);

    List<Source> getSources();

    void createSource(Source src);

    void deleteSource(Source src);

    List<Account> getAccountsOfSource(Source src);

    List<Technology> getTechnologiesOfSource(Source src);

    void addAccountToSource(Source src, String login);

    void addTechnologyToSource(Source src, String name);

}
