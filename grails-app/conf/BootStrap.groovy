import com.controlescuela.*
class BootStrap {

    def init = { servletContext ->
        Role alumno = Role.findOrSaveWhere([authority: 'ROLE_ALUMNO'])
        Role empleado = Role.findOrSaveWhere([authority: 'ROLE_ALUMNO'])
        Role admin = Role.findOrSaveWhere([authority: 'ROLE_ADMIN'])
        Role superAdmin = Role.findOrSaveWhere([authority: 'ROLE_SU'])
    }
    def destroy = {

    }
}
