package com.ed.teststructure

import grails.converters.JSON
import org.apache.jasper.tagplugins.jstl.core.Url
import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.http.HttpRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

//@Transactional(readOnly = true)
class QuestionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index() {
        render Question.list() as JSON
    }

    def show(Integer id) {
        render(Question.findById(id ?: params.int("id")) as JSON)
    }

    def create() {
        render new Question() as JSON
    }

    //@Transactional
    def save() {
        def webRootDir = servletContext.getRealPath("/")
        System.out.println(webRootDir.toString());
        def questionInstance = new Question()
        JSONObject jQuestion = new JSONObject(request.getParameter('data'))
        CommonsMultipartFile f = request.getFile('file')
        questionInstance.properties = jQuestion
        if (questionInstance.validate()) {
            if (f != null) {
                if (f.empty) {
                    response.status = 500
                    render([message: "Error al cargar la imagen"] as JSON)
                }

                //def dir = System.getenv("HOME") + "/Desktop/" + questionInstance.section.id + "/"
                def dir = webRootDir + "imgFiles/question-" + questionInstance.section.id + "/"
                File folder = new File(dir)
                folder.mkdirs()
                dir = dir + f.getOriginalFilename()
                f.transferTo(new File(dir))
                dir = "imgFiles/question-" + questionInstance.section.id + "/" + f.getOriginalFilename()
                questionInstance.urlImage = dir
            }
            questionInstance.save(flush: true)
            response.status = 200
            render([questionInstance: questionInstance, message: message(code: "de.question.created")] as JSON)

        } else {
            response.status = 500
            render(questionInstance.errors as JSON)
        }
    }

    def edit() {

    }

    //@Transactional
    def update() {
        def webRootDir = servletContext.getRealPath("/")
        JSONObject jQuestion = new JSONObject(request.getParameter('data'))
        Question questionInstance = Question.findById(jQuestion.id)
        String tempQI = questionInstance.urlImage
        CommonsMultipartFile f = request.getFile('file')
        questionInstance.properties = jQuestion
        if (questionInstance.validate()) {
            if (f != null) {
                if (f.empty) {
                    response.status = 500
                    render([message: "Error al cargar la imagen"] as JSON)
                }

                File folder = new File(webRootDir + tempQI)
                print(folder)
                folder.delete()
                def dir = webRootDir + "imgFiles/" + questionInstance.section.id + "/"
                folder = new File(dir)
                folder.mkdirs()
                dir = dir + f.getOriginalFilename()
                f.transferTo(new File(dir))
                dir = "imgFiles/" + questionInstance.section.id + "/" + f.getOriginalFilename()
                questionInstance.urlImage = dir
            } else {
                questionInstance.urlImage = tempQI
            }
            questionInstance.save(flush: true)
            response.status = 200
            render([questionInstance: questionInstance, message: message(code: "de.question.created")] as JSON)

        } else {
            response.status = 500
            render(questionInstance.errors as JSON)
        }

    }

    //@Transactional
    def delete(Integer id) {
        def questionInstance = Question.findById(id ?: params.int("id"))
        if (questionInstance.answer.isEmpty()) {
            questionInstance.delete(flush: true)
            response.status = 200
            render([message: message(code: 'de.question.deleted.message')] as JSON)
        } else {
            response.status = 500
            render([message: message(code: 'de.questionAnswer', args: [questionInstance.number])] as JSON)
        }
    }

    def getAllBySection(Integer id) {
        render Question.findAllBySection(Section.findById(id)) as JSON;
    }

    def getBySection(Integer id) {
        render(Question.findAllBySection(Section.findById(id ?: params.int("id"))) as JSON)
    }
}
