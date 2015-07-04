package com.controlescuela

class Role implements Serializable {

    String authority
    static constraints = {
        authority blank: false, unique: true
    }

    static mapping = {
        cache true
    }
}
