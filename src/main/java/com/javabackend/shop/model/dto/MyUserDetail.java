package com.javabackend.shop.model.dto;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;

public class MyUserDetail extends User implements OAuth2User {

    public MyUserDetail(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
    }
    // Constructor cho OAuth2
    public MyUserDetail(String username,
                        Collection<? extends GrantedAuthority> authorities,
                        Map<String, Object> attributes) {
        super(username, "", authorities);
        this.attributes = attributes;
    }

    private Long id;
    private String fullName;
    private Map<String, Object> attributes;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, Object> attributes) {
        this.attributes = attributes;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Override
    public String getName() {
        return this.getUsername();
    }
}