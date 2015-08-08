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
        

        InductionClass ic = new InductionClass()
        ic.date = null
        ic.name = "Clase de Inducción 1"
        ic.places = 100
        ic.office = office
        //
        Calendar cal = Calendar.getInstance()
        cal.set(2015, Calendar.AUGUST, 8, 11, 00);
        ic.date = cal.getTime();
        ic.stateClassroom = StateClassroom.findByName("Abierto")
        ic.save(flush: true)

        ic = new InductionClass()
        ic.date = null
        ic.name = "Clase de Inducción 2"
        ic.places = 100
        ic.office = office
        //
        cal.set(2015, Calendar.AUGUST, 8, 13, 00);
        ic.date = cal.getTime();
        ic.stateClassroom = StateClassroom.findByName("Abierto")
        ic.save(flush: true)

        ic = new InductionClass()
        ic.date = null
        ic.name = "Clase de Inducción 3"
        ic.places = 100
        ic.office = office
        //
        cal.set(2015, Calendar.AUGUST, 8, 16, 00);
        ic.date = cal.getTime();
        ic.stateClassroom = StateClassroom.findByName("Abierto")
        ic.save(flush: true)

        ic = new InductionClass()
        ic.date = null
        ic.name = "Clase de Inducción 4"
        ic.places = 100
        ic.office = office
        //
        cal.set(2015, Calendar.AUGUST, 8, 18, 00);
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

    }
    def destroy = {

    }
}
