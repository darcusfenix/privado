package com.ed.schoolmanagement

import com.ed.accesscontrol.StudentService
import com.ed.classroomcourse.Class
import com.ed.classroomcourse.Classroom
import com.ed.inductionClass.InductionClass
import com.ed.paycontrol.VoucherPayment
import com.ed.service.Service
import com.ed.service.UserClassroom
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class User implements Serializable {

    def springSecurityService

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

    // se agregan para el plugin de spring security
    boolean passwordExpired
    boolean accountExpired
    boolean accountLocked

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
        surName nullable: true;
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
        accountLocked nullable: true
        passwordExpired nullable: true
        accountExpired nullable: true
    }
    static mapping = {
        version false
        table 't_user'
        accountExpired column: 'account_expired'
        accountLocked column: 'account_locked'
        passwordExpired column: 'password_expired'
        email unique: true
    }

    String getFullName() {
        return this.name + " " + this.lastName
    }

    def beforeInsert() {
        this.activationToken = "${this.email}|${this.username}|${this.fullName}".encodeAsMD5().substring(0, 20)
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        this.password = springSecurityService.encodePassword(this.password)
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

    def getTotalRequiredByUser() {
        Float totalRequired = 0.0

        StudentService.findAllByUser(this).each { StudentService ->
            Service.findAllById(StudentService.service.id).each { service ->
                totalRequired += service.cost
            }
        }

        return totalRequired
    }

    def getTotalPaid() {
        Float totalPaidServicio = 0.0

        StudentService.findAllByUser(this).each { studentService ->
            VoucherPayment.findAllByStudentService(studentService).each { voucherPaymentIndividual ->
                totalPaidServicio += voucherPaymentIndividual.pay
            }
        }
        return totalPaidServicio
    }

    /*def getIC(){
        return Class.findByClassroom(UserClassroom.findBy)
    }*/
}
