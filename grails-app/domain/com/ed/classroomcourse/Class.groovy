/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc: Entity to abstract the logic of a class
 */

package com.ed.classroomcourse

class Class implements Serializable{

    Date dateClass
    String stHour
    String endHour
    String name
    String description
    static belongsTo = [classroom: Classroom]

    static constraints = {
    }

    static mapping = {
        table 't_class_tab'
        id column: 'id_class', generator: 'identity'
        name column: 'nb_class'
        dateClass column: 'fh_date_class'
        stHour column: 'fh_st_hour'
        endHour column: 'fh_end_hour'
        description column: 'ds_class'
        version false
    }
}
