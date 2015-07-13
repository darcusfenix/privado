/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc: Entity to abstract the logic of a group or classroom
 */

package com.ed.classroomcourse

class Classroom implements Serializable{

    String nameClassroom
    Integer places
    StateClassroom stateClassroom
    static hasMany = [clazz: Class]
    static mappedBy = [clazz: 'classroom']

    static constraints = {
        clazz nullable: true
        stateClassroom nullable: true
    }

    static mapping = {
        table 't_classroom_tab'
        id column: 'id_classroom', generator: 'identity'
        nameClassroom column: 'nb_classroom'
        places column: 'nu_places'
        version false
    }
}
