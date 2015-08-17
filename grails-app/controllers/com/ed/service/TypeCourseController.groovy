package com.ed.service

import com.ed.service.TypeCourse
import grails.converters.JSON


@Secured(['ROLE_ADMIN', 'ROLE_EMPLEADO', 'ROLE_SU'])
class TypeCourseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render TypeCourse.list() as JSON
    }
    def show(Integer id){
        render (TypeCourse.findById(id ?: params.int("id")) as JSON)
    }
    def create(){
        render  new TypeCourse() as JSON
    }
    def update(Integer id){
        TypeCourse typeCourseInstance = TypeCourse.findById(request.JSON.id)

        typeCourseInstance.properties = request.JSON

        if (typeCourseInstance.validate()) {
            if (typeCourseInstance.save(flush: true)){
                response.status = 200
                render([typeCourseInstance: typeCourseInstance, message: message(code: "typeCourse.updated")] as JSON)
            }else{
                response.status = 500
                render(typeCourseInstance.errors as JSON)
            }
        } else {
            response.status = 500
            render(typeCourseInstance.errors as JSON)
        }
    }
    def save(){

        def typeCourseInstance = new TypeCourse(request.JSON)
        if (typeCourseInstance.validate()) {
            typeCourseInstance.save(flush: true)
            response.status = 200
            render([typeCourseInstance: typeCourseInstance, message: message(code: "typeCourse.created")] as JSON)
        } else {
            response.status = 500
            render(typeCourseInstance.errors as JSON)
        }

    }
    def delete(){

    }
}
