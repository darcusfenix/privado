/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc: Entity to abstract the logic of a class
 */

package com.ed.classroomcourse

import java.sql.Time

class Class implements Serializable{

    Date dateClass
    Date stHour
    Date endHour
    String name
    String description
    Boolean stClass
    static belongsTo = [classroom: Classroom]

    static constraints = {
        stHour nullable: true
        endHour nullable: true
        description nullable: true
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

    def getStudents(Long id){
        UserClass.findAllByClazz(Class.findById(id)).size()
    }

}
