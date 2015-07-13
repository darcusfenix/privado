/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc: Entity to abstract the logic of a group or classroom
 */

package com.ed.classroomcourse

class Classroom implements Serializable{

    String nameClassroom
    Integer places
    // 0 is New Student 1 old Student
    Integer typeClassroom
    StateClassroom stateClassroom
    static hasMany = [clazz: Class]
    static mappedBy = [clazz: 'classroom']

    static constraints = {
        typeClassroom nullable: false
        places nullable: false
        nameClassroom nullable: false, unique: true
    }

    static mapping = {
        table 't_classroom_tab'
        id column: 'id_classroom', generator: 'identity'
        nameClassroom column: 'nb_classroom'
        places column: 'nu_places'
        typeClassroom column: 'st_typeClassroom'
        version false
        stateClassroom lazy: false
    }
}
