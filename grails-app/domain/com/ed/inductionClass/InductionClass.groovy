package com.ed.inductionClass

import com.ed.schoolmanagement.User

class InductionClass implements Serializable{

    String nombre
    Integer cupo
    Date Hora


    static constraints = {
    }

    static mapping = {
        table 't_induction_class_tab'
        id column: 'id_induction_class', generator: 'identity'
        nombre column: 'nb_name'
        hora column: 'fh_time'
    }
}
