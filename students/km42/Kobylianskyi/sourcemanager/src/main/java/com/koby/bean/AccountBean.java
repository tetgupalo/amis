package com.koby.bean;

import com.koby.SourceDAO;
import com.koby.model.Account;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import java.io.Serializable;
import java.util.List;

@ManagedBean(name = "dtAccount")
@ViewScoped
public class AccountBean implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private List<Account> accounts;
    private Account selectedAccount;
    private Account newAccount;

    @PostConstruct
    public void init() {
        newAccount = new Account();
    }

    @ManagedProperty("#{sourceDao}")
    SourceDAO dao;

    public List<Account> getAccounts() {
//        if (accounts == null)
        accounts = dao.getAccounts();
        System.out.println(accounts);
        return accounts;
    }


    public Account getSelectedAccount() {
        return selectedAccount;
    }

    public void setSelectedAccount(Account selectedAccount) {
        this.selectedAccount = selectedAccount;
    }

    public SourceDAO getDao() {
        return dao;
    }

    public void setDao(SourceDAO dao) {
        this.dao = dao;
    }

    public Account getNewAccount() {
        return newAccount;
    }

    public void setNewAccount(Account newAccount) {
        this.newAccount = newAccount;
    }

    public void saveAcc() {
        dao.createAccount(newAccount);
        System.out.println("we save" + newAccount);
    }
    public void delete(Account acc){
        dao.deleteAccount(acc);
        System.out.println("delete: " + acc);
    }


}
