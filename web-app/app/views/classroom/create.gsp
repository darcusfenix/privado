<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <!-- BEGIN VALIDATION STATES-->
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    Registro de Grupo
                </div>
            </div>
            <div class="portlet-body form">
                <form name="createGroup" class="form-horizontal" ng-submit="saveGroup(createGroup.$valid, $event)" novalidate>
                    <div class="form-body">

                        <h3 class="form form-section">Información base<hr/></h3>

                        <div class="form-group" ng-class="{'has-error': createGroup.nameClassroom.$error.required||validator.nameClassroom.hasError}">
                            <label class="control-label col-md-3"><span class="required">
                                *</span> Nombre de Grupo:
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="classroomInstance.nameClassroom"  class="form-control" name="nameClassroom" required/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{'has-error': createGroup.places.$error.required||validator.places.hasError}">
                            <label class="control-label col-md-3"> <span class="required">
                                *</span> Capacidad del grupo:
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="number" min="1" ng-model="classroomInstance.places" class="form-control" name="places" required/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-class="{'has-error': createGroup.typeClassroom.$error.required}">
                            <label class="control-label col-md-3"> <span class="required">
                                *</span>Tipo del grupo:
                            </label>
                            <div class="col-md-4">
                                <div class="radio-list">
                                    <label>
                                        <input type="radio" ng-model="classroomInstance.typeClassroom" name="optionsRadios" id="optionsRadios1" value="0" required> Alumnos nuevos</label>
                                    <label>
                                        <input type="radio" ng-model="classroomInstance.typeClassroom" name="optionsRadios" id="optionsRadios2" value="1" required> Alumnos inscritos</label>
                                </div>
                            </div>
                        </div>

                        <br/>
                        <h3 class="form form-section">Horario del grupo<hr/></h3>

                        <div class="form-group">
                            <label class="control-label col-md-2"><span class="required">
                                *</span> Fecha:
                            </label>

                            <div class="col-md-4">
                                <input type="text" ng-model="lesson.dateClass" data-date-start-date="+0d" readonly placeholder="Check out" name="dateClass" size="14"  class="form-control dp"/>
                            </div>
                            <span class="text-danger" ng-show="validatorFecha.hasError">
                                {{validatorFecha.message}}
                            </span>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-2">Hora inicial:
                            </label>

                            <div class="col-md-3">
                                <div class="input-icon">
                                    <i class="fa fa-clock-o"></i>
                                    <input name="stHour" ng-model="leasson.stHour" class="form-control timepicker timepicker-default tp" readonly type="text">
                                </div>
                            </div>

                            <label class="control-label col-md-2">Hora final:
                            </label>



                            <div class="col-md-3">
                                <div class="input-icon">
                                    <i class="fa fa-clock-o"></i>
                                    <input name="endHour" ng-model="leasson.endHour" class="form-control timepicker timepicker-default tp2" readonly type="text">
                                </div>
                                <!--<input type="text" ng-model="lesson.endHour" name="endHour"  data-format="hh:mm A" readonly class="form-control clockface_1 tp2"/>-->
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-2"><span class="required">
                                *</span>Tema:
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="lesson.name" class="form-control" name="name"/>
                                </div>
                            </div>
                            <span class="text-danger" ng-show="validatorTema.hasError">
                                {{validatorTema.message}}
                            </span>
                        </div>

                        <div class="form-group">
                            <div class="text-center">
                                <button ng-click="agregarFila(lesson)" class="btn blue-madison" type="button">Agregar clase</button>
                            </div>
                        </div>
                        <div class="alert-danger" ng-show="errorDate.estatus">
                            {{errorDate.message}}
                        </div>
                        <table class="table table-striped table-bordered table-hover" id="tableClass">
                            <thead>
                            <tr>
                                <th>
                                    Fecha
                                </th>
                                <th>
                                    Hora inicial
                                </th>
                                <th>
                                    Hora final
                                </th>
                                <th>
                                    Tema
                                </th>
                                <th style="width: 10%;">
                                    Eliminar
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="lesson in lessonList">
                                <td>{{lesson.dateClass}}</td>
                                <td>{{lesson.stHour}}</td>
                                <td>{{lesson.endHour}}</td>
                                <td>{{lesson.name}}</td>
                                <td class="text-center"><button ng-click="eliminarFila($index)" class="btn-sm btn-danger"><i class="fa fa-trash-o"></i></button></td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                    <div class="form-actions">
                        <div class="row">
                            <div class="text-center">
                                <button type="submit" class="btn green" ng-disabled="createGroup.$invalid || !(lessonList.length != 0)">Registrar</button>
                                <button type="button" class="btn default" ng-click="cancelar();">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- END VALIDATION STATES-->
    </div>
</div>



%{--
<ul>
    <li>Username: <input ng-model="userInstance.username" type="text"> </li>
    <li>Name: <input ng-model="userInstance.name" type="text"> </li>
    <li>Last Name: <input ng-model="userInstance.lastName" type="text"> </li>
    <li>Phone Number: <input ng-model="userInstance.phoneNumber" type="text"> </li>
</ul>
<button ng-click="saveUser()">Actualizar</button>
<button ng-click="cancelar()">Cancelar</button>--}%
