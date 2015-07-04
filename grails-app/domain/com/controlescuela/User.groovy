package com.controlescuela

class User {
    String name
    String lastName
    String phoneNumber
    String address
    String username
    String password
    boolean enabled = true

    static constraints = {
        username nullable: true, blank: true, unique: true
        password nullable: true, blank: true
        address nullable: true
        name nullable:true, blank:true
        lastName nullable: true, blank: true
        phoneNumber nullable: false
    }

    static mapping = {
        password column: 'password'
    }
}
