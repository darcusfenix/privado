<!DOCTYPE html>
<html>
	<head>
		<title>Control Escolar</title>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'angular.min.js')}" ></script>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'angular-route.min.js')}" ></script>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'loading-bar.js')}" ></script>
		<r:layoutResources />
	</head>
	<body ng-app="ControlEscuela">
        <hr/>
        <h1>Test</h1>
        <hr/>
		<div class="row" ng-view></div>
		<script type="text/javascript" src="${resource(dir: 'js/app', file: 'ControlEscolar.js')}" ></script>
		<script type="text/javascript" src="${resource(dir: 'js/app/main', file: 'Main.js')}" ></script>
	</body>
</html>
