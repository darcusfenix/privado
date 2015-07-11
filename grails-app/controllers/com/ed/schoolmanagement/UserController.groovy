package com.ed.schoolmanagement

import grails.converters.JSON

class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render User.list([max: params.int('max')]) as JSON
    }

    def create() {
        render new User() as JSON
    }

    def save(User userInstance) {
        if (!userInstance.hasErrors()) {
            userInstance.save()
            UserRole.create(userInstance, Role.findById(params.int("roleId"), true))
            response.status = 200
            render([user: userInstance, message: message(code: "my.property.message", args: ['Pepo', 'Reséndiz'])] as JSON)
        } else {
            response.status = 500
            render(userInstance.errors as JSON)
        }
    }

    def edit(Integer id) {
        render User.findById(id ?: params.int("id")) as JSON
    }

    def show(Integer id) {
        render User.findById(id ?: params.int("id")) as JSON
    }

    def update(User userInstance) {
        if (userInstance.save(flush: true)) {
            UserRole.removeAll(userInstance)
            UserRole.create(userInstance, Role.findById(params.int('roleId')), true)
            response.status = 200
            render userInstance as JSON
        } else {
            response.status = 500
            render userInstance.errors as JSON
        }
    }

    def delete(Integer id) {
        def user = User.findById(id ?: params.int("id"))
        UserRole.removeAll(user, false)
        user.delete(flush: true)
        response.status = 200
        render([message: "Eliminado"] as JSON)
    }
}
