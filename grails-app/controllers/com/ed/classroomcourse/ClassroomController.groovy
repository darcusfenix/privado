package com.ed.classroomcourse

import com.ed.schoolmanagement.Role
import com.ed.schoolmanagement.User
import com.ed.schoolmanagement.UserRole
import com.ed.service.Office
import com.ed.service.UserClassroom
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import java.text.ParseException
import java.text.SimpleDateFormat

//@Secured(['ROLE_ADMIN', 'ROLE_EMPLEADO', 'ROLE_SU'])
class ClassroomController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        render Classroom.listOrderByPriority([max: params.int('max')]) as JSON
    }

    def show(Integer id) {
        render(Classroom.findById(id ?: params.int("id")) as JSON)
    }

    def create() {
        render(new Classroom() as JSON)
    }

    def getClassroomByOffice(Integer id) {
        render Classroom.findAllByOffice(Office.findById(id)) as JSON;
    }

    def getUsersByClassroom(Integer id) {
        def UserClassroomList = UserClassroom.findAllByClassroom(Classroom.findById(id))
        List<User> userList = new ArrayList<User>()
        for (UserClassroom uc : UserClassroomList) {
            if (uc.user.getTotalPaid() > 0) {
                userList.add(uc.user)
            }
        }
        render userList as JSON
    }

    def getAllUsersByClassroom(Integer id) {
        def UserClassroomList = UserClassroom.findAllByClassroom(Classroom.findById(id))
        List<User> userList = new ArrayList<User>()
        for (UserClassroom uc : UserClassroomList) {
            userList.add(uc.user)
        }
        render userList as JSON
    }

    def getUsersInClassroom(Integer id) {
        render UserClass.findAllByClazz(Class.findById(id)) as JSON;
    }

    def getNumberClassRoom() {

        render([nofCr: Classroom.createCriteria().get {
            projections {
                max "priority"
            }
        } as Integer] as JSON)
    }

    def save(String lista, Integer idOffice) {

        def classroomInstance = new Classroom(request.JSON)

        def criteriaClassroom = Classroom.createCriteria()
        def res = criteriaClassroom.get {
            eq("nameClassroom", classroomInstance.nameClassroom).eq("office", Office.findById(idOffice)).eq("period", classroomInstance.period)
        }

        if (res != null) {
            response.status = 500
            render([idError: 1, message: message(code: "de.classroom.errorNameClassroom.message", args: [Office.findById(idOffice).name, classroomInstance.period])] as JSON)
        } else {
            classroomInstance.stateClassroom = StateClassroom.findByName("Abierto");
            classroomInstance.office = Office.findById(idOffice);

            if (classroomInstance.validate()) {
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                SimpleDateFormat formatter = new SimpleDateFormat("hh:mm:ss a");
                classroomInstance.save()
                def arrayClass = lista.split(",,")
                Class clazz = null

                for (String a : arrayClass) {
                    def json = JSON.parse(a)
                    clazz = new Class()
                    clazz.setName(json.name)
                    try {
                        clazz.setDateClass(sdf.parse(json.dateClass))
                        clazz.setStHour(formatter.parse(json.stHour))
                        clazz.setEndHour(formatter.parse(json.endHour))
                        clazz.classroom = classroomInstance
                        clazz.stClass = Boolean.FALSE
                        clazz.save(flush: true)
                    } catch (ParseException pe) {
                        Class.executeUpdate("delete Class c where c.classroom = :classroom", [classroom: classroomInstance])
                        classroomInstance.delete(flush: true)
                        response.status = 500
                        render([idError: 1, message: message(code: "de.classroom.errorDate.message", args: [json.name])] as JSON)
                    }
                }
                response.status = 200
                render([classroom: classroomInstance, message: message(code: "de.classroom.created.message")] as JSON)
            } else {
                response.status = 500
                render(classroomInstance.errors as JSON)
            }
        }
    }

    def delete(Integer id) {
        def classroomInstance = Classroom.findById(id ?: params.int("id"))
        if (UserClassroom.findByClassroom(classroomInstance) == null) {
            Class.executeUpdate("delete Class c where c.classroom = :classroom", [classroom: classroomInstance])
            classroomInstance.delete(flush: true)
            response.status = 200
            render([message: message(code: 'de.classroom.deleted.message')] as JSON)
        } else {
            response.status = 500
            render([message: message(code: 'de.classroomUser', args: [classroomInstance.nameClassroom])] as JSON)
        }
    }

    def edit(Integer id) {
        render(Classroom.findById(id ?: params.int("id")) as JSON)
    }

    def update(String lista, Integer idOffice) {

        def i = 0
        Classroom classroomInstance = Classroom.findById(request.JSON.id)
        classroomInstance.properties = request.JSON

        def criteriaClassroom = Classroom.createCriteria()

        def res = criteriaClassroom.get {
            eq("nameClassroom", classroomInstance.nameClassroom).eq("office", Office.findById(idOffice)).ne("id", classroomInstance.id).eq("period", classroomInstance.period)
        }

        if (res != null) {
            response.status = 500
            render([idError: 1, message: message(code: "de.classroom.errorNameClassroom.message", args: [Office.findById(idOffice).name, classroomInstance.period])] as JSON)
        } else {
            if (UserClassroom.findAllByClassroom(classroomInstance).size() < classroomInstance.places) {
                classroomInstance.stateClassroom = StateClassroom.findByName("Abierto");
            } else {
                classroomInstance.stateClassroom = StateClassroom.findByName("Cerrado");
            }

            classroomInstance.office = Office.findById(idOffice);

            if (classroomInstance.validate()) {

                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                SimpleDateFormat formatter = new SimpleDateFormat("hh:mm:ss a");
                classroomInstance.save()

                def listClass = Class.findAllByClassroom(classroomInstance)
                for (Class c : listClass) {
                    c.stClass = Boolean.FALSE
                    c.save(flush: true)
                }

                def arrayClass = lista.split(",,")
                Class clazz = null

                for (String a : arrayClass) {
                    def json = JSON.parse(a)
                    clazz = new Class()
                    i = listClass.indexOf(Class.findByName(json.name))
                    try {
                        if (i != -1) {
                            listClass[i].stClass = Boolean.TRUE
                            listClass[i].save(flush: true)
                        } else {
                            clazz.setName(json.name)
                            clazz.setDateClass(sdf.parse(json.dateClass))
                            clazz.setStHour(formatter.parse(json.stHour))
                            clazz.setEndHour(formatter.parse(json.endHour))
                            clazz.classroom = classroomInstance
                            clazz.stClass = Boolean.TRUE
                            clazz.save(flush: true)
                        }
                    } catch (ParseException pe) {
                        //Class.executeUpdate("delete Class c where c.classroom = :classroom", [classroom: classroomInstance])
                        //classroomInstance.delete(flush: true)
                        response.status = 500
                        render([idError: 1, message: message(code: "de.classroom.errorDate.message", args: [json.name])] as JSON)
                    }

                }
                Class.executeUpdate("delete Class c where c.classroom = :classroom and c.stClass = :stClass", [classroom: classroomInstance, stClass: Boolean.FALSE])
                response.status = 200
                render([classroom: classroomInstance, message: message(code: "de.classroom.change.message")] as JSON)
            } else {
                response.status = 500
                render(classroomInstance.errors as JSON)
            }
        }
    }

}
