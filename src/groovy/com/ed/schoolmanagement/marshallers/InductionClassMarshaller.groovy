package com.ed.schoolmanagement.marshallers

import com.ed.inductionClass.InductionClass
import grails.converters.JSON


class InductionClassMarshaller {
    void register() {
        JSON.registerObjectMarshaller(InductionClass) { InductionClass ic ->
            return [
                    id                : ic.id,
                    name              : ic.name,
                    places            : ic.places,
                    date              : ic.date.toString(),
                    idStateClassroom  : ic.stateClassroom.id,
                    nameStateClassroom: ic.stateClassroom.name,
                    placesOccupied    : ic.getPlaces(),
                    students          : ic.getStudents(),
                    office            : ic.office,
            ]
        }
    }
}
