package com.koby.bean;

import com.koby.SourceDAO;
import com.koby.model.Account;
import com.koby.model.Source;
import com.koby.model.Technology;
import org.primefaces.component.collector.Collector;
import org.primefaces.event.SelectEvent;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

@ManagedBean(name = "dtSource")
@ViewScoped
public class SourceBean
        implements Serializable {
    private List<Source> sources;
    private Source selectedSource;
    private Source newSource;
    private List<Technology> technologies;
    private List<Account> accounts;
    private String tempLogin;
    private String tempTechnology;
    private List<String> availableLogins;
    private List<String> availableTechnology;


    @ManagedProperty("#{sourceDao}")
    SourceDAO dao;

    @PostConstruct
    public void init() {
        newSource = new Source();
    }

    public List<Source> getSources() {
        sources = dao.getSources();
        return sources;
    }

    public void onRowSelect(SelectEvent event) {
        selectedSource = (Source) event.getObject();

    }

    public void setSources(List<Source> sources) {
        this.sources = sources;
    }

    public Source getSelectedSource() {
        return selectedSource;
    }

    public void setSelectedSource(Source selectedSource) {
        this.selectedSource = selectedSource;
    }

    public Source getNewSource() {
        return newSource;
    }

    public void setNewSource(Source newSource) {
        this.newSource = newSource;
    }

    public List<Technology> getTechnologies() {
        if (selectedSource == null)
            return null;
        technologies = dao.getTechnologiesOfSource(selectedSource);
        System.out.println("source tech " + technologies);
        return technologies;
    }

    public void setTechnologies(List<Technology> technologies) {
        this.technologies = technologies;
    }

    public List<Account> getAccounts() {
        if (selectedSource == null)
            return null;
        accounts = dao.getAccountsOfSource(selectedSource);
        return accounts;
    }

    public void setAccounts(List<Account> accounts) {
        this.accounts = accounts;
    }

    public SourceDAO getDao() {
        return dao;
    }

    public void setDao(SourceDAO dao) {
        this.dao = dao;
    }

    public void saveSrc() {
        dao.createSource(newSource);
        System.out.println("we save" + newSource);
    }

    public void addAcc() {
        if(selectedSource == null)
            return;
        dao.addAccountToSource(selectedSource, tempLogin);
        System.out.println("add" + tempLogin);
    }
    public void addTech() {
        if(selectedSource == null)
            return;
        dao.addTechnologyToSource(selectedSource, tempTechnology);
    }

    public String getTempLogin() {
        return tempLogin;
    }

    public void setTempLogin(String tempLogin) {
        System.out.println(tempLogin);
        this.tempLogin = tempLogin;
    }

    public List<String> getAvailableLogins() {
        availableLogins = dao.getAccounts().stream().map(a -> a.getLogin()).collect(Collectors.toList());
        System.out.println( "logins "+ availableLogins);
        return availableLogins;
    }

    public void setAvailableLogins(List<String> availableLogins) {
        this.availableLogins = availableLogins;
    }

    public String getTempTechnology() {
        return tempTechnology;
    }

    public void setTempTechnology(String tempTechnology) {
        this.tempTechnology = tempTechnology;
    }

    public List<String> getAvailableTechnology() {
        availableTechnology = dao.getTechnologies().stream().map(a -> a.getName()).collect(Collectors.toList());
        System.out.println( "logins "+ availableTechnology);
        return availableTechnology;
    }

    public void setAvailableTechnology(List<String> availableTechnology) {

        this.availableTechnology = availableTechnology;
    }

}
