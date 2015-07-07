/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc:
 */

package com.ed.teststructure

import com.ed.service.MockExam

class Structure implements Serializable{

    Integer structureId
    String name
    String description
    static belongsTo = [mockExam: MockExam]

    static constraints = {
    }

    static mapping = {
        table 't_structure_tab'
        id name: 'structureId', column: 'id_structure', generator: 'identity'
        name column: 'nb_structure'
        description column: 'ds_structure'
        version false
    }
}
