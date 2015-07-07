/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc:
 */

package com.ed.service

import com.ed.teststructure.Structure

class MockExam extends Service {

    Float term
    String name
    Boolean active
    static hasMany = [structure: Structure]
    static mappedBy = [structure: 'mockExam']

    static constraints = {
    }

    static mapping = {
        table 't_mock_exam_tab'
        term column: 'nu_term'
        name column: 'nb_exam'
        active column: 'st_exame'
        version false
    }
}
