package com.ed.schoolmanagement

import com.ed.classroomcourse.Class
import com.ed.classroomcourse.Classroom
import grails.converters.JSON

class UserController {

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

    // TODO: Will be removed
    def getGroups(){
        render(Classroom.list() as JSON)
    }
}