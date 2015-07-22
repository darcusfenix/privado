package com.ed.schoolmanagement

import com.ed.inductionClass.InductionClass

class User {
    Integer id
    String name
    String lastName
    String phoneNumber
    String username
    String password
    boolean enabled = true
    String mobileNumber
    String email
    String socialNetworkUrl
    String comment
    boolean previousStudent
    boolean active = false
    String activationToken
    Date activationDate
    // Address
    String state
    String city
    String town
    String zipCode
    String street
    String streetNumber

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
        name nullable: false, blank: false, maxSize: 100
        lastName nullable: true, blank: true, maxSize: 100
        phoneNumber nullable: false, maxSize: 20
        mobileNumber nullable: true, maxSize: 20
        email nullable: false, blank: false, unique: true, email: true
        socialNetworkUrl nullable: true, blank: true, url: true
        // Address
        zipCode nullable: false; blank: false
        street nullable: false;
        blank: false
        streetNumber nullable: false;
        blank: false
        city nullable: false;
        blank: false
        town nullable: false;
        blank: false
        state nullable: true, blank: true
        previousStudent nullable: true, blank: true
        comment nullable:true, blank: true
        activationToken nullable:true, blank: true
        activationDate nullable: true, blank: true
    }
    static mapping = {
        version false
        table 't_user'
        email unique: true
    }

    String getFullName(){
        return this.name + " " +this.lastName
    }

    def beforeInsert(){
        this.activationToken = "${this.email}|${this.username}|${this.fullName}".encodeAsMD5().substring(0,20)
    }
}
