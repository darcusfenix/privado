/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc:
 */

package com.ed.classroomcourse

class Class implements Serializable{

    Integer classId
    String name
    String description
    static belongsTo = [classroom: Classroom]

    static constraints = {
    }

    static mapping = {
        table 't_class_tab'
        id name: 'classId', column: 'id_class', generator: 'identity'
        name column: 'nb_class'
        description column: 'ds_class'
        version false
    }
}
