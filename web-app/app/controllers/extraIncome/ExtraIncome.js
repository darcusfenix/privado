/**
 * Created by darcusfenix on 25/07/15.
 */

function ExtraIncomeListController($scope, $location, $rootScope, $filter, ExtraIncome, ExtraService, Office) {

    $rootScope.location = $location.path();
    $scope.extraIncomeList = ExtraIncome.query(function (data) {
        $scope.extraIncomeList = data;

        for (var i = 0; i < $scope.extraIncomeList.length; i++) {
            $scope.extraIncomeList[i].incomeDate = $filter('date')($scope.extraIncomeList[i].incomeDate, 'MM/dd/yyyy HH:mm:ss');
        }
        console.log($scope.extraIncomeList)
    }, function (err) {
        $location.path("/");
    });

    $scope.extraServiceList = ExtraService.query();
    $scope.officeList = Office.query();


    $scope.getNameService = function(idService){
        for(var i = 0; i < $scope.extraServiceList.length; i++)
            if($scope.extraServiceList[i].id === idService)
                return $scope.extraServiceList[i].description;
    };
    $scope.getNameOffice = function(idOffice){
        for(var i = 0; i < $scope.officeList.length; i++)
            if($scope.officeList[i].id === idOffice)
                return $scope.officeList[i].description;
    };

};

function ExtraIncomeCreateController($scope, $location, $rootScope, ExtraIncome, ExtraService, Office) {
    $rootScope.location = $location.path();
    $scope.validator = {};


    $scope.extraServiceList = ExtraService.query(function (data){
        $scope.extraServiceList = data;
        for(var i = 0; i< $scope.extraServiceList.length; i++){
            if($scope.extraServiceList[i].active === false || $scope.extraServiceList[i].active.length === 0){
                $scope.extraServiceList.splice( i, 1 );
            }
        }
    });

    $scope.officeList = Office.query();

    $scope.extraIncomeInstance = ExtraIncome.create();


    $scope.saveExtraIncome = function saveExtraIncome(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.extraIncomeInstance.$save(
                function (data) {
                    $location.path("/extraIncome/show/"+ data.extraIncomeInstance.id);

                    $rootScope.message = data.message;
                }, function (err) {

                    if(err.data.errors){
                        $scope.errors = err.data.errors;

                        for (var i = 0; i < $scope.errors.length; i++) {

                            $scope.validator[$scope.errors[i].field] = {
                                hasError: true,
                                message: $scope.errors[i].message
                            }

                        }
                    }
                    if(err.data.error){
                        $rootScope.message = err.data.error;
                    }

                });
            return false;
        } else {
            return false;
        }
    };
};


function ExtraIncomeEditController($scope, $location, $routeParams, $filter, $rootScope, ExtraIncome, ExtraService, Office) {
    $rootScope.location = $location.path();
    $scope.validator = {};


    $scope.extraServiceList = ExtraService.query(function (data){
        $scope.extraServiceList = data;
        for(var i = 0; i< $scope.extraServiceList.length; i++){
            if($scope.extraServiceList[i].active === false || $scope.extraServiceList[i].active.length === 0){
                $scope.extraServiceList.splice( i, 1 );
            }
        }
    });

    $scope.officeList = Office.query();

    $scope.extraIncomeInstance = ExtraIncome.get({id: $routeParams.id},function(data){
        $scope.extraIncomeInstance = data;
        $scope.extraIncomeInstance.incomeDate = $filter('date')($scope.extraIncomeInstance.incomeDate, 'MM/dd/yyyy HH:mm:ss');
        console.log($scope.extraIncomeInstance);
    });



    $scope.saveExtraIncome = function saveExtraIncome(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.extraIncomeInstance.$update(
                function (data) {
                    $location.path("/extraIncome/show/"+ data.extraIncomeInstance.id);
                    $rootScope.message = data.message;
                }, function (err) {

                    if(err.data.errors){
                        $scope.errors = err.data.errors;

                        for (var i = 0; i < $scope.errors.length; i++) {

                            $scope.validator[$scope.errors[i].field] = {
                                hasError: true,
                                message: $scope.errors[i].message
                            }

                        }
                    }
                    if(err.data.error){
                        $rootScope.message = err.data.error;
                    }

                });
            return false;
        } else {
            return false;
        }
    };

    $scope.getNameExtraService = function(idExtraService){
        for(var i = 0; i < $scope.extraServiceList.length; i++)
            if($scope.extraServiceList[i].id === idExtraService)
                return $scope.extraServiceList[i].description;
    };
    $scope.getNameOffice = function(idOffice){
        for(var i = 0; i < $scope.officeList.length; i++)
            if($scope.officeList[i].id === idOffice)
                return $scope.officeList[i].description;
    };

};

function ExtraIncomeShowController($scope, $location, $rootScope, $filter, $routeParams, ExtraIncome, ExtraService, Office) {
    $rootScope.location = $location.path();
    $scope.extraServiceList = ExtraService.query();
    $scope.officeList = Office.query();
    $scope.extraIncomeInstance = ExtraIncome.get({id: $routeParams.id}, function(data){
        $scope.extraIncomeInstance = data;
        $scope.extraIncomeInstance.incomeDate = $filter('date')($scope.extraIncomeInstance.incomeDate, 'MM/dd/yyyy HH:mm:ss');
    });




    $scope.getNameExtraService = function(idExtraService){
        for(var i = 0; i < $scope.extraServiceList.length; i++)
            if($scope.extraServiceList[i].id === idExtraService)
                return $scope.extraServiceList[i].description;
    };
    $scope.getNameOffice = function(idOffice){
        for(var i = 0; i < $scope.officeList.length; i++)
            if($scope.officeList[i].id === idOffice)
                return $scope.officeList[i].description;
    };

    $scope.delete = function(){
        $scope.extraIncomeInstance.$delete({id: $routeParams.id}, function (success) {
            $rootScope.message = success.success;
            $location.path('/extraIncome/');
        }, function (err){
            $rootScope.message = err.error;
        });
    };

};