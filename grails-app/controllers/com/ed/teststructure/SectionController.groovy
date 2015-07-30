package com.ed.teststructure

import com.ed.teststructure.Section
import com.ed.teststructure.StructureSection
import grails.converters.JSON

class SectionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render( Section.list() as JSON)
    }
    def create(){
        render( new Section() as JSON)
    }
    def show(Integer id){
        render( Section.findById(id ?: params.int("id")) as JSON)
    }
    def save (){

        def sectionInstance = new Section()
        sectionInstance.properties = request.JSON

        if (sectionInstance.validate()) {
            sectionInstance.save(flush: true)
            response.status = 200
            render([sectionInstance: sectionInstance, message: message(code: "section.created")] as JSON)

        } else {
            response.status = 500
            render(sectionInstance.errors as JSON)
        }
    }
    def update(){

        def sectionInstance = Section.findById(request.JSON.id)

        sectionInstance.properties = request.JSON

        if (sectionInstance.validate()) {

            sectionInstance.save(flush: true)
            response.status = 200
            render([sectionInstance: sectionInstance, message: message(code: "section.updated")] as JSON)
        }else{
            response.status = 500
            render(sectionInstance.errors as JSON)
        }
    }
    def delete(){
        Section section = Section.findById(params.int("id"))
        StructureSection.executeUpdate("delete StructureSection ss where ss.section = :section", [section: section])
        section.delete(flush: true)
        response.status = 200
        render([success: message(code: 'section.deleted')] as JSON)
    }
}
