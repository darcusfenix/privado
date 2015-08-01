package com.ed.teststructure

import grails.converters.JSON



class AnswerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render(Answer.list() as JSON)
    }

    def create(){
        render( new Answer() as JSON)
    }

    def update() {
        def answerInstance = Answer.findById(request.JSON.id)

        answerInstance.properties = request.JSON

        if (answerInstance.validate()) {
            answerInstance.save(flush: true)
            response.status = 200
            render([answerInstance: answerInstance, message: message(code: "answer.updated")] as JSON)
        }else{
            response.status = 500
            render(answerInstance.errors as JSON)
        }
    }

    def show(Integer id) {
        render(Answer.findById(id ?: params.int("id") ) as JSON)
    }

    def save() {

        def answerInstance = new Answer()
        answerInstance.properties = request.JSON
        
        if (answerInstance.validate()) {
            answerInstance.save(flush: true)

            response.status = 200
            render([answerInstance: answerInstance, message: message(code: "answer.created")] as JSON)

        } else {
            response.status = 500
            render(answerInstance.errors as JSON)
        }


    }

    def delete() {
        Answer answer = Answer.findById(params.int("id"))
        //StructureSection.executeUpdate("delete StructureSection ss where ss.section = :section", [section: section])
        answer.delete(flush: true)
        response.status = 200
        render([success: message(code: 'answer.deleted')] as JSON)
    }

}
