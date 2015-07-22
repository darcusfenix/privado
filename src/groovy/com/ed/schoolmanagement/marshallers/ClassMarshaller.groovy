package com.ed.schoolmanagement.marshallers

import com.ed.classroomcourse.Class
import grails.converters.JSON


class ClassMarshaller {
    void register() {
        JSON.registerObjectMarshaller(Class) { Class clazz ->
            return [
                    id       : clazz.id,
                    name     : clazz.name,
                    dateClass: clazz.dateClass,
                    stHour   : clazz.stHour,
                    endHour  : clazz.endHour,
                    nofS     : clazz.getStudents(clazz.id),
            ]
        }
    }
}
