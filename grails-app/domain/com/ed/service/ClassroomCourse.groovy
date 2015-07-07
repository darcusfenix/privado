/**
 * By: Tapia Mujica Fernando on 6/07/15
 * Desc:
 */

package com.ed.service

class ClassroomCourse extends Service {

    Integer numberClasses
    static belongsTo = [typeCourse: TypeCourse]

    static constraints = {
        numberClasses nullable: true, blank: true
    }

    static mapping = {
        table 't_classroom_course_tab'
        numberClasses column: 'nu_classes'
        version false
    }
}
