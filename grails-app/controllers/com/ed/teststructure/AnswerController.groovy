package com.ed.teststructure

import grails.converters.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.web.multipart.commons.CommonsMultipartFile


class AnswerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index() {
        render(Answer.list() as JSON)
    }

    def create(){
        render( new Answer() as JSON)
    }

    def update() {

        def webRootDir = servletContext.getRealPath("/")

        JSONObject jQuestion = new JSONObject(request.getParameter('data'))
        CommonsMultipartFile f = request.getFile('file')
        def answerInstance = Answer.findById(jQuestion.id)

        answerInstance.properties = jQuestion

        if (answerInstance.validate()) {
            if (f != null) {
                def dir = webRootDir + "imgFiles/answers/question-" + answerInstance.question.id + "/"
                File folder = new File(dir)
                folder.mkdirs()
                dir = dir + f.getOriginalFilename()
                f.transferTo(new File(dir))
                dir = "imgFiles/answers/question-" + answerInstance.question.id + "/" + f.getOriginalFilename()
                answerInstance.image = dir

            }
            answerInstance.save(flush: true)
            response.status = 200
            render([answerInstance: answerInstance, message: message(code: "answer.updated")] as JSON)

        } else {
            response.status = 500
            render(answerInstance.errors as JSON)
        }

    }

    def show(Integer id) {
        render(Answer.findById(id ?: params.int("id") ) as JSON)
    }

    def save() {
        def webRootDir = servletContext.getRealPath("/")
        def answerInstance = new Answer()
        
        JSONObject jQuestion = new JSONObject(request.getParameter('data'))
        CommonsMultipartFile f = request.getFile('file')
        answerInstance.properties = jQuestion
        
        if (answerInstance.validate()) {
            if (f != null) {
                def dir = webRootDir + "imgFiles/answers/question-" + answerInstance.question.id + "/"
                File folder = new File(dir)
                folder.mkdirs()
                dir = dir + f.getOriginalFilename()
                f.transferTo(new File(dir))
                dir = "imgFiles/answers/question-" + answerInstance.question.id + "/" + f.getOriginalFilename()
                answerInstance.image = dir

            }
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
        answer.delete(flush: true)
        response.status = 200
        render([success: message(code: 'answer.deleted')] as JSON)
    }

}
