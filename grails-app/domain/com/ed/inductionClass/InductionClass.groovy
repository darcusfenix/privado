package com.ed.inductionClass

import com.ed.classroomcourse.StateClassroom
import com.ed.schoolmanagement.User
import com.ed.service.Office

import java.time.LocalDateTime

class InductionClass implements Serializable {

    String name
    Integer places
    LocalDateTime date

    StateClassroom stateClassroom
    static hasMany = [user: User]
    static belongsTo = [office: Office]

    static constraints = {
        places nullable: true
        date nullable: true, blank: true
        user nullable: true
    }

    static mapping = {
        table 't_induction_class_tab'
        id column: 'id_induction_class', generator: 'identity'
        name column: 'nb_name'
        date column: 'fh_time'
        places column: 'nu_places'
        version false
    }

    def getPlaces(Long id){
        User.findAllByInductionClass(InductionClass.findById(id)).size()
    }

    def getStudents(Long id){
        User.findAllByInductionClass(InductionClass.findById(id))
    }
}
