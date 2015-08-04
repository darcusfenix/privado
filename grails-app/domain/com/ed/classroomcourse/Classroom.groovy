/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc: Entity to abstract the logic of a group or classroom
 */

package com.ed.classroomcourse

import com.ed.service.Office
import com.ed.service.UserClassroom

import javax.swing.plaf.nimbus.State

class Classroom implements Serializable{

    String nameClassroom
    Integer places
    String period
    // 0 is New Student 1 old Student
    Integer typeClassroom
    // 0 is Class 1 MockExam
    Integer typeClassroomP
    Integer priority
    StateClassroom stateClassroom
    static hasMany = [clazz: Class]
    static mappedBy = [clazz: 'classroom']
    static belongsTo = [office: Office]

    static constraints = {
        clazz nullable: true
        stateClassroom nullable: true
        typeClassroom nullable: false
        places nullable: false, min:0
        nameClassroom nullable: false, matches: "Grupo\\s[\\d{1}||[A-Z]]"
        period nullable: true, matches: "\\d{4}-\\d{2}"
    }

    static mapping = {
        table 't_classroom_tab'
        id column: 'id_classroom', generator: 'identity'
        nameClassroom column: 'nb_classroom'
        places column: 'nu_places'
        typeClassroom column: 'st_typeClassroom'
        typeClassroomP column: 'st_typeClassroomP'
        period column: 'tx_period'
        priority column: 'nu_priority'
        version false
    }

    def beforeUpdate(){
        if(this.places==0){
            stateClassroom = StateClassroom.findByName("Cerrado");
        }
    }

    String getNameOffice(Long id){
        Office.findById(id).name
    }

    String getStateClassroomName(Long id){
        StateClassroom.findById(id).getName()
    }

    Integer getFreePlaces(){
        UserClassroom.findAllByClassroom(this).size()
    }
}
