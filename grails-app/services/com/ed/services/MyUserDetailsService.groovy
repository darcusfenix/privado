package com.ed.services

import com.ed.schoolmanagement.Role
import com.ed.schoolmanagement.User
import grails.transaction.Transactional

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.userdetails.GrailsUser
import grails.plugin.springsecurity.userdetails.GrailsUserDetailsService
import grails.transaction.Transactional
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UsernameNotFoundException

class MyUserDetailsService implements GrailsUserDetailsService {

    static final List NO_ROLES = [new GrantedAuthorityImpl(SpringSecurityUtils.NO_ROLE)]


    UserDetails loadUserByUsername(String username, boolean loadRoles)
            throws UsernameNotFoundException {
        return loadUserByUsername(username)
    }

    @Transactional(readOnly=true, noRollbackFor=[IllegalArgumentException, UsernameNotFoundException])
    UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User user = User.findByUsername(username)

        if (!user) throw new UsernameNotFoundException(
                'User not found', username)

        def authorities = user.authorities.collect {
            new GrantedAuthorityImpl(it.authority)
        }

        return new MyUserDetails(user.username, user.password, user.enabled,
                !user.accountExpired, !user.passwordExpired,
                !user.accountLocked, authorities ?: NO_ROLES, user.id,
                user.name + " " + user.lastName)
    }
}