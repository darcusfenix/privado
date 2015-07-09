/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc:
 */

package com.ed.teststructure

import java.sql.Blob

class Answer {

    Integer answerId
    Boolean state
    String textAnswer
    Blob image
    static belongsTo = [question:Question]

    static constraints = {
    }

    static mapping = {
        table 't_answer_tab'
        id name: 'answerId', column: 'id_answer', generator: 'identity'
        state column: 'st_state'
        textAnswer column: 'tx_answer'
        image column: 'bl_image'
        version false
    }
}
