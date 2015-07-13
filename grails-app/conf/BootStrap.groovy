import com.ed.classroomcourse.Classroom
import com.ed.schoolmanagement.Role
import com.ed.schoolmanagement.User
import com.ed.schoolmanagement.UserRole
import org.springframework.web.context.support.WebApplicationContextUtils

class BootStrap {

    def init = { servletContext ->
        // DO NOT MODIFY
        def springContext = WebApplicationContextUtils.getWebApplicationContext(servletContext)
        springContext.getBean("customObjectMarshallers").register()
        //
        Role alumno = Role.findOrSaveWhere([authority: 'ROLE_ALUMNO'])
        Role.findOrSaveWhere([authority: 'ROLE_EMPLEADO'])
        Role.findOrSaveWhere([authority: 'ROLE_ADMIN'])
        Role.findOrSaveWhere([authority: 'ROLE_SU'])

        Classroom classroomA = Classroom.findOrSaveWhere([nameClassroom: 'Grupo A', places: 50])
        Classroom classroomB = Classroom.findOrSaveWhere([nameClassroom: 'Grupo B', places: 50])
        Classroom classroomC = Classroom.findOrSaveWhere([nameClassroom: 'Grupo C', places: 50])
        Classroom classroomD = Classroom.findOrSaveWhere([nameClassroom: 'Grupo D', places: 50])

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
        pepo.save()
        UserRole.create(pepo, alumno, true)
    }
    def destroy = {

    }
}
