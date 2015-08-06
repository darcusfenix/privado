/**
 * Created by alberto on 3/07/15.
 */
var app = angular.module('ControlEscuela', ['ngRoute', 'ngResource', 'ngFileUpload', 'angular-loading-bar', 'ngSanitize']);
app.config(['$routeProvider', function ($routeProvider) {
    $routeProvider.when('/', {
        controller: 'MainController',
        templateUrl: 'app/views/main/index.gsp'
    }).otherwise({
        redirectTo: '/'
    });


}]);

app.run(function($rootScope, $templateCache) {
    $rootScope.$on('$viewContentLoaded', function() {
        //$templateCache.removeAll();
        /*var head = document.getElementsByTagName("head")[0], script;
        script = document.createElement("script");
        script.type = "text/x-mathjax-config";
        script[(window.opera ? "innerHTML" : "text")] =
            "MathJax.Hub.Config({\n" +
            "  tex2jax: { inlineMath: [['$','$'], ['\\\\(','\\\\)']] }\n" +
            "});"
        head.appendChild(script);
        script = document.createElement("script");
        script.type = "text/javascript";
        script.src = "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML";
        head.appendChild(script);
        */
    });
});