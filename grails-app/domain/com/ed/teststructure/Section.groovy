/**
 * By: Tapia Mujica Fernando 7/06/15
 * Desc:
 */

package com.ed.teststructure

class Section implements Serializable{

    String name
    String description
    static hasMany = [question: Question]
    static mappedBy = [question: 'section']

    static constraints = {
    }

    static mapping = {
        table 't_section_tab'
        id column: 'id_structure', generator: 'identity'
        name column: 'nb_structure'
        description column: 'ds_structure'
        version false
    }
}
