/**
 * By: Tapia Mujica Fernando on 6/07/15
 * Desc: Entity to abstract the logic of classroom course service
 */

package com.ed.service

class ClassroomCourse extends Service {

    Integer numberClasses
    TypeCourse typeCourse

    static constraints = {
        numberClasses nullable: true, blank: true
    }

    static mapping = {
        table 't_classroom_course_tab'
        numberClasses column: 'nu_classes'
        version false
    }
}
