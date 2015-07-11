/**
 * By: Tapia Mujica Fernando on 6/07/15
 * Desc: Relationship between services with students
 */

package com.ed.accesscontrol

import com.ed.schoolmanagement.User
import com.ed.service.Service

class StudentService implements Serializable {

    User user
    Service service
    Boolean active
    Float fullPayment

    static constraints = {

    }

    static mapping = {
        table 't_student_service_tab'
        id composite: ['user', 'service']
        version false
        active column: 'st_active'
        fullPayment column: 'nu_full_payment'
    }

}
