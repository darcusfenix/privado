package com.ed.service

import com.ed.classroomcourse.Classroom
import com.ed.schoolmanagement.User

class UserClassroom implements Serializable {

    User user
    Classroom classroom
    boolean activated = false
    static constraints = {
    }

    static mapping = {
        table 't_user_classroom_tab'
        id composite: ['user', 'classroom']
        version false
    }

    def beforeUpdate(){
        if(activated){
            classroom.places --
        }
    }
}
