<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<title>Preparaci&oacute;n IPN - Registro segunda vuelta</title>
		<meta name="description" content="Fullscreen Form Interface: A distraction-free form concept with fancy animations" />
		<meta name="keywords" content="Curso de nivel superior, " />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<link rel="stylesheet" type="text/css" href="css/cs-select.css" />
		<link rel="stylesheet" type="text/css" href="css/cs-skin-boxes.css" />
		<script src="js/modernizr.custom.js"></script>
		<script src="./js/modales.js"></script>


		<!-- Requerimientos para modal-->
	    <link rel="stylesheet" href="./css/simplemodal.css" type="text/css" media="screen" title="no title" charset="utf-8">
	    <script src="./js/mootools-core-1.3.1.js" type="text/javascript" charset="utf-8"></script>
	    <script src="./js/mootools-more-1.3.1.1.js" type="text/javascript" charset="utf-8"></script>
	    <script src="./js/simple-modal.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body ng-app="Registro">
		<div class="container" ng-controller="RegistroController">

			<div class="fs-form-wrap" id="fs-form-wrap">
				<div class="fs-title">
					<h1 class="sixeMax">Preparaci&oacute;n IPN</h1>
					<!--div class="codrops-top">
						<a class="codrops-icon codrops-icon-prev" href="http://tympanus.net/Development/NotificationStyles/"><span>P&aacute;gina principal</span></a>
						<a class="codrops-icon codrops-icon-drop" href="http://tympanus.net/codrops/?p=19520"><span>2da. vuelta</span></a>
						<a class="codrops-icon codrops-icon-info" href="#"><span>This is a demo for a fullscreen form</span></a>
					</div-->
				</div>
				<form id="myform" class="fs-form fs-form-full" autocomplete="off">
					<ol class="fs-fields">

						<li>
							<label class="fs-field-label fs-anim-upper" for="q1">&#191; Primer apellido?</label>
							<input ng-model="userInstance.lastName" class="fs-anim-lower" id="primerApellido" name="q1" type="text" placeholder="Primer apellido" required/>
						</li>
						<li>
							<label class="fs-field-label fs-anim-upper" for="surname">&#191; Segundo apellido?</label>
							<input ng-model="userInstance.surName" class="fs-anim-lower" id="surname" name="surname" type="text" placeholder="Segundo apellido" required/>
						</li>
						<li>
							<label class="fs-field-label fs-anim-upper" for="secondSurname">&#191; C&uacute;al es tu nombre?</label>
							<input ng-model="userInstance.name" class="fs-anim-lower" id="secondSurname" name="secondSurname" type="text" placeholder="Juan Jos&eacute;" required/>
						</li>
						<li>
							<label class="fs-field-label fs-anim-upper" for="email">Correo electronico</label>
							<input ng-model="userInstance.email" class="fs-anim-lower" id="email" name="email" type="email" placeholder="juanPerez@hotmail.com" required/>
						</li>
						<li>
							<label class="fs-field-label fs-anim-upper" for="linkFb">Nombre de usuario en facebook.com</label>
							<input class="fs-anim-lower" id="linkFb" name="linkFb" type="linkFb" placeholder="Juan Perez M" required/>
						</li>
						<li>
							<label class="fs-field-label fs-anim-upper" for="phone">Tel&eacute;fono de casa: </label>
							<input class="fs-anim-lower" id="phone" name="phone" type="text" placeholder="56780012" required/>
						</li>
						<li>
							<label class="fs-field-label fs-anim-upper" for="cellphone">Tel&eacute;fono movil</label>
							<input ng-model="userInstance.socialNetworkUrl" class="fs-anim-lower" id="cellphone" name="cellphone" type="text" placeholder="(55)21116789" required/>
						</li>
						<li data-input-trigger>
							<label class="fs-field-label fs-anim-upper" data-info="Selecciona el lugar donde vives">Selecciona tu estado</label>
							<select class="cs-select cs-skin-boxes fs-anim-lower" ng-model="userInstance.state">
								<option value="DIF">Distrito Federal</option>
								<option value="AGS">Aguascalientes</option>
								<option value="BCN">Baja California</option>
								<option value="BCS">Baja California Sur</option>
								<option value="CAM">Campeche</option>
								<option value="CHP">Chiapas</option>
								<option value="CHI">Chihuahua</option>
								<option value="COA">Coahuila</option>
								<option value="COL">Colima</option>
								<option value="DUR">Durango</option>
								<option value="GTO">Guanajuato</option>
								<option value="GRO">Guerrero</option>
								<option value="HGO">Hidalgo</option>
								<option value="JAL">Jalisco</option>
								<option value="MEX">M&eacute;xico</option>
								<option value="MIC">Michoac&aacute;n</option>
								<option value="MOR">Morelos</option>
								<option value="NAY">Nayarit</option>
								<option value="NLE">Nuevo Le&oacute;n</option>
								<option value="OAX">Oaxaca</option>
								<option value="PUE">Puebla</option>
								<option value="QRO">Quer&eacute;taro</option>
								<option value="ROO">Quintana Roo</option>
								<option value="SLP">San Luis Potos&iacute;</option>
								<option value="SIN">Sinaloa</option>
								<option value="SON">Sonora</option>
								<option value="TAB">Tabasco</option>
								<option value="TAM">Tamaulipas</option>
								<option value="TLX">Tlaxcala</option>
								<option value="VER">Veracruz</option>
								<option value="YUC">Yucat&aacute;n</option>
								<option value="ZAC">Zacatecas</option>
							</select>
						</li>
						<li>
							<label class="fs-field-label fs-anim-upper" for="municipality">Municipo o Delegaci&oacute;n: </label>
							<input class="fs-anim-lower" id="municipality" name="municipality" type="text" placeholder="Av. Juan de Dios Batiz Paredes" required/>
						</li>
						<li>
							<label class="fs-field-label fs-anim-upper" for="postCode">C&oacute;digo postal: </label>
							<input class="fs-anim-lower" id="postCode" name="posteCode" type="number" placeholder="" required/>
						</li>
						<li>
							<label class="fs-field-label fs-anim-upper" for="colony">Colonia: </label>
							<input class="fs-anim-lower" id="colony" name="colony" type="text" placeholder="Lindavista" required/>
						</li>

						<li>
							<label class="fs-field-label fs-anim-upper" for="q1">Calle: </label>
							<input class="fs-anim-lower" id="q1" name="q1" type="text" placeholder="Av. Juan de Dios Batiz Paredes" required/>
						</li>
						<li>
							<label class="fs-field-label fs-anim-upper" for="q1">No. Exterior: </label>
							<input class="fs-anim-lower" id="q1" name="q1" type="number" placeholder="#12" required/>
						</li>
						<li>
							<label class="fs-field-label fs-anim-upper" for="q1">No. Interior: </label>
							<input class="fs-anim-lower" id="q1" name="q1" type="text" placeholder="#43" required/>
						</li>
						<li data-input-trigger>
							<label class="fs-field-label fs-anim-upper" for="q3" data-info="Verifica los horarios">Selecciona un Grupo</label>
							<div class="fs-radio-group fs-radio-custom clearfix fs-anim-lower">
								<span>
									<input id="q3b" name="q3" type="radio" value="Grupo A"/>
										<label for="q3b" class="radio-conversion">Grupo A</label>
								</span>
								<span>
									<input id="q3c" name="q3" type="radio" value="social"/>
										<label for="q3c" class="radio-social">Grupo B</label>
								</span>
								<span>
									<input id="q3a" name="q3" type="radio" value="mobile"/>
										<label for="q3a" class="radio-mobile">Grupo C</label>
								</span>
							</div>
						</li>
					</ol>
					<button class="fs-submit" type="submit" ng-click="registrar()" name="horarioGrupo" id="confirm">Enviar datos</button>
				</form>
			</div>
		</div><!-- /container -->
		<script src="js/classie.js"></script>
		<script src="js/selectFx.js"></script>
		<script src="js/fullscreenForm.js"></script>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'angular.min.js')}"></script>
		<script>
			(function() {
				var formWrap = document.getElementById( 'fs-form-wrap' );

				[].slice.call( document.querySelectorAll( 'select.cs-select' ) ).forEach( function(el) {	
					new SelectFx( el, {
						stickyPlaceholder: false,
						onChange: function(val){
							document.querySelector('span.cs-placeholder').style.backgroundColor = val;
						}
					});
				} );

				new FForm( formWrap, {
					onReview : function() {
						classie.add( document.body, 'overview' ); // for demo purposes only
					}
				} );
			})();
			var registro = angular.module('Registro',[]);
			registro.controller('RegistroController',['$scope','$http', function($scope, $http){
				$scope.userInstance = {};
				$scope.registrar = function Registrar(){
					console.log("User Instance");
					console.log($scope.userInstance);
					console.log("User Instance");
					$http.post('/user/enroll',
						$scope.userInstance
					).success(function (data) {
						$location.path("/vehiculo/");
					}).error(function (data) {
						$scope.errores = data;
						console.log($scope.errores);
					});
				};
			}]);

		</script>
	</body>
</html>