<%--
  Created by IntelliJ IDEA.
  User: alberto
  Date: 24/07/15
  Time: 01:37 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<head>
    <link rel="stylesheet" type="text/css" href="modal/css/default.css"/>
    <link rel="stylesheet" type="text/css" href="modal/css/component.css"/>
    <link rel="stylesheet" type="text/css" href="css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="css/component.css"/>
    <link rel="stylesheet" type="text/css" href="css/cs-select.css"/>
    <link rel="stylesheet" type="text/css" href="css/cs-skin-boxes.css"/>
    <link rel="stylesheet" type="text/css" href="css/demo.css"/>
</head>

<div class="fs-title">
    <h1 class="sixeMax">Preparaci&oacute;n IPN</h1>
</div>

<div class="fs-form-wrap" id="fs-form-wrap">
    <form id="myform" name="myform" class="fs-form fs-form-full" autocomplete="off">

        <ol class="fs-fields">
            <li data-input-trigger>
                <label class="fs-field-label fs-anim-upper" for="q3"
                       data-info="Verifica los horarios">Selecciona un Grupo</label>

                <div class="fs-radio-group fs-radio-custom clearfix fs-anim-lower">
                    <span ng-repeat="group in groups track by $index">
                        <input type="button" data-modal="modal-1" style="width: 70% !important;"
                               class="btn btn-info"
                               ng-click="vHorario(group.classes)"
                               value="Ver horario">
                        <input ng-model="userInstance.group" type="radio" id="{{group.id}}" name="grupos"
                               value="{{group.nameClassroom}}" required>
                        <label for="{{group.id}}" style="padding-top: 20px;">
                            <img src="img/notebook.png" width="50px" height="50px">
                            {{group.nameClassroom}}
                            <br>
                            Lugares Disponibles: {{group.places*0.66 | number:0}}</label>
                        <br>
                    </span>
                </div>
            </li>
            <li>
                <label class="fs-field-label fs-anim-upper" for="q1">&#191; Primer apellido?</label>
                <input ng-model="userInstance.lastName" class="fs-anim-lower" id="primerApellido" name="q1"
                       type="text" placeholder="Primer apellido" required/>
            </li>
            <li>
                <label class="fs-field-label fs-anim-upper" for="surname">&#191; Segundo apellido?</label>
                <input ng-model="userInstance.surName" class="fs-anim-lower" id="surname" name="surname" type="text"
                       placeholder="Segundo apellido" required/>
            </li>
            <li>
                <label class="fs-field-label fs-anim-upper"
                       for="secondSurname">&#191; C&uacute;al es tu nombre?</label>
                <input ng-model="userInstance.name" class="fs-anim-lower" id="secondSurname" name="secondSurname"
                       type="text" placeholder="Juan Jos&eacute;" required/>
            </li>
            <li data-input-trigger>
                <label class="fs-field-label fs-anim-upper"
                       for="secondSurname">Genero</label>

                <div class="fs-radio-group fs-radio-custom clearfix fs-anim-lower">
                    <span><input ng-model="userInstance.gender" id="femenino" value="Femenino"
                                 name="genero"
                                 type="radio" required>
                        <label for="femenino" style="padding-top: 20px;">
                            <img src="img/masculino.png" width="150px" height="150px">
                            Femenino
                        </label></span>
                    <span>
                        <input ng-model="userInstance.gender" id="masculino" value="Masculino"
                               name="genero"
                               type="radio" required>
                        <label for="masculino" style="padding-top: 20px;">
                            <img src="img/femenino.png" width="150px" height="150px">
                            Masculino
                        </label>
                    </span>
                </div>

            </li>

            <li>
                <label class="fs-field-label fs-anim-upper" for="email">Correo electronico</label>
                <input ng-model="userInstance.email" class="fs-anim-lower" id="email" name="email" type="email"
                       placeholder="juanPerez@hotmail.com" required/>
            </li>
            <li>
                <label class="fs-field-label fs-anim-upper" for="linkFb">Nombre de usuario en facebook.com</label>
                <input ng-model="userInstance.socialNetworkUrl" class="fs-anim-lower" id="linkFb" name="linkFb"
                       type="linkFb" placeholder="Juan Perez M" required/>
            </li>
            <li>
                <label class="fs-field-label fs-anim-upper" for="phone">Tel&eacute;fono de casa:</label>
                <input ng-model="userInstance.phoneNumber" class="fs-anim-lower" id="phone" name="phone" type="text"
                       placeholder="56780012" required/>
            </li>
            <li>
                <label class="fs-field-label fs-anim-upper" for="cellphone">Tel&eacute;fono movil</label>
                <input ng-model="userInstance.mobileNumber" class="fs-anim-lower" id="cellphone" name="cellphone"
                       type="text" placeholder="(55)21116789" required/>
            </li>
            <li data-input-trigger>
                <label class="fs-field-label fs-anim-upper"
                       data-info="Selecciona el lugar donde vives">Selecciona tu estado</label>
                <select class="cs-select cs-skin-boxes fs-anim-lower">
                    <option value="Distrito Federal">Distrito Federal</option>
                    <option value="Aguascalientes">Aguascalientes</option>
                    <option value="Baja California">Baja California</option>
                    <option value="Baja California Sur">Baja California Sur</option>
                    <option value="Campeche">Campeche</option>
                    <option value="Chiapas">Chiapas</option>
                    <option value="Chihuahua">Chihuahua</option>
                    <option value="Coahuila">Coahuila</option>
                    <option value="Colima">Colima</option>
                    <option value="Durango">Durango</option>
                    <option value="Guanajuato">Guanajuato</option>
                    <option value="Guerrero">Guerrero</option>
                    <option value="Hidalgo">Hidalgo</option>
                    <option value="Jalisco">Jalisco</option>
                    <option value="Mexico">M&eacute;xico</option>
                    <option value="Michoacan">Michoac&aacute;n</option>
                    <option value="Morelos">Morelos</option>
                    <option value="Nayarit">Nayarit</option>
                    <option value="Nuevo Leon">Nuevo Le&oacute;n</option>
                    <option value="Oaxaca">Oaxaca</option>
                    <option value="Puebla">Puebla</option>
                    <option value="Queretaro">Quer&eacute;taro</option>
                    <option value="Quintana Roo">Quintana Roo</option>
                    <option value="San Luis Potosi">San Luis Potos&iacute;</option>
                    <option value="Sinaloa">Sinaloa</option>
                    <option value="Sonora">Sonora</option>
                    <option value="Tabasco">Tabasco</option>
                    <option value="Tamaulipas">Tamaulipas</option>
                    <option value="Tlaxcala">Tlaxcala</option>
                    <option value="Veracruz">Veracruz</option>
                    <option value="Yucatan">Yucat&aacute;n</option>
                    <option value="Zacatecas">Zacatecas</option>
                </select>
            </li>
            <li>
                <label class="fs-field-label fs-anim-upper" for="municipality">Municipo o Delegaci&oacute;n:</label>
                <input ng-model="userInstance.city" class="fs-anim-lower" id="municipality" name="municipality"
                       type="text" placeholder="Av. Juan de Dios Batiz Paredes" required/>
            </li>
            <li>
                <label class="fs-field-label fs-anim-upper" for="postCode">C&oacute;digo postal:</label>
                <input ng-model="userInstance.zipCode" class="fs-anim-lower" id="postCode" name="posteCode"
                       type="number" placeholder="" required/>
            </li>
            <li>
                <label class="fs-field-label fs-anim-upper" for="colony">Colonia:</label>
                <input ng-model="userInstance.town" class="fs-anim-lower" id="colony" name="colony" type="text"
                       placeholder="Lindavista" required/>
            </li>

            <li>
                <label class="fs-field-label fs-anim-upper" for="q1">Calle:</label>
                <input ng-model="userInstance.street" class="fs-anim-lower" id="q1" name="q1" type="text"
                       placeholder="Av. Juan de Dios Batiz Paredes" required/>
            </li>
            <li>
                <label class="fs-field-label fs-anim-upper" for="q1">No. Exterior:</label>
                <input class="fs-anim-lower" ng-model="userInstance.streetNumber" id="q1" name="q1" type="number"
                       placeholder="12" required/>
            </li>
            <li>
                <label class="fs-field-label fs-anim-upper" for="q1">No. Interior:</label>
                <input class="fs-anim-lower" ng-model="userInstance.internalNumber" id="q1" name="q1" type="text"
                       placeholder="43" required/>
            </li>
        </ol>
        <button class="fs-submit" ng-click="registrar()" name="horarioGrupo"
                id="confirm">Enviar datos</button>

        <div style="color: red !important;">
            <h4 ng-show="messageError">{{messageError}}</h4>
        </div>
    </form>
