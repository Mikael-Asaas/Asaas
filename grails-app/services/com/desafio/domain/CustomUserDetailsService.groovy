package com.desafio.domain

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.userdetails.GrailsUserDetailsService
import grails.plugin.springsecurity.userdetails.NoStackUsernameNotFoundException
import grails.gorm.transactions.Transactional
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UsernameNotFoundException
import com.desafio.domain.User
import com.desafio.domain.Role
import com.desafio.domain.UserRole
import com.desafio.domain.customer.Customer
import com.desafio.domain.CustomUserDetails

class CustomUserDetailsService implements GrailsUserDetailsService {

   static final List NO_ROLES = [new SimpleGrantedAuthority(SpringSecurityUtils.NO_ROLE)]

   UserDetails loadUserByUsername(String username, boolean loadRoles)
         throws UsernameNotFoundException {
      return loadUserByUsername(username)
   }

   @Transactional(readOnly=true, noRollbackFor=[IllegalArgumentException, UsernameNotFoundException])
   UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

      User user = User.findByUsername(username)
      if (!user) throw new NoStackUsernameNotFoundException()

      def roles = user.authorities

      def authorities = roles.collect {
         new SimpleGrantedAuthority(it.authority)
      }

      return new CustomUserDetails(user.username, user.password, user.enabled,
            !user.accountExpired, !user.passwordExpired,
            !user.accountLocked, authorities ?: NO_ROLES, user.id)
   }
}