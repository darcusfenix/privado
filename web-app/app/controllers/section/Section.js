/**
 * Created by darcusfenix on 28/07/15.
 */

function SectionListController($scope, $location, $rootScope, Section) {

    $rootScope.location = $location.path();

    $scope.sectionList = Section.query(function (data) {
        $scope.sectionList = data;
        console.log($scope.sectionList)
    }, function (err) {
        $location.path("/");
    });

};

function SectionCreateController($scope, $location, $rootScope, Section) {
    $rootScope.location = $location.path();
    $scope.validator = {};

    $scope.sectionInstance = Section.create();


    $scope.saveSection = function saveSection(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.sectionInstance.$save(
                function (data) {
                    $location.path("/section/show/"+ data.sectionInstance.id);

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

function SectionEditController($scope, $location, $routeParams, $rootScope, Section) {
    $rootScope.location = $location.path();
    $scope.validator = {};

    $scope.sectionInstance = Section.get({id: $routeParams.id},function(data){
        $scope.sectionInstance = data;
    }, function (err) {
        $location.path('/');
    });
    console.log($scope.sectionInstance);

    $scope.saveSection = function saveSection(valid, $event) {
        $event.preventDefault();
        if (valid) {
            $scope.sectionInstance.$update(
                function (data) {
                    $location.path("/section/show/"+ data.sectionInstance.id);
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

function SectionShowController($scope, $location, $rootScope, $routeParams, Section) {
    $rootScope.location = $location.path();

    $scope.sectionInstance = Section.get({id: $routeParams.id});

    console.log($scope.sectionInstance);

    $scope.delete = function(){
        $scope.sectionInstance.$delete({id: $routeParams.id}, function (success) {
            $rootScope.message = success.success;
            $location.path('/section/');
        }, function (err){
            $rootScope.message = err.error;
        });
    };

};