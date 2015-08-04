import com.ed.classroomcourse.Classroom
import com.ed.classroomcourse.Class
import com.ed.classroomcourse.StateClassroom
import com.ed.service.ClassroomCourse
import com.ed.service.ExtraService
import com.ed.service.MockExam
import com.ed.classroomcourse.UserClass
import com.ed.service.Office

import com.controlescuela.*
import com.ed.accesscontrol.StudentService
import com.ed.inductionClass.InductionClass
import com.ed.paycontrol.StateVoucher
import com.ed.schoolmanagement.Role
import com.ed.schoolmanagement.User
import com.ed.schoolmanagement.UserRole
import com.ed.service.OnlineCourse
import com.ed.service.Service
import com.ed.service.TypeCourse
import com.ed.service.TypeService
import com.ed.service.UserClassroom
import org.springframework.web.context.support.WebApplicationContextUtils

import java.text.SimpleDateFormat

import java.time.LocalDateTime

class BootStrap {

    def init = { servletContext ->
        StateClassroom sc = new StateClassroom()
        sc.setName("Abierto")
        sc.setDescription("Abierto")
        sc.save(flush: true)
        sc = new StateClassroom()
        sc.setName("Cerrado")
        sc.setDescription("Cerrado")
        sc.save()

        Office office = new Office()
        office.setName("Oficina principal")
        office.setDescription("Oficina central")
        office.save(flush: true)

        // DO NOT MODIFY
        def springContext = WebApplicationContextUtils.getWebApplicationContext(servletContext)
        springContext.getBean("customObjectMarshallers").register()
        //
        Role alumno = Role.findOrSaveWhere([authority: 'ROLE_ALUMNO'])
        Role.findOrSaveWhere([authority: 'ROLE_EMPLEADO'])
        Role.findOrSaveWhere([authority: 'ROLE_ADMIN'])
        Role.findOrSaveWhere([authority: 'ROLE_SU'])

        Classroom classroom = new Classroom()
        classroom.nameClassroom = "Grupo A"
        classroom.period = "2015-02"
        classroom.places = 50
        classroom.typeClassroom = 0
        classroom.typeClassroomP = 0
        classroom.priority = 1
        classroom.stateClassroom = StateClassroom.findByName("Abierto")
        classroom.office = office
        classroom.save()

        classroom = new Classroom()
        classroom.nameClassroom = "Grupo B"
        classroom.period = "2015-02"
        classroom.places = 50
        classroom.typeClassroom = 0
        classroom.typeClassroomP = 0
        classroom.priority = 100
        classroom.stateClassroom = StateClassroom.findByName("Abierto")
        classroom.office = office
        classroom.save()

        classroom = new Classroom()
        classroom.nameClassroom = "Grupo C"
        classroom.period = "2015-02"
        classroom.places = 50
        classroom.typeClassroom = 0
        classroom.typeClassroomP = 0
        classroom.priority = 1
        classroom.stateClassroom = StateClassroom.findByName("Abierto")
        classroom.office = office
        classroom.save()

        classroom = new Classroom()
        classroom.nameClassroom = "Grupo D"
        classroom.period = "2015-02"
        classroom.places = 20
        classroom.typeClassroom = 0
        classroom.typeClassroomP = 0
        classroom.priority = 3
        classroom.stateClassroom = StateClassroom.findByName("Abierto")
        classroom.office = office
        classroom.save()

        classroom = new Classroom()
        classroom.nameClassroom = "Grupo E"
        classroom.period = "2015-02"
        classroom.places = 1
        classroom.typeClassroom = 0
        classroom.typeClassroomP = 0
        classroom.priority = 3
        classroom.stateClassroom = StateClassroom.findByName("Abierto")
        classroom.office = office
        classroom.save()

        classroom = new Classroom()
        classroom.nameClassroom = "Grupo F"
        classroom.period = "2015-02"
        classroom.places = 0
        classroom.typeClassroom = 0
        classroom.typeClassroomP = 0
        classroom.priority = 3
        classroom.stateClassroom = StateClassroom.findByName("Abierto")
        classroom.office = office
        classroom.save()

        classroom = new Classroom()
        classroom.nameClassroom = "Grupo G"
        classroom.period = "2015-02"
        classroom.places = 50
        classroom.typeClassroom = 0
        classroom.typeClassroomP = 0
        classroom.priority = 4
        classroom.stateClassroom = StateClassroom.findByName("Abierto")
        classroom.office = office
        classroom.save()

        classroom = new Classroom()
        classroom.nameClassroom = "Grupo H"
        classroom.period = "2015-02"
        classroom.places = 50
        classroom.typeClassroom = 0
        classroom.typeClassroomP = 0
        classroom.priority = 4
        classroom.stateClassroom = StateClassroom.findByName("Abierto")
        classroom.office = office
        classroom.save()

        classroom = new Classroom()
        classroom.nameClassroom = "Grupo I"
        classroom.period = "2015-02"
        classroom.places = 50
        classroom.typeClassroom = 0
        classroom.typeClassroomP = 0
        classroom.priority = 4
        classroom.stateClassroom = StateClassroom.findByName("Abierto")
        classroom.office = office
        classroom.save()

        Class c = new Class()
        c.name = "Clase 1"
        c.classroom = classroom
        c.dateClass = new Date()
        c.endHour = new Date()
        c.stClass = Boolean.FALSE
        c.stHour = new Date()
        c.save()

        InductionClass ic = new InductionClass()
        ic.date = null
        ic.name  = "Clase de Inducción 1"
        ic.places = 100
        ic.office = office
        //
        Calendar cal = Calendar.getInstance()
        cal.set(2015, Calendar.AUGUST, 8, 11, 30);
        ic.date = cal.getTime();
        ic.stateClassroom = StateClassroom.findByName("Abierto")
        ic.save(flush: true)

        User pepo = new User()
        pepo.email = "jresendiz27@gmail.com"
        pepo.enabled = true
        pepo.name = "Alberto"
        pepo.lastName = "Reséndiz"
        pepo.mobileNumber = "12345679"
        pepo.phoneNumber = "12345679"
        pepo.password = "test"
        pepo.username = "pepo27"
        pepo.street = "Ahuehuetes"
        pepo.streetNumber = "53"
        pepo.city = "Mexico"
        pepo.town = "Nezahualcóyotl"
        pepo.zipCode = "57820"
        pepo.previousStudent = true
        pepo.inductionClass = ic
        pepo.save()
        UserRole.create(pepo, alumno, false)

        UserClassroom uc = new UserClassroom()
        uc.classroom = classroom
        uc.user = pepo
        uc.save()

        UserClass userClass = new UserClass()
        userClass.clazz = c
        userClass.user = pepo
        userClass.save()

        User user = new User()
        user.email = "juancvfenix@gmail.com"
        user.enabled = true
        user.name = "Juan"
        user.lastName = "Crisóstomo"
        user.mobileNumber = "5530271655"
        user.phoneNumber = "5530271655"
        user.password = "test"
        user.username = "darcusfenix"
        user.street = "Ahuehuetes"
        user.streetNumber = "53"
        user.city = "Mexico"
        user.town = "Nezahualcóyotl"
        user.zipCode = "57820"
        user.previousStudent = true
        user.inductionClass = ic
        user.save()
        UserRole.create(user, alumno, false)

        uc = new UserClassroom()
        uc.classroom = classroom
        uc.user = user
        uc.save()

        User anotheruser = new User()
        anotheruser.email = "gerard@gmail.com"
        anotheruser.enabled = true
        anotheruser.name = "Gerard"
        anotheruser.lastName = "Un apellido"
        anotheruser.mobileNumber = "55555555"
        anotheruser.phoneNumber = "55881763"
        anotheruser.password = "test"
        anotheruser.username = "chochoz"
        anotheruser.street = "Ahuehuetes"
        anotheruser.streetNumber = "53"
        anotheruser.city = "Mexico"
        anotheruser.town = "Nezahualcóyotl"
        anotheruser.zipCode = "57820"
        anotheruser.previousStudent = true
        anotheruser.inductionClass = ic
        anotheruser.save()
        UserRole.create(anotheruser, alumno, false)

        uc = new UserClassroom()
        uc.classroom = classroom
        uc.user = anotheruser
        uc.save()

        StateVoucher stateVoucher = new StateVoucher()
        stateVoucher.name = "pendiente"
        stateVoucher.description = "Este comprobante debe ser revisado"
        stateVoucher.save();

        StateVoucher anotherstateVoucher = new StateVoucher()
        anotherstateVoucher.name = "aprobado"
        anotherstateVoucher.description = "este comprobante ha sido revisado y aprobado"
        anotherstateVoucher.save();

        TypeService typeService = new TypeService()
        typeService.description = "esta es otra descripción"
        typeService.name = "Curso presencial"
        typeService.save();

        TypeService anothertypeService = new TypeService()
        anothertypeService.description = "esta es otra descripción"
        anothertypeService.name = "Curso online"
        anothertypeService.save();

        TypeService othertypeService = new TypeService()
        othertypeService.description = "esta es otra descripción"
        othertypeService.name = "Examen simulacro"
        othertypeService.save();

        TypeService otherAgaintypeService = new TypeService()
        otherAgaintypeService.description = "esta es otra descripción"
        otherAgaintypeService.name = "Servicio Extra"
        otherAgaintypeService.save();


        TypeCourse typeCourse = new TypeCourse()
        typeCourse.name = "Curso normal cat"
        typeCourse.description = "este es un curso normal de muchos meses"
        typeCourse.save()

        TypeCourse anotherTypeCourse = new TypeCourse()
        anotherTypeCourse.name = "Curso Intensivo  cat"
        anotherTypeCourse.description = "este es un curso intensivo de tres semanas"
        anotherTypeCourse.save()


        // SERVICES

        SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");


        ClassroomCourse classroomCourse = new ClassroomCourse()
        classroomCourse.active = true
        classroomCourse.cost = 2500.00
        classroomCourse.period = "2015-02"
        classroomCourse.stDate = new Date()
        classroomCourse.endDate = new Date()
        classroomCourse.typeService = typeService
        classroomCourse.numberClasses = 50
        classroomCourse.typeCourse = typeCourse
        classroomCourse.save()

        OnlineCourse onlineCourse = new OnlineCourse()
        onlineCourse.active = true;
        onlineCourse.cost = 1500.00
        onlineCourse.period = "2015-02"
        onlineCourse.stDate = new Date()
        onlineCourse.endDate = new Date()
        onlineCourse.typeService = anothertypeService
        onlineCourse.save()

        MockExam mockExam = new MockExam()
        mockExam.active = true;
        mockExam.cost = 600.00
        mockExam.period = "2015-02"
        mockExam.stDate = new Date()
        mockExam.endDate = new Date()
        mockExam.term = 1.26
        mockExam.name = "primer examen"
        mockExam.active = false
        mockExam.typeService = othertypeService
        mockExam.save()

        ExtraService extraService = new ExtraService()
        extraService.stDate = new Date()
        extraService.endDate = new Date()
        extraService.fullIncome = 0
        extraService.active = false
        extraService.period = "2015-02"
        extraService.typeService = otherAgaintypeService
        extraService.cost = 500
        extraService.save()


        // STUDENTS WITH SERVICES

        StudentService studentService = new StudentService()
        studentService.service = mockExam
        studentService.user = pepo
        studentService.active = true
        studentService.fullPayment = 500.00
        studentService.save()

        StudentService anotherstudentService = new StudentService()
        anotherstudentService.service = classroomCourse
        anotherstudentService.user = pepo
        anotherstudentService.active = true
        anotherstudentService.fullPayment = 500.00
        anotherstudentService.save()

        StudentService SecondStudentService = new StudentService()
        SecondStudentService.service = onlineCourse
        SecondStudentService.user = pepo
        SecondStudentService.active = true
        SecondStudentService.fullPayment = 500.00
        SecondStudentService.save()

        StudentService studentService_1 = new StudentService()
        studentService_1.service = mockExam
        studentService_1.user = user
        studentService_1.active = true
        studentService_1.fullPayment = 500.00
        studentService_1.save()

        StudentService studentService_2 = new StudentService()
        studentService_2.service = classroomCourse
        studentService_2.user = user
        studentService_2.active = true
        studentService_2.fullPayment = 500.00
        studentService_2.save()

        StudentService studentService_3 = new StudentService()
        studentService_3.service = onlineCourse
        studentService_3.user = user
        studentService_3.active = true
        studentService_3.fullPayment = 500.00
        studentService_3.save(flush: true)

    }
    def destroy = {

    }
}
