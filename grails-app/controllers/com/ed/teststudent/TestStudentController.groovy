package com.ed.teststudent

import com.ed.teststructure.Question
import com.ed.teststructure.Structure
import com.ed.teststructure.StructureSection
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class TestStudentController {

    def index() {}

    def menu(Integer id) {

        def colors = ["Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde", "Bnaranja", "Bazul", "Bverde"]

        def questions = [:]

        def map = StructureSection.findAllByStructure(Structure.findById(1)).each { structureSection ->
            questions.put(structureSection.section.id,Question.findAllBySection(structureSection.section))
        }

        [relations:map, colors : colors, questions: questions]

    }
}
