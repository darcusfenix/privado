package com.ed.schoolmanagement

import com.ed.accesscontrol.StudentService
import com.ed.classroomcourse.Class
import com.ed.classroomcourse.Classroom
import com.ed.classroomcourse.UserClass
import com.ed.inductionClass.InductionClass
import com.ed.service.ClassroomCourse
import com.ed.service.MockExam
import com.ed.service.OnlineCourse
import com.ed.service.UserClassroom
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import groovy.time.TimeCategory

import javax.servlet.ServletContext
import java.text.DateFormat
import java.text.SimpleDateFormat

@Secured(['ROLE_ADMIN', 'ROLE_EMPLEADO', 'ROLE_SU'])
class UserController {

    def notificationService
    def enrollmentService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", enroll: "POST", sendEmailToforeignStudent: "POST", sendEmailAddres: "POST", sendEmailExam: "POST", sendEmailExamToAllStudents :"POST"]

    def index() {
        render User.listOrderById([max: params.int('max')]) as JSON
    }

    def create() {
        render(new User() as JSON)
    }

    def save() {
        def userInstance = new User(request.JSON)
        if (userInstance.validate()) {
            userInstance.active = true;
            userInstance.save()

            UserRole.create(userInstance, Role.findById(request.JSON.authority.id), true)

            if ((int) request.JSON.authority.id == 1) {
                StudentService studentService = new StudentService()
                studentService.service = ClassroomCourse.findByActive(true)
                studentService.user = userInstance
                studentService.active = true
                studentService.fullPayment = 0
                studentService.save()

                StudentService anotherStudentService = new StudentService()
                anotherStudentService.service = OnlineCourse.findByActive(true)
                anotherStudentService.user = userInstance
                anotherStudentService.active = true
                anotherStudentService.fullPayment = 0
                anotherStudentService.save()

                StudentService studentServiceMockExam = new StudentService()
                studentServiceMockExam.service = MockExam.findByActive(true)
                studentServiceMockExam.user = userInstance
                studentServiceMockExam.active = true
                studentServiceMockExam.fullPayment = 0
                studentServiceMockExam.save()


            }
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
        UserClassroom uc = UserClassroom.findByUser(userInstance)
        userInstance.properties = request.JSON
        if (userInstance.validate()) {

            if (uc != null) {
                uc.delete()
            }

            userInstance.save()

            UserRole.removeAll(userInstance)
            UserRole.create(userInstance, Role.findById(request.JSON.authority.id), true)

            if (uc != null) {
                uc = new UserClassroom()
                uc.user = userInstance;
                uc.classroom = Classroom.findById(request.JSON.group.id);
                uc.activated = true;
                uc.save(flush: true);
            }

            response.status = 200
            render([user: userInstance, message: message(code: "de.user.updated.message")] as JSON)
        } else {
            response.status = 500
            render(userInstance.errors as JSON)
        }
    }

    def delete(Integer id, Integer td) {
        def user = User.findById(id ?: params.int("id"))
        UserRole.removeAll(user, false)
        // Return an error just if the user cant be removed! Checking all the services related
        String dependencias = "";

        if (StudentService.findByUser(user)) {
            dependencias += "<p><b>Servicios de curso en linea y examen simulacro</b></p>";
        }
        if (UserClass.findByUser(user)) {
            dependencias += "<p><b>Clases asociadas al paso de lista</b></p>";
        }
        if (UserClassroom.findByUser(user)) {
            dependencias += "<p><b>Grupo asignado</b></p>";
        }

        if (td == 1) {
            dependencias = "";
        }

        if (dependencias.length() != 0) {
            response.status = 500
            render([message: message(code: 'de.user.cant.delete.message'), depen: dependencias] as JSON)
        } else {
            // Removing the roles assigned to the user
            UserRole.removeAll(user, false)
            if (UserClassroom.findByUser(user)) {
                UserClassroom.findByUser(user).delete()
            }
            for (UserClass uc : UserClass.findAllByUser(user)) {
                uc.delete()
            }
            for (StudentService ss : StudentService.findAllByUser(user)) {
                ss.delete()
            }
            if (Appointment.findByUser(user)) {
                Appointment.findByUser(user).delete()
            }
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
        Classroom classroomInstance = Classroom.findByNameClassroom(request.JSON.group)

        User userInstance = new User()
        userInstance.properties = request.JSON
        userInstance.password = "test"
        userInstance.username = userInstance.email
        userInstance.save(flush: true, insert: true, failOnError: true)
        userInstance.inductionClass = enrollmentService.getInductionClass(userInstance, null, classroomInstance)
        userInstance.save(flush: true, failOnError: true)

        StudentService studentService = new StudentService()
        studentService.service = ClassroomCourse.findByActive(true)
        studentService.user = userInstance
        studentService.active = true
        studentService.fullPayment = 0
        studentService.save()

        StudentService anotherStudentService = new StudentService()
        anotherStudentService.service = OnlineCourse.findByActive(true)
        anotherStudentService.user = userInstance
        anotherStudentService.active = true
        anotherStudentService.fullPayment = 0
        anotherStudentService.save()

        StudentService studentServiceMockExam = new StudentService()
        studentServiceMockExam.service = MockExam.findByActive(true)
        studentServiceMockExam.user = userInstance
        studentServiceMockExam.active = true
        studentServiceMockExam.fullPayment = 0
        studentServiceMockExam.save()

        UserRole.create(userInstance, Role.findById(1), true)
        //Assigning a Classroom to a user, it's not activated 'til the user activates his account
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
        Date d = new Date()
        String date = params.appointmentDate
        d.setHours(Integer.valueOf(date.split(":")[0]))
        d.setMinutes(Integer.valueOf(date.split(":")[1]))
        d.setSeconds(0)
        if (params.test == "inductionClass") {
            user.inductionClass = InductionClass.findById(params.idClass)
            user.save(flush: true)
        } else {
            user.inductionClass = null;
            user.save(flush: true)
            Appointment appointment = new Appointment()
            for (Appointment ap : Appointment.findAllByUser(user)) {
                ap.delete()
            }
            appointment.user = user
            if (params.day != "1") {
                use(TimeCategory) {
                    d = (d + 1.day)
                }
            }
            appointment.appointmentDate = d
            appointment.save(flush: true)
        }
        render([message: "Se te ha asignado una nueva fecha para tu clase de inducción ¡Chécala!"] as JSON)
        return
    }

    def sketchMail() {

        ServletContext servletContext = getServletContext();
        String contextPath = servletContext.getRealPath(File.separator);

        notificationService.sendSketchMail(params.token, contextPath, ["classRoomName": ""])
        render([message: "Se te ha enviado un correo con los detalles del croquis. ¡Chécalo!"] as JSON)
    }

    def sendEmailToforeignStudent() {
        ServletContext servletContext = getServletContext();
        String contextPath = servletContext.getRealPath(File.separator);
        String contextPathWeb = request.contextPath

        notificationService.sendEmailToForeignStudent(params.token, contextPath, contextPathWeb)
        render([message: "Se te ha enviado un correo con los detalles del croquis. ¡Chécalo!"] as JSON)
    }

    def sendEmailAddres() {
        ServletContext servletContext = getServletContext();
        String contextPath = servletContext.getRealPath(File.separator);
        String contextPathWeb = request.contextPath

        notificationService.sendEmailAddress(params.int("id"), contextPath, contextPathWeb)
        render([message: "Se ha enviado un correo con los detalles del croquis.!"] as JSON)
    }

    def sendEmailExam() {
        ServletContext servletContext = getServletContext();
        String contextPath = servletContext.getRealPath(File.separator);
        String contextPathWeb = request.contextPath

        User userInstance = User.findById(params.int("id"))
        UserRole userRole = UserRole.findByUser(userInstance)

        if (userInstance != null && userRole != null) {
            if (userRole.role.authority == "ROLE_ALUMNO") {
                log.error("********************" + userInstance.activationToken)
                userInstance.activationToken = springSecurityService.encodePassword(userInstance.email).substring(0, 20)

                userInstance.save(flush: true)
                log.error("********************" + userInstance.activationToken)


                String tokenUrl = "http://" + request.getServerName() + (request.getServerPort() == 80 ? "" : ":${request.getServerPort()}") + (request.getServerPort() == 80 ? "" : "/ControlEscuela") + "/examen?tk=" + userInstance.activationToken

                log.error(tokenUrl)

                notificationService.sendEmailExam(userInstance.fullName, contextPath, tokenUrl, userInstance.email)

                render([message: "OK"] as JSON)
            }else {
                return ;
            }
        }else{
            return ;
        }
    }

    def sendEmailExamToAllStudents(Integer id){

        ServletContext servletContext = getServletContext();
        String contextPath = servletContext.getRealPath(File.separator);



        def UserClassroomList = UserClassroom.findAllByClassroom(Classroom.findById(id ?: params.int("id")))

        for (UserClassroom uc : UserClassroomList) {
            if (uc.user.getTotalPaid() > 0) {

                User userInstance = User.findById( uc.user.id )
                UserRole userRole = UserRole.findByUser(userInstance)
                if (userInstance != null && userRole != null) {
                    if (userRole.role.authority == "ROLE_ALUMNO") {

                        log.error("********************" + userInstance.activationToken)
                        userInstance.activationToken = springSecurityService.encodePassword(userInstance.email).substring(0, 20)

                        userInstance.save(flush: true)
                        log.error("********************" + userInstance.activationToken)


                        String tokenUrl = "http://" + request.getServerName() + (request.getServerPort() == 80 ? "" : ":${request.getServerPort()}") + (request.getServerPort() == 80 ? "" : "/ControlEscuela") + "/examen?tk=" + userInstance.activationToken

                        log.error(tokenUrl)
                        log.error("-------------------------------------------------------------------------------" + userInstance.email)

                        notificationService.sendEmailExam(userInstance.fullName, contextPath, tokenUrl, userInstance.email)

                        //render([message: "OK"] as JSON)
                    }else {
                        return ;
                    }
                }else{
                    return ;
                }

            }
        }




    }

    def Dates() {
        response.status = 200
        Date d = new Date()
        render([year: d, mes: d.getMonth(), day: d.getDate(), h: d.getHours(), m: d.getMinutes()] as JSON)
    }

    def datos() {
        User user = User.findByActivationToken(params.token)


        Date date = new Date();

        DateFormat formatter = new SimpleDateFormat("EEEE dd 'de' MMMM 'de' yyyy 'a las ' hh:mm a ", new Locale("es", "MX"));
        DateFormat formatterHour = new SimpleDateFormat("hh:mm a ", new Locale("es", "MX"));


        Class c = Class.findByClassroom(UserClassroom.findByUser(user).classroom)


        Date nd = new Date()
        Date now = new Date()
        nd = c.dateClass

        nd.setHours(c.stHour.getHours())
        nd.setMinutes(c.stHour.getMinutes())

        use(TimeCategory) {
            nd = (nd + 6.hours)
        }

        def binding = [:]

        binding.userFullName = user.fullName
        binding.grupo = user.group.nameClassroom
        binding.horaInicio = formatter.format(c.dateClass)
        binding.horaLimit = formatterHour.format(nd)
        binding.now = formatter.format(now)

        render(binding as JSON)
    }
}