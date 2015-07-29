package com.ed.schoolmanagement.marshallers

import com.ed.classroomcourse.Class
import com.ed.teststructure.Structure
import grails.converters.JSON


class StructureMarshaller {
    void register() {
        JSON.registerObjectMarshaller(Structure) { Structure structure ->
            return [
                    id          : structure.id,
                    name        : structure.name,
                    mockExam    : structure.mockExam,
                    mockExamName: structure.mockExam.getName(),
                    description : structure.description,
            ]
        }
    }
}
