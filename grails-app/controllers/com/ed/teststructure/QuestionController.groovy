package com.ed.teststructure

import grails.converters.JSON

class QuestionController {

    def index() {}

    def getBySection(Integer id){
        render( Question.findAllBySection(Section.findById(id ?: params.int("id"))) as JSON)
    }
}
