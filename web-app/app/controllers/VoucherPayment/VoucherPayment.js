/**
 * Created by darcusfenix on 8/07/15.
 */

function VoucherPaymentShowStudentController($scope,  $routeParams, $location, VoucherPayment, User, $rootScope, StudentService, Service, TypeService, $timeout, $route){
    $rootScope.location = $location.path();
    $scope.errors = [];
    $scope.validator = {};

    $scope.services = Service.query();
    $scope.typeServices= TypeService.query();

    $scope.vouchersPaymentInstances= [] ;

    $scope.userSelected = User.get({id: $routeParams.id}, function (data) {
        $scope.userSelected = data;
    }, function (err) {
        $location.path("voucherPayment/create");
    });
    
    $scope.message = {show:false,type:0,text:''}
    
    $scope.setTotalCostService = function (id, index) {
        Service.get({id:id}, function(data){
            $scope.studentServices[index].service.totalRequired = data.cost;
        });
    };

    $scope.servicesWithStudent = function (){
        $scope.studentServices = StudentService.services({userId: $routeParams.id},function(data) {
            $scope.studentServices = data;

            for(var i = 0; i< $scope.studentServices.length; i++){
                $scope.studentServices[i].abonado = 0;
                $scope.studentServices[i].service.totalRequired = 0.0;
                $scope.vouchersPaymentInstances.push(VoucherPayment.create());
                $scope.vouchersPaymentInstances[i].pay = null;
                $scope.getVouchersPaymentStudentAndService( $scope.studentServices[i].service.id, i);
                $scope.setTotalCostService($scope.studentServices[i].service.id, i);
            }
        });
    }

    $scope.saveVoucherPayment = function saveVoucherPayment(voucherPayment, studentService) {

        $scope.voucherPaymentInstance = VoucherPayment.create();
        $scope.voucherPaymentInstance = voucherPayment;
        $scope.voucherPaymentInstance.studentService = studentService;

        $scope.voucherPaymentInstance = $scope.voucherPaymentInstance.$save({
            userId:$routeParams.id,
            serviceId: studentService.service.id,
            stateVoucher: 2
        },function savedVoucherPayment(data) {
            $scope.message.show = true;
            $scope.message.type = 1;
            $scope.message.text = data.message;
            $timeout(function() {
                $route.reload();
            }, 4000);

        }, function (error){
            console.log(error);
            $scope.message.show = true;
            $scope.message.type = 0;
            $scope.message.text = error.data.message;
            $timeout(function() {
                $scope.message.show = false;
            }, 4000);
        });

    };

    $scope.getNameService = function(id){

        for(var i = 0; i< $scope.services.length; i++)
            if(id === $scope.services[i].id)
                for(var j = 0; j< $scope.typeServices.length; j++)
                    if($scope.services[i].typeService.id === $scope.typeServices[j].id)
                        return $scope.typeServices[j].name;
    };

    $scope.getVouchersPaymentStudentAndService = function(serviceId, index){

        VoucherPayment.vouchersStudenAndService({ 'userId':$routeParams.id, 'serviceId': serviceId},function(data) {

            for(var i = 0; i <  data.length; i++)
                $scope.studentServices[index].abonado += parseFloat(data[i].pay);

        });

    };

    $scope.servicesWithStudent();
};

/****************************/

