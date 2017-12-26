package com.koby.model;

public class Account {

    String login;
    String description;

    public Account() {
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    @Override
    public String toString() {
        return "Account{" +
                "name='" + login + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
