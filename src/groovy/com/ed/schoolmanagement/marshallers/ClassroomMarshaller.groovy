package com.ed.schoolmanagement.marshallers

import com.ed.classroomcourse.Classroom
import grails.converters.JSON


class ClassroomMarshaller {
    void register() {
        JSON.registerObjectMarshaller(Classroom) { Classroom classroom ->
            return [
                    id                : classroom.id,
                    nameClassroom     : classroom.nameClassroom,
                    places            : classroom.places,
                    idStateClassroom  : classroom.stateClassroom.id,
                    typeClassroom     : classroom.typeClassroom,
                    nameStateClassroom: classroom.getStateClassroomName(classroom.stateClassroomId),
                    nameOffice        : classroom.getNameOffice(classroom.office.id),
                    officeId          : classroom.office.id,
                    placesOccupied    : classroom.getFreePlaces(classroom.id),
                    period            : classroom.period,
            ]
        }
    }
}
