package com.ed.schoolmanagement

import grails.converters.JSON


@Secured(['ROLE_ADMIN', 'ROLE_EMPLEADO', 'ROLE_SU'])
class RoleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render Role.list(params) as JSON
    }

    def show(Integer id) {
        render Role.findById(id) as JSON
    }

    def create() {
        render new Role(params) as JSON
    }

    def save(Role roleInstance) {
        if (roleInstance == null) {
            response.status = 500
            render(['message': 'El rol no puede ser nulo'] as JSON)
            return
        }

        if (roleInstance.hasErrors()) {
            response.status = 500
            render roleInstance.errors as JSON
            return
        }

        if (roleInstance.save(flush: true, failOnError: true)) {
            render roleInstance as JSON
            return
        }
    }

    def edit(Integer id) {
        render Role.findById(id) as JSON
    }

    def update(Role roleInstance) {
        if (roleInstance == null) {
            response.status = 500
            render(['message': 'El rol no puede ser nulo'] as JSON)
            return
        }

        if (roleInstance.hasErrors()) {
            response.status = 500
            render roleInstance.errors as JSON
            return
        }

        if (roleInstance.save(flush: true, failOnError: true)) {
            render roleInstance as JSON
            return
        }
    }


    def delete(Integer id) {
        Role roleInstance = Role.findById(id)
        UserRole.removeAll(roleInstance, false)
        roleInstance.delete(flush: true)
        render(['message': 'Eliminado'] as JSON)
    }
}
