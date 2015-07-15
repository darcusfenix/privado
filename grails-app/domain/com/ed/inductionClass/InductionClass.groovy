package com.ed.inductionClass

import com.ed.schoolmanagement.User

class InductionClass implements Serializable{

    String nombre
    Integer cupo
    Date Hora

    static hasMany = [user: User]

    static constraints = {
        cupo nullable: true
    }

    static mapping = {
        table 't_induction_class_tab'
        id column: 'id_induction_class', generator: 'identity'
        nombre column: 'nb_name'
        hora column: 'fh_time'
        cupo column: 'nu_cupo'
        version false
    }
}
