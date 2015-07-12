import com.ed.accesscontrol.StudentService
import com.ed.paycontrol.StateVoucher
import com.ed.schoolmanagement.Role
import com.ed.schoolmanagement.User
import com.ed.schoolmanagement.UserRole
import com.ed.service.Service
import com.ed.service.TypeService
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
        UserRole.create(pepo, alumno, false)

        User user = new User()
        user.address = "test address"
        user.email = "juancvfenix@gmail.com"
        user.enabled = true
        user.name = "JUan"
        user.lastName = "Crisóstomo"
        user.mobileNumber = "5530271655"
        user.phoneNumber = "5530271655"
        user.password = "test"
        user.username = "darcusfenix"
        user.save()
        UserRole.create(user, alumno, false)

        StateVoucher stateVoucher = new StateVoucher()
        stateVoucher.name = "pendiente"
        stateVoucher.description = "esta es una descripción"
        stateVoucher.save();



        TypeService typeService = new TypeService()
        typeService.description = "esta es otra descripción"
        typeService.name = "curso muy rápido"
        typeService.save();


        Service service = new Service()
        service.active = true;
        service.cost = 1500.00
        service.period = "2015-02"
        service.stDate = new Date()
        service.endDate = new Date()
        service.typeService = typeService
        service.save()

        Service anotherService = new Service()
        anotherService.active = true;
        anotherService.cost = 300.00
        anotherService.period = "2015-01"
        anotherService.stDate = new Date()
        anotherService.endDate = new Date()
        anotherService.typeService = typeService
        anotherService.save()

        StudentService studentService = new StudentService()
        studentService.service = service
        studentService.user = pepo
        studentService.active = true
        studentService.fullPayment = 1500.00
        studentService.save()

        StudentService anotherstudentService = new StudentService()
        anotherstudentService.service = anotherService
        anotherstudentService.user = pepo
        anotherstudentService.active = true
        anotherstudentService.fullPayment = 1500.00
        anotherstudentService.save(flush: true)

    }
    def destroy = {

    }
}
