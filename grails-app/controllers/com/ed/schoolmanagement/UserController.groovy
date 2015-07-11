package com.ed.schoolmanagement

import grails.converters.JSON

class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render User.list([max: params.int('max')]) as JSON
    }

    def create() {
        render(new User() as JSON)
    }

    def save() {
        def userInstance = new User(request.JSON)
        log.error(request.JSON)
        log.error(userInstance.validate())
        if (userInstance.validate()) {
            log.error("IS VALID");
            userInstance.save()
            UserRole.create(userInstance, Role.findById(request.JSON.authority.id), true)
            response.status = 200
            render([user: userInstance, message: message(code: "de.user.created.message")] as JSON)
        } else {
            response.status = 500
            log.error("ERROR")
            log.error(userInstance.errors)
            log.error("ERROR")
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
        if (!userInstance.hasErrors()) {
            userInstance.save()
            UserRole.removeAll(userInstance)
            UserRole.create(userInstance, Role.findById(request.JSON.authority.id), true)
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
        user.delete(flush: true)
        response.status = 200
        render([message: message(code: 'de.user.deleted.message')] as JSON)
    }
}