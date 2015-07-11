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
        UserRole.create(pepo, alumno, true)


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
        service.period = "2015"
        service.stDate = new Date()
        service.endDate = new Date()
        service.typeService = TypeService.findById(1)
        service.save()

    }
    def destroy = {

    }
}
