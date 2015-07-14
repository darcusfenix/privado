package com.ed.schoolmanagement

import com.ed.inductionClass.InductionClass

class User {
    Integer id
    String name
    String lastName
    String phoneNumber
    String address
    String username
    String password
    boolean enabled = true
    String mobileNumber
    String email
    String socialNetworkUrl

    static hasMany = [inductionClass: InductionClass]

    // Spring security methods

    @Override
    int hashCode() {
        username?.hashCode() ?: 0
    }

    @Override
    boolean equals(other) {
        is(other) || (other instanceof User && other.username == username)
    }

    @Override
    String toString() {
        username
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this)*.role
    }

    static constraints = {
        username nullable: false, blank: false, unique: true
        password nullable: false, blank: false
        address nullable: false, blank: false
        name nullable: false, blank: false, maxSize: 100
        lastName nullable: true, blank: true, maxSize: 100
        phoneNumber nullable: false, maxSize: 20
        mobileNumber nullable: true, maxSize: 20
        email nullable: false, blank: false, unique:true, email: true
        socialNetworkUrl nullable: true, blank: true, url: true
    }
    static mapping = {
        version false
        table 't_user'
        email unique: true
    }
}
