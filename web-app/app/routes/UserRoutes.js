angular.module('ControlEscuela').config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/user/', {

        controller: 'UserListController',
        templateUrl: 'app/views/user/index.gsp'

    }).when('/user/create', {

        controller: 'UserCreateController',
        templateUrl: 'app/views/user/create.gsp'

    }).when('/user/edit/:id', {

        controller: 'UserEditController',
        templateUrl: 'app/views/user/edit.gsp'

    }).when('/user/show/:id', {

        controller: 'UserShowController',
        templateUrl: 'app/views/user/show.gsp'
        
    }).when('/user/sendEmailAddress', {

        controller: 'UserListController',
        templateUrl: 'app/views/user/sendEmailAddress.gsp'

    }).when('/user/relationClass', {

        controller: 'UserListClass',
        templateUrl: 'app/views/user/relationClass.gsp'

    }).when('/user/sendEmailExamn', {

        controller: 'UserSendEmailController',
        templateUrl: 'app/views/user/sendEmailExam.gsp'

    }).otherwise({

        redirectTo: '/'

    });
}]);
