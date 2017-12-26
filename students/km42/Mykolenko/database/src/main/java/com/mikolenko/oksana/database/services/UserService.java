package com.mikolenko.oksana.database.services;

import com.mikolenko.oksana.database.domain.Role;
import com.mikolenko.oksana.database.persistense.dao.UserDao;
import com.mikolenko.oksana.database.persistense.entry.UserEntry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;

@Service
public class UserService implements UserDetailsService {
    private final UserDao userDao;

    @Autowired
    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public UserDetails loadUserByUsername(@NotNull String email) throws UsernameNotFoundException {

        UserEntry userEntry = userDao.findByEmail(email);
        if (userEntry == null)
            return null;
        return new org.springframework.security.core.userdetails.User(userEntry.getEmail(), userEntry.getPassword(), getAuthorities(userEntry));
    }

    private Set<GrantedAuthority> getAuthorities(UserEntry user) {

        Set<GrantedAuthority> authorities = new HashSet<>();
        if (user == null) return authorities;
        if (user.getType() == 0) {
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority("ROLE_USER");
            authorities.add(grantedAuthority);
        } else if (user.getType() == 2) {
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority("ROLE_ADMIN");
            authorities.add(grantedAuthority);
        } else if (user.getType() == 1) {
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority("ROLE_HOST");
            authorities.add(grantedAuthority);
        }

        return authorities;
    }
}
