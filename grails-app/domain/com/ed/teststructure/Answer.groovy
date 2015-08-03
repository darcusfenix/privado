/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc:
 */

package com.ed.teststructure

import java.sql.Blob

class Answer implements Serializable{

    Boolean state
    String textAnswer
    String image
    Integer typeAnswer
    static belongsTo = [question:Question]

    static constraints = {
        image nullable: true, blank: true
        textAnswer nullable: true, blank: true
    }

    static mapping = {
        table 't_answer_tab'
        id column: 'id_answer', generator: 'identity'
        state column: 'st_state'
        textAnswer column: 'tx_answer'
        image column: 'bl_image'
        typeAnswer column: "tp_asnwer"
        textAnswer type: 'text'
        version false
    }
}
