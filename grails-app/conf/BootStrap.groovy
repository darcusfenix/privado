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


        // DO NOT MODIFY
        def springContext = WebApplicationContextUtils.getWebApplicationContext(servletContext)
        springContext.getBean("customObjectMarshallers").register()
        //

        Role.findOrSaveWhere([authority: 'ROLE_ALUMNO'])
        Role roleEmployee = Role.findOrSaveWhere([authority: 'ROLE_EMPLEADO'])
        Role.findOrSaveWhere([authority: 'ROLE_ADMIN'])
        Role roleSuperAdmin = Role.findOrSaveWhere([authority: 'ROLE_SU'])

        User superAdmin = new User()
        superAdmin.email = "juancvfenix@gmail.com"
        superAdmin.name = "JUAN"
        superAdmin.lastName = "CRISÓSTOMO"
        superAdmin.surName = "VÁZQUEZ"
        superAdmin.mobileNumber = "5530271655"
        superAdmin.phoneNumber = "58880603"
        superAdmin.street = "LAZARO CARDENAS"
        superAdmin.streetNumber = "10"
        superAdmin.city = "TULTITLÁN"
        superAdmin.town = "MEXICO"
        superAdmin.zipCode = "54900"
        superAdmin.previousStudent = false
        superAdmin.inductionClass = null

        superAdmin.enabled = true
        superAdmin.active = true
        superAdmin.passwordExpired = false
        superAdmin.accountExpired = false
        superAdmin.accountLocked = false
        superAdmin.password = "2706QAWS@"
        superAdmin.username = "DARCUSFENIX"

        superAdmin.save()
        UserRole.create(superAdmin, roleSuperAdmin, false)

        User employee = new User()
        employee.email = "preparacionipn@hotmail.com"
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

        employee.save()
        UserRole.create(employee, roleEmployee, false)

    }
    def destroy = {

    }
}