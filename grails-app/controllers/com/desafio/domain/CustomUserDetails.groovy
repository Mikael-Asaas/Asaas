package com.desafio.domain

import grails.plugin.springsecurity.userdetails.GrailsUser
import org.springframework.security.core.GrantedAuthority
import com.desafio.domain.User
import com.desafio.domain.Role
import com.desafio.domain.UserRole
import com.desafio.domain.customer.Customer
import com.desafio.domain.CustomUserDetails

class CustomUserDetails extends GrailsUser {

   CustomUserDetails(String username, String password, boolean enabled,
                 boolean accountNonExpired, boolean credentialsNonExpired,
                 boolean accountNonLocked,
                 Collection<GrantedAuthority> authorities,
                 long id) {
      super(username, password, enabled, accountNonExpired,
            credentialsNonExpired, accountNonLocked, authorities, id)
   }
}