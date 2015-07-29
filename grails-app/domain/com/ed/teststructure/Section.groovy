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
        id column: 'id_section', generator: 'identity'
        name column: 'nb_section'
        description column: 'ds_section'
        version false
    }
}
