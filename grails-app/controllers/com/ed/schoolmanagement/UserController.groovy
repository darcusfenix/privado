package com.ed.schoolmanagement

import com.ed.accesscontrol.StudentService
import com.ed.classroomcourse.Classroom
import com.ed.classroomcourse.UserClass
import com.ed.service.UserClassroom
import grails.converters.JSON
import grails.transaction.Transactional

import javax.servlet.ServletContext

class UserController {

    def notificationService
    def enrollmentService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", enroll: "POST", sendEmailToforeignStudent:"POST"]

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
            UserRole userRole = new UserRole()
            userRole.user = userInstance
            userRole.role = Role.findById(request.JSON.authority.id)
            userRole.save(flush: true)
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
        // Return an error just if the user cant be removed! Checking all the services related
        boolean hasService = true;
        hasService = hasService && StudentService.findByUser(user)
        hasService = hasService && UserClass.findByUser(user)
        hasService = hasService && UserClassroom.findByUser(user)
        if (hasService) {
            response.status = 500
            render([message: message(code: 'de.user.cant.delete.message')] as JSON)
        } else {
            // Removing the roles assigned to the user
            UserRole.removeAll(user, false)
            user.delete(flush: true)
            response.status = 200
            render([message: message(code: 'de.user.deleted.message')] as JSON)
            return
        }

    }


    @Transactional
    def enroll() {
        ServletContext servletContext = getServletContext();
        String contextPath = servletContext.getRealPath(File.separator);

        User userInstance = new User()
        userInstance.properties = request.JSON
        User ufind = User.findByEmail(userInstance.email);
        if (ufind == null) {
            userInstance.password = "test"
            userInstance.username = userInstance.email
            userInstance.save(flush: true, insert: true, failOnError: true)
            userInstance.inductionClass = enrollmentService.getInductionClass(userInstance, null)
            userInstance.save(flush: true, failOnError: true)
            UserRole userRole = new UserRole()
            userRole.user = userInstance
            userRole.role = Role.findById(1)
            userRole.save(flush: true)
            //Assigning a Classroom to a user, it's not activated 'til the user activates his account
            Classroom classroomInstance = Classroom.findByNameClassroom(request.JSON.group)
            UserClassroom uc = new UserClassroom()
            uc.classroom = classroomInstance
            uc.user = userInstance
            uc.activated = false
            uc.save(flush: true)
            //
            String tokenUrl = "http://" + request.getServerName() + (request.getServerPort() == 80 ? "" : ":${request.getServerPort()}") + (request.getServerPort() == 80 ? "" : "/ControlEscuela") + "/registro/#/activation/" + userInstance.activationToken
            //
            notificationService.sendEmail(userInstance, contextPath, ["classRoomName": classroomInstance.nameClassroom, activationUrl: tokenUrl])
            render([message: "Se te ha enviado un correo con las indicaciones para seguir con tu proceso ¡Chécalo!"] as JSON)
        } else {
            response.status = 500
            render([message: "El correo proporcionado ya cuenta con un registro previo en el curso."] as JSON)
        }
    }

    def activateClassroomPlace() {
        User user = User.findByActivationToken(params.token)
        def status = enrollmentService.activateClassroomPlace(user)
        if (status) {
            def responseMap = [:]
            responseMap.name = user.fullName
            responseMap.group = UserClassroom.findByUserAndActivated(user, true).classroom.nameClassroom
            responseMap.date = user.inductionClass ? user.inductionClass.date : Appointment.findByUser(user).appointmentDate
            responseMap.message = 'Usuario verificado'
            render(responseMap as JSON)
            return
        } else {
            response.status = 500
            render([message: message(code: 'de.enrollment.couldNotValidate')] as JSON)
            return
        }
    }

    def activate() {
        User user = User.findByActivationToken(params.token)
        def status = enrollmentService.validateAccount(params.token)
        if (status) {
            def responseMap = [:]
            responseMap.name = user.fullName
            responseMap.group = UserClassroom.findByUser(user).classroom.nameClassroom
            responseMap.date = user.inductionClass ? user.inductionClass.date : Appointment.findByUser(user).appointmentDate
            responseMap.message = 'Usuario verificado'
            render(responseMap as JSON)
            return
        } else {
            response.status = 500
            render([message: message(code: 'de.enrollment.couldNotValidate')] as JSON)
            return
        }
    }

    def generateAppointment() {
        User user = User.findByActivationToken(params.token)
        user.inductionClass = null;
        user.save(flush: true)
        Appointment appointment = new Appointment()
        appointment.user = user
        appointment.appointmentDate = params.date('appointmentDate', "yyyy-MM-dd'T'hh:mm:ss'Z'")
        appointment.save(flush: true)
        render([message: "Se te ha asignado una nueva fecha para tu clase de inducción ¡Chécala!"] as JSON)
        return
    }

    def sketchMail() {

        ServletContext servletContext = getServletContext();
        String contextPath = servletContext.getRealPath(File.separator);

        notificationService.sendSketchMail(params.token, contextPath, ["classRoomName": ""])
        render([message: "Se te ha enviado un correo con los detalles del croquis. ¡Chécalo!"] as JSON)
    }

    def sendEmailToforeignStudent(){
        ServletContext servletContext = getServletContext();
        String contextPath = servletContext.getRealPath(File.separator);

        notificationService.sendEmailToForeignStudent(params.token, contextPath)
        render([message: "Se te ha enviado un correo con los detalles del croquis. ¡Chécalo!"] as JSON)
    }
    def testEmail(){
        ServletContext servletContext = getServletContext();
        String contextPath = servletContext.getRealPath(File.separator);

        notificationService.sendEmailToForeignStudent(params.token, contextPath)
        render([message: "Se te ha enviado un correo con los detalles del croquis. ¡Chécalo!"] as JSON)
    }
}