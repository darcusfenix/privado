/**
 * By: Tapia Mujica Fernando 6/07/14
 * Desc: Relationship between office with classroom
 */

package com.ed.service

import com.ed.schoolmanagement.User
import com.ed.classroomcourse.Classroom

class OfficeClassroom implements Serializable{

    Office office
    Classroom classroom
    User user
    String period

    static constraints = {
    }

    static mapping = {
        table 't_office_classroom_tab'
        id composite: ['office', 'classroom', 'user']
        period column: 'tx_period'
        version false
    }
}
