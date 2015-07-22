package com.ed.schoolmanagement

import grails.converters.JSON

import javax.servlet.ServletContext

class UserController {

    def notificationService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

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

    def activate(String activationToken) {
        def status = notificationService.validateAccount(activationToken)
        if(status){
            render([message:'Usuario verificado'] as JSON)
            return
        } else {
            response.status = 500
            render([message:'No se pudo verificar el usuario'] as JSON)
            return
        }
    }

    def sendWelcomeMail(Integer id){
        ServletContext servletContext = getServletContext();
        String contextPath = servletContext.getRealPath(File.separator);
        def status = notificationService.sendEmail(User.findById(id), contextPath)
        if(status){
            render ([message:status] as JSON)
        } else {
            response.status = 500
            render ([message:status] as JSON)
        }
    }

    def enroll(){
        User userInstance = new User(request.JSON)
    }
}