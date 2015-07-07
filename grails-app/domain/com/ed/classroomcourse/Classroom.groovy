/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc: Entity to abstract the logic of a group or classroom
 */

package com.ed.classroomcourse

class Classroom implements Serializable{

    Integer id
    String hour
    String nameClassroom
    Integer places
    static belongsTo = [stateClassroom:StateClassroom]
    static hasMany = [clazz: Class]
    static mappedBy = [clazz: 'classroom']

    static constraints = {
    }

    static mapping = {
        table 't_classroom_tab'
        id name: 'id', column: 'id_classroom', generator: 'identity'
        hour column: 'hour'
        nameClassroom column: 'nb_classroom'
        places column: 'nu_places'
        version false
    }
}
