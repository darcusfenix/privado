package com.ed.schoolmanagement

import com.ed.classroomcourse.Classroom
import com.ed.inductionClass.InductionClass
import com.ed.service.UserClassroom
import grails.converters.JSON
import grails.transaction.Transactional
import groovy.json.JsonOutput

import javax.servlet.ServletContext

class UserController {

    def notificationService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", enroll: "POST"]

    def index() {
        render User.listOrderById([max: params.int('max')]) as JSON
    }

    def create() {
        render(new User() as JSON)
    }

    def save() {
        def userInstance = new User(request.JSON)
        if (userInstance.validate()) {
            userInstance.save()
            UserRole.create(userInstance, Role.findById(request.JSON.authority.id), true)
            response.status = 200
            render([user: userInstance, message: message(code: "de.user.created.message")] as JSON)
        } else {
            response.status = 500
            render(userInstance.errors as JSON)
        }
    }

    def edit(Integer id) {
        render(User.findById(id ?: params.int("id")) as JSON)
    }

    def show(Integer id) {
        render(User.findById(id ?: params.int("id")) as JSON)
    }

    def update() {
        User userInstance = User.findById(request.JSON.id)
        userInstance.properties = request.JSON
        if (userInstance.validate()) {
            userInstance.save()
            UserRole.removeAll(userInstance)
            UserRole.create(userInstance, Role.findById(request.JSON.authority.id), true)
            //TODO: Remove all the services and groups related to the user
            //TODO: Create again all the relationships between classroom and users
            response.status = 200
            render([user: userInstance, message: message(code: "de.user.updated.message")] as JSON)
        } else {
            response.status = 500
            render(userInstance.errors as JSON)
        }
    }

    def delete(Integer id) {
        def user = User.findById(id ?: params.int("id"))
        UserRole.removeAll(user, false)
        //TODO: Remove all the services and groups related to the user
        user.delete(flush: true)
        response.status = 200
        render([message: message(code: 'de.user.deleted.message')] as JSON)
    }

    def activate() {
        def status = notificationService.validateAccount(params.token)
        if (status) {
            render([message: 'Usuario verificado'] as JSON)
            return
        } else {
            response.status = 500
            render([message: 'No se pudo verificar el usuario'] as JSON)
            return
        }
    }

    @Transactional
    def enroll() {
        ServletContext servletContext = getServletContext();
        String contextPath = servletContext.getRealPath(File.separator);

        User userInstance = new User()
        userInstance.properties = request.JSON
        userInstance.password = "test"
        userInstance.username = userInstance.email
        //TODO Change according to the hour
        //TODO Generate the four induction classes on bootstrap file!
        userInstance.inductionClass = InductionClass.first();
        userInstance.save(flush: true, insert: true, failOnError: true)

        Classroom classroomInstance = Classroom.findByNameClassroom(request.JSON.group)
        UserClassroom uc = new UserClassroom()
        uc.classroom = classroomInstance
        uc.user = userInstance
        uc.save(flush: true)

        def tokenUrl = "http://" + request.getServerName()
            + (request.getServerPort() == 80 ? "" : ":${request.getServerPort()}")
            + (request.getServerPort() == 80 ? "" : "/ControlEscuela") + "/user/activate/?token="
            + userInstance.activationToken
        notificationService.sendEmail(userInstance, contextPath, ["classRoomName": classroomInstance.nameClassroom, activationUrl: tokenUrl])
        render([message: "Se te ha enviado un correo con las indicaciones para seguir con tu proceso ¡Chécalo!"] as JSON)
    }
}