package com.controlescuela

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder


class UserRole implements Serializable {

    User user
    Role role

    static mapping = {
        id composite: ['user', 'role']
        version false
    }
}
