
import com.controlescuela.*
import com.ed.accesscontrol.StudentService
import com.ed.paycontrol.StateVoucher
import com.ed.service.Service
import com.ed.service.TypeService

class BootStrap {

    def init = { servletContext ->

        User user = new User()
        user.address =  "test address"
        user.username = "darcusfenix"
        user.enabled = true
        user.lastName = "crisóstomo"
        user.name = "juan"
        user.password = "123"
        user.phoneNumber = "5530271655"
        user.save();


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
        service.nombre = "servicio que chinga"
        service.cost = 1500.00
        service.period = "2015"
        service.stDate = "2015-05-10"
        service.endDate = "2015-10-05"
        service.typeService = TypeService.findById(1)
        service.save()

        /*
        StudentService studentService = new StudentService()
        studentService.service = Service.findById(1)
        studentService.active = true
        studentService.fullPayment = 1500.00
        studentService.user = User.findById(1)
        studentService.save()

        */
    }
    def destroy = {
    }
}
