/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc:
 */

package com.ed.teststructure

class StructureSection implements Serializable{

    Structure structure
    Section section

    static constraints = {
    }

    static mapping = {
        table 't_structure_section_tab'
        id composite: ['structure', 'section']
        version false
    }
}
