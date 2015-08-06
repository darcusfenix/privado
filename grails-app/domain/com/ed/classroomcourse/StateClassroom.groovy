/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc: Relationship between state machine classroom with classroom
 */

package com.ed.classroomcourse

class StateClassroom implements Serializable {

    String name
    String description

    static constraints = {
    }

    static mapping = {
        table 't_state_classroom_cat'
        id column: 'id_state', generator: 'identity'
        name column: 'nb_state'
        description column: 'ds_state'
        version false
    }
}
