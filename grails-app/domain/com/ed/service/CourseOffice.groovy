/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc:
 */

package com.ed.service

class CourseOffice implements Serializable{

    Office office
    ClassroomCourse classroomCourse

    static constraints = {
    }

    static mapping = {
        table 't_course_office_tab'
        id composite: ['office', 'classroomCourse']
        version false
    }
}
