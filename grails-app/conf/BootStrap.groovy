import com.ed.classroomcourse.Classroom
import com.ed.classroomcourse.Class
import com.ed.classroomcourse.StateClassroom
import com.ed.service.ClassroomCourse
import com.ed.service.ExtraService
import com.ed.service.MockExam
import com.ed.classroomcourse.UserClass
import com.ed.service.Office


import com.ed.accesscontrol.StudentService
import com.ed.inductionClass.InductionClass
import com.ed.paycontrol.StateVoucher
import com.ed.schoolmanagement.Role
import com.ed.schoolmanagement.User
import com.ed.schoolmanagement.UserRole
import com.ed.service.OnlineCourse

import com.ed.service.TypeCourse
import com.ed.service.TypeService
import com.ed.service.UserClassroom

import com.ed.teststructure.Question
import com.ed.teststructure.Section
import com.ed.teststructure.Structure
import com.ed.teststructure.StructureSection
import org.springframework.web.context.support.WebApplicationContextUtils




import java.text.SimpleDateFormat


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
        classroom.priority = 2
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
        ic.name = "Clase de Inducción 1"
        ic.places = 100
        ic.office = office
        //
        Calendar cal = Calendar.getInstance()
        cal.set(2015, Calendar.AUGUST, 9, 11, 00);
        ic.date = cal.getTime();
        ic.stateClassroom = StateClassroom.findByName("Abierto")
        ic.save(flush: true)


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
        mockExam.active = true
        mockExam.typeService = othertypeService
        mockExam.save()

        ExtraService extraService = new ExtraService()
        extraService.stDate = new Date()
        extraService.endDate = new Date()
        extraService.fullIncome = 0
        extraService.description = "venta de guias"
        extraService.active = false
        extraService.period = "2015-02"
        extraService.typeService = otherAgaintypeService
        extraService.cost = 500
        extraService.save()

        // TESTS

        Structure structure = new Structure()
        structure.name = "examen 1"
        structure.description = "una descripción al examen"
        structure.mockExam = mockExam
        structure.save()

        Structure anotherstructure = new Structure()
        anotherstructure.name = "examen 2"
        anotherstructure.description = "otra descripción al examen"
        anotherstructure.mockExam = mockExam
        anotherstructure.save()

        Section section = new Section()
        section.name = "Matemáticas"
        section.description = "muchas matemáticas"
        section.save()

        Section anothersection = new Section()
        anothersection.name = "Ciencias experimentales"
        anothersection.description = "muchas ciencias experimentales"
        anothersection.save()

        StructureSection structureSection = new StructureSection()
        structureSection.structure = structure;
        structureSection.section = section;
        structureSection.save()

      

        // STUDENTS WITH SERVICES



        // DO NOT MODIFY
        def springContext = WebApplicationContextUtils.getWebApplicationContext(servletContext)
        springContext.getBean("customObjectMarshallers").register()
        //

        Role alumno = Role.findOrSaveWhere([authority: 'ROLE_ALUMNO'])
        Role roleEmployee = Role.findOrSaveWhere([authority: 'ROLE_EMPLEADO'])
        Role.findOrSaveWhere([authority: 'ROLE_ADMIN'])
        Role roleSuperAdmin = Role.findOrSaveWhere([authority: 'ROLE_SU'])

        User superAdmin = new User()
        superAdmin.email = "preparacionipn@gmail.com"
        superAdmin.name = "EDGAR"
        superAdmin.lastName = "MONTES"
        superAdmin.surName = "GUTIERREZ"
        superAdmin.mobileNumber = "5545117069"
        superAdmin.phoneNumber = "26801666"
        superAdmin.street = "Avenida Wilfrido Massieu"
        superAdmin.streetNumber = "310"
        superAdmin.city = "Venustiano Carranza"
        superAdmin.town = "Distrito Federal"
        superAdmin.zipCode = "54900"
        superAdmin.previousStudent = false
        superAdmin.inductionClass = null

        superAdmin.enabled = true
        superAdmin.active = true
        superAdmin.passwordExpired = false
        superAdmin.accountExpired = false
        superAdmin.accountLocked = false
        superAdmin.password = "2706QAWS@"
        superAdmin.username = "ADMINMONTESG"

        superAdmin.save(flush: true)
        print("------------------")
        print(roleSuperAdmin.authority)
        print("------------------")
        UserRole.create(superAdmin, roleSuperAdmin, true)

        User employee = new User()
        employee.email = "ftapia.ipn@gmail.com"
        employee.name = "GERAR"
        employee.lastName = "RODRIGUEZ"
        employee.surName = "NULL"
        employee.mobileNumber = "NULL"
        employee.phoneNumber = "NULL"
        employee.street = "LAZARO NULL"
        employee.streetNumber = "10"
        employee.city = "NULL"
        employee.town = "NULL"
        employee.zipCode = "54900"
        employee.previousStudent = false
        employee.inductionClass = null

        employee.enabled = true
        employee.active = true
        employee.passwordExpired = false
        employee.accountExpired = false
        employee.accountLocked = false
        employee.password = "preparacion-ipn-2015"
        employee.username = "CHOCHOZ"

        employee.save(flush: true)
        print("------------------")
        print(roleEmployee.authority)
        print("------------------")
        UserRole.create(employee, roleEmployee, true)



        User pepo = new User()

        pepo.email = "juancvfenix@me.com"
        pepo.name = "juancvfenix"
        pepo.lastName = "juancvfenix"
        pepo.surName = "NULL"
        pepo.mobileNumber = "NULL"
        pepo.phoneNumber = "NULL"
        pepo.street = "LAZARO NULL"
        pepo.streetNumber = "10"
        pepo.city = "NULL"
        pepo.town = "NULL"
        pepo.zipCode = "54900"
        pepo.previousStudent = false
        pepo.inductionClass = ic

        pepo.enabled = true
        pepo.active = true
        pepo.passwordExpired = false
        pepo.accountExpired = false
        pepo.accountLocked = false
        pepo.password = "juancvfenix"
        pepo.username = "juancvfenix"

        pepo.save(flush: true)

        UserRole.create(pepo, alumno, false)

        User juan = new User()

        juan.email = "juancvfenix@hotmail.com"
        juan.name = "JUAN"
        juan.lastName = "CRISOSTOMO"
        juan.surName = "NULL"
        juan.mobileNumber = "NULL"
        juan.phoneNumber = "NULL"
        juan.street = "LAZARO NULL"
        juan.streetNumber = "10"
        juan.city = "NULL"
        juan.town = "NULL"
        juan.zipCode = "54900"
        juan.previousStudent = false
        juan.inductionClass = ic

        juan.enabled = true
        juan.active = true
        juan.passwordExpired = false
        juan.accountExpired = false
        juan.accountLocked = false
        juan.password = "AA"
        juan.username = "AA"

        juan.save(flush: true)

        UserRole.create(juan, alumno, false)


        UserClassroom uc = new UserClassroom()
        uc.classroom = classroom
        uc.user = pepo
        uc.save()

        UserClass userClass = new UserClass()
        userClass.clazz = c
        userClass.user = pepo
        userClass.save()

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
        SecondStudentService.save(flush: true)

        UserClassroom ucA = new UserClassroom()
        ucA.classroom = classroom
        ucA.user = juan
        ucA.save()

        UserClass userClassA = new UserClass()
        userClassA.clazz = c
        userClassA.user = juan
        userClassA.save()

        StudentService studentServiceA = new StudentService()
        studentServiceA.service = mockExam
        studentServiceA.user = juan
        studentServiceA.active = true
        studentServiceA.fullPayment = 500.00
        studentServiceA.save()

        StudentService anotherstudentServiceA = new StudentService()
        anotherstudentServiceA.service = classroomCourse
        anotherstudentServiceA.user = juan
        anotherstudentServiceA.active = true
        anotherstudentServiceA.fullPayment = 500.00
        anotherstudentServiceA.save()

        StudentService SecondStudentServiceA = new StudentService()
        SecondStudentServiceA.service = onlineCourse
        SecondStudentServiceA.user = juan
        SecondStudentServiceA.active = true
        SecondStudentServiceA.fullPayment = 500.00
        SecondStudentServiceA.save(flush: true)

    }
    def destroy = {

    }
}