function VoucherPaymentCreateController($scope,  $routeParams, $location, VoucherPayment, User, $rootScope, StudentService, Service, TypeService, $timeout, $route, StateVoucher){
    $rootScope.location = $location.path();

    $scope.message = {show:false,type:0,text:''}


    $scope.usersList = User.query(function (data){
        $scope.usersList = data;


        for(var i = 0; i < $scope.usersList.length; i++){
           // $scope.usersList[i].services = {};
            //$scope.usersList[i].voucherPayment = {};
           // $scope.addServices($scope.usersList[i].id, i);
            $scope.addVoucherPayment(i);
        }

    });

    $scope.addVoucherPayment = function(index){
        $scope.usersList[index].voucherPayment = VoucherPayment.create();
        $scope.usersList[index].voucherPayment.pay = 0;
    };

    /*
    $scope.addServices = function(id, index){
        StudentService.services({userId: id},function(data) {
            $scope.usersList[index].services = data;
            $scope.usersList[index].totalPaid = 0;
            $scope.usersList[index].totalRequired = 0;

            for(var i = 0; i< $scope.usersList[index].services.length; i++){
                Service.getTotalRequiredByUser({userId:id}, function(data){
                    $scope.usersList[index].totalRequired = parseFloat(data.total);
                });
                $scope.getTotal($scope.usersList[index].id, $scope.usersList[index].services[i].service.id, index);
            }

        });
    };

    $scope.getTotal = function(userId, serviceId, index){

        VoucherPayment.vouchersStudenAndService({ 'userId':userId, 'serviceId': serviceId},function(data) {

            for(var i = 0; i <  data.length; i++)
                $scope.usersList[index].totalPaid += parseFloat(data[i].pay);

        });
    };
*/

    $scope.saveSingleVoucherPayment = function (pay, userId) {

        $scope.voucherPaymentInstance = VoucherPayment.create(function(data){
            $scope.voucherPaymentInstance = data;
            $scope.voucherPaymentInstance.pay = pay;
            $scope.voucherPaymentInstance.studentService = StudentService.getOneServiceOfStudent({userId:userId});
            $scope.voucherPaymentInstance.stateVoucher = StateVoucher.get({id:2});

        });


        $scope.voucherPaymentInstance = $scope.voucherPaymentInstance.$saveSingleVoucherPayment({
            userId:userId,
            stateVoucher:2,
            pay:pay
        },function (success) {
            $scope.message.show = true;
            $scope.message.type = 1;
            $scope.message.text = success.message;


            $timeout(function() {
                $route.reload();
            }, 3000);


        }, function (error){
            console.log(error);
            $scope.message.show = true;
            $scope.message.type = 0;
            $scope.message.text = error.data.message;

            /*
            $timeout(function() {
                $scope.message.show = false;
            }, 4000);
*/
        });


    };



};

/****************************/

function VoucherPaymentShowStudentRecordController ($scope,  $routeParams, $location, VoucherPayment, User, $rootScope, $filter, Service, TypeService, $timeout, $route){
    $rootScope.location = $location.path();
    $scope.errors = [];
    $scope.validator = {};

    $scope.typeServices= TypeService.query();



    $scope.recordVoucherPayment = VoucherPayment.vouchersStudenAndService({ 'userId':$routeParams.userId, 'serviceId': $routeParams.serviceId},function(data) {
        $scope.recordVoucherPayment = data;
        for(var i = 0; $scope.recordVoucherPayment.length; i++){
            $scope.recordVoucherPayment[i].payDate = $filter('date')($scope.recordVoucherPayment[i].payDate, 'short');
        }
        console.log($scope.recordVoucherPayment);
    });

    $scope.user = User.get({id: $routeParams.userId}, function (data) {
        $scope.user = data;
    }, function (err) {
        $location.path("voucherPayment/create");
    });

    $scope.service = Service.get({id: $routeParams.serviceId}, function (data) {
        $scope.service = data;
        $scope.service.stDate = $filter('date')($scope.service.stDate, 'MM/dd/yyyy');
        $scope.service.endDate = $filter('date')($scope.service.endDate, 'MM/dd/yyyy');
    }, function (err) {
        $location.path("voucherPayment/create");
    });

    $scope.getNameService = function(id){

        for(var j = 0; j< $scope.typeServices.length; j++){
            if($scope.service.typeService.id == $scope.typeServices[j].id){
                return $scope.typeServices[j].name;
           }

        }
    };

    $scope.getNameServiceDescription = function(id){
        for(var j = 0; j< $scope.typeServices.length; j++){
            if(parseInt($scope.service.typeService.id) === parseInt($scope.typeServices[j].id)){
                return $scope.typeServices[j].description;
           }

        }
    };


};

function VoucherPaymentDisableServicesController($scope, $location, VoucherPayment, $rootScope, Service, TypeService){

    $scope.servicesList = Service.getServicesByStateTrue(function(data){
        $scope.servicesList = data;
    });

    $rootScope.location = $location.path();
    $scope.typeServices= TypeService.query();

    $scope.getNameService = function(id){
        for(var j = 0; j< $scope.typeServices.length; j++){
            if($scope.typeServices[j].id == id){
                return $scope.typeServices[j].name;
            }
        }
    };

    $scope.disableService = function(id){
        console.log(id);
        VoucherPayment.disableServices({id: id},function(data){
            $rootScope.message = data.message;
        }, function(err){
            $rootScope.message = data.message;
        });
    };
}