</div>

<div class="md-modal md-effect-3" id="modal-1">
    <div class="md-content container-modal">
        <div><ul>
            <li ng-repeat="c in clazz">
                <span><b>Clase:</b> {{c.name}} el día {{c.dateClass | date:'MM/dd/yyyy'}} a las {{c.stHour | date:'h:mm a'}}
                </span>
            </li>
        </ul>
            <button ng-click="close()">Cerrar</button>
        </div>
    </div>
</div>

<div class="md-overlay"></div>

<script type="text/javascript">
    $(document).ready(function documentReady() {
        var formWrap = document.getElementById('fs-form-wrap');

        [].slice.call(document.querySelectorAll('select.cs-select')).forEach(function (el) {
            new SelectFx(el, {
                stickyPlaceholder: false,
                onChange: function (val) {
                    document.querySelector('span.cs-placeholder').style.backgroundColor = val;
                }
            });
        });

        new FForm(formWrap, {
            onReview: function () {
                classie.add(document.body, 'overview'); // for demo purposes only
            }
        });

        $("alert").on("click", function (e) {
            e.stop();
            var SM = new SimpleModal({"btn_ok": "Alert button"});
            SM.show({
                "title": "Alert Modal Title",
                "contents": "Lorem ipsum dolor sit amet..."
            });
        });

        $("confirm").on("click", function (e) {
            e.stop();
            var SM = new SimpleModal({"btn_ok": "Confirm button"});
            SM.show({
                "model": "confirm",
                "callback": function () {
                    alert("Action confirm!");
                },
                "title": "Confirm Modal Title",
                "contents": "Lorem ipsum dolor sit amet..."
            });
        });
    });
</script>

