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

        //Role.findOrSaveWhere([authority: 'ROLE_ALUMNO'])
        Role roleEmployee = Role.findByAuthority('ROLE_EMPLEADO')
        //Role.findOrSaveWhere([authority: 'ROLE_ADMIN'])
        Role roleSuperAdmin = Role.findByAuthority('ROLE_SU')

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

    }
    def destroy = {

    }
}