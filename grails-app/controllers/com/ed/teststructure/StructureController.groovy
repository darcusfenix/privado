package com.ed.teststructure

import com.ed.service.ExtraIncome
import com.ed.service.MockExam
import grails.converters.JSON


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN', 'ROLE_EMPLEADO', 'ROLE_SU'])
class StructureController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render Structure.list() as JSON
    }

    def show(Integer id) {
        render(Structure.findById(id ?: params.int("id")) as JSON)
    }

    def create() {
        render(new Structure() as JSON)
    }

    //@Transactional
    def save() {
        def structure = new Structure()
        structure.properties = request.JSON

        def criteria = Structure.createCriteria()

        def res = criteria.get {
            eq("name", structure.name).eq("mockExam", structure.mockExam)
        }

        if (res != null) {
            response.status = 500
            render([idError: 1, message: message(code: "de.structure.errorNameStructure.message", args: [structure.getName(), structure.mockExam.period])] as JSON)
        } else {
            if (structure.validate()) {
                structure.save(flush: true)
                response.status = 200
                render([structure: structure, message: message(code: "de.structure.created", args: [structure.name])] as JSON)

            } else {
                response.status = 500
                render(structure.errors as JSON)
            }
        }
    }

    def edit(Structure structureInstance) {

    }

    //@Transactional
    def update() {
        Structure structure = Structure.findById(request.JSON.id)
        structure.name = request.JSON.name
        structure.description = request.JSON.description
        structure.mockExam = MockExam.findById(request.JSON.mockExam.typeService.id)

        def criteria = Structure.createCriteria()

        def res = criteria.get {
            eq("name", structure.name).eq("mockExam", structure.mockExam).ne("id", structure.id)
        }

        if (res != null) {
            response.status = 500
            render([idError: 1, message: message(code: "de.structure.errorNameStructure.message", args: [structure.name, structure.mockExam.period])] as JSON)
        } else {
            if (structure.validate()) {
                structure.save(flush: true)
                response.status = 200;
                render([structure: structure, message: message(code: "de.structure.updated.message", args: [structure.name])] as JSON)
            } else {
                response.status = 500;
                render(structure.errors as JSON)
            }
        }
    }

    //@Transactional
    def delete(Integer id) {
        def structureInstance = Structure.findById(id ?: params.int("id"))
        if (UserStructure.findByStructure(structureInstance) == null) {
            structureInstance.delete(flush: true)
            response.status = 200
            render([message: message(code: 'de.structure.deleted.message')] as JSON)
        } else {
            response.status = 500
            render([message: message(code: 'de.structureUser', args: [structureInstance.name])] as JSON)
        }
    }

    def saveSections(Integer id) {
        print "----->"
        print request.JSON.sections
        List<Integer> listSections = request.JSON.sections
        Structure s = Structure.findById(id)
        StructureSection.executeUpdate("delete StructureSection ss where ss.structure = :structure", [structure: s])
        StructureSection ss = null
        for (int i = 0; i < listSections.size(); i = i + 1) {
            ss = new StructureSection()
            ss.structure = s
            ss.section = Section.findById(listSections[i])
            ss.save(flush: true)
        }
        response.status = 200
        render([message: message(code: "de.structuresection.update", args: [s.name])] as JSON)
    }

    def getSectionsInStructure(Integer id) {
        render StructureSection.findAllByStructure(Structure.findById(id)) as JSON;
    }
}
