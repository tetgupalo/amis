package com.mikolenko.oksana.database.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    USER,
    ADMIN,
    HOST;


    @Override
    public String getAuthority() {
        return name();
    }


}
