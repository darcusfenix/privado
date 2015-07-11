import com.controlescuela.User
import com.ed.classroomcourse.StateClassroom
import com.ed.service.Office

import com.controlescuela.*
import com.ed.schoolmanagement.Role
import com.ed.schoolmanagement.User
import com.ed.schoolmanagement.UserRole
import org.springframework.web.context.support.WebApplicationContextUtils

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

        User u = new User()
        u.setName("Fernando")
        // DO NOT MODIFY
        def springContext = WebApplicationContextUtils.getWebApplicationContext(servletContext)
        springContext.getBean("customObjectMarshallers").register()
        //
        Role alumno = Role.findOrSaveWhere([authority: 'ROLE_ALUMNO'])
        Role.findOrSaveWhere([authority: 'ROLE_EMPLEADO'])
        Role.findOrSaveWhere([authority: 'ROLE_ADMIN'])
        Role.findOrSaveWhere([authority: 'ROLE_SU'])
        User pepo = new User()
        pepo.address = "test"
        pepo.email = "jresendiz27@gmail.com"
        pepo.enabled = true
        pepo.name = "Alberto"
        pepo.lastName = "Reséndiz"
        pepo.mobileNumber = "12345679"
        pepo.phoneNumber = "12345679"
        pepo.password = "test"
        pepo.username = "pepo27"
        pepo.save()
        UserRole.create(pepo, alumno, true)
    }
    def destroy = {

    }
}
