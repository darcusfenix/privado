package com.ed.schoolmanagement

import com.ed.classroomcourse.Class
import com.ed.classroomcourse.Classroom
import com.ed.inductionClass.InductionClass
import com.ed.service.UserClassroom
import groovy.time.TimeCategory

class User {
    Integer id
    String name
    String lastName
    String surName
    String phoneNumber
    String username
    String password
    String gender
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
    String internalNumber

    InductionClass inductionClass

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
        socialNetworkUrl nullable: true, blank: true
        // Address
        zipCode nullable: false; blank: false
        street nullable: false;
        gender nullable: true;
        blank: false
        streetNumber nullable: false;
        internalNumber nullable: true, blank: true
        blank: false
        city nullable: false;
        blank: false
        town nullable: false;
        blank: false
        state nullable: true, blank: true
        previousStudent nullable: true, blank: true
        comment nullable: true, blank: true
        activationToken nullable: true, blank: true
        activationDate nullable: true, blank: true
        inductionClass nullable: true, blank: true
    }
    static mapping = {
        version false
        table 't_user'
        email unique: true
    }

    String getFullName() {
        return this.name + " " + this.lastName
    }

    def beforeInsert() {
        this.activationToken = "${this.email}|${this.username}|${this.fullName}".encodeAsMD5().substring(0, 20)
    }

    def getGroup() {
        UserClassroom uc = UserClassroom.findByUser(this)
        if (uc != null) {
            uc.getClassroom()
        } else {
            null
        }
    }

    def getInductionC() {
        InductionClass ic = this.inductionClass
        if (ic != null) {
            return ic.name
        } else {
            return null
        }
    }

    def getApp() {
        Appointment a = Appointment.findByUser(this)
        if (a) {
            return a.appointmentDate
        } else {
            return false
        }
    }

    /*def getIC() {
        if (Class.findByClassroom(UserClassroom.findByUser(this))) {
            use(TimeCategory) {
                return Class.findByClassroom(UserClassroom.findByUser(this)).dateClass - 30.minutes
            }
        } else {
            return null
        }
    }*/
}
