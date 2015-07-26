/**
 * Created by darcusfenix on 25/07/15.
 */

function ExtraIncomeListController($scope, $location, $rootScope, $filter, ExtraIncome, ExtraService, Office) {

    $rootScope.location = $location.path();
    $scope.extraIncomeList = ExtraIncome.query(function (data) {
        $scope.extraIncomeList = data;

        for (var i = 0; i < $scope.extraIncomeList.length; i++) {
            $scope.extraIncomeList[i].incomeDate = $filter('date')($scope.extraIncomeList[i].incomeDate, 'MM/dd/yyyy');
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
                    $location.path("/extraIncome/");

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


function ExtraIncomeEditController() {
};
function ExtraIncomeShowController() {
}