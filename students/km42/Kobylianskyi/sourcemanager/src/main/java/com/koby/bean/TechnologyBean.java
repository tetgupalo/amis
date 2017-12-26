package com.koby.bean;

import com.koby.SourceDAO;
import com.koby.model.Technology;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import java.io.Serializable;
import java.util.List;

@ManagedBean(name = "dtTechnology")
@ViewScoped
public class TechnologyBean implements Serializable {

    private static final long serialVersionUID = 1L;
    private List<Technology> technologies;
    private Technology selectedTechnology;
    private Technology newTechnology;

    @ManagedProperty("#{sourceDao}")
    SourceDAO dao;

    @PostConstruct
    public void init() {
        newTechnology = new Technology();
    }

    public List<Technology> getTechnologies() {
        technologies = dao.getTechnologies();
        return technologies;
    }

    public void setTechnologies(List<Technology> technologies) {
        this.technologies = technologies;
    }

    public Technology getSelectedTechnology() {
        return selectedTechnology;
    }

    public void setSelectedTechnology(Technology selectedTechnology) {
        this.selectedTechnology = selectedTechnology;
    }

    public Technology getNewTechnology() {
        return newTechnology;
    }

    public void setNewTechnology(Technology newTechnology) {
        this.newTechnology = newTechnology;
    }

    public SourceDAO getDao() {
        return dao;
    }

    public void setDao(SourceDAO dao) {
        this.dao = dao;
    }

    public void saveTech() {
        dao.createTechnology(newTechnology);
        System.out.println("we save" + newTechnology);
        newTechnology = new Technology();
    }
}
