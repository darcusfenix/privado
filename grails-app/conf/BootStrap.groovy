import com.controlescuela.User
import com.ed.classroomcourse.StateClassroom
import com.ed.service.Office

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
    }
    def destroy = {
    }
}
