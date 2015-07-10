/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc:
 */

package com.ed.teststructure

import java.sql.Blob

class Question implements Serializable{

    Integer number
    String text
    Blob image
    static belongsTo = [section: Section]
    static hasMany = [answer: Answer]
    static mappedBy = [answer: 'question']

    static constraints = {
    }

    static mapping = {
        table 't_question_tab'
        id column: 'id_question', generator: 'identity'
        number column: 'nu_question'
        text column: 'tx_question'
        image column: 'bl_image'
        version false
    }
}
