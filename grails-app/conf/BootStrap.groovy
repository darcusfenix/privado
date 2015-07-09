import com.controlescuela.*
class BootStrap {

    def init = { servletContext ->
        Role.findOrSaveWhere([authority: 'ROLE_ALUMNO'])
        Role.findOrSaveWhere([authority: 'ROLE_EMPLEADO'])
        Role.findOrSaveWhere([authority: 'ROLE_ADMIN'])
        Role.findOrSaveWhere([authority: 'ROLE_SU'])
    }
    def destroy = {

    }
}
