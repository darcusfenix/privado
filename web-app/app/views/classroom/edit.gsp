<div class="modal fade" id="model-confirm" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title text-danger">Mensaje de error</h4>
            </div>

            <div class="modal-body text-center">
                <div ng-show="errorDate.estatus">
                    {{errorDate.message}}
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="row">
    <div class="text-right">
        <button class="btn blue margin-top-10 margin-bottom-10" onclick="window.history.back();"><i
                class="fa fa-arrow-left"></i> Regresar</button>
    </div>

    <div class="col-md-10 col-md-offset-1">
        <!-- BEGIN VALIDATION STATES-->
        <div class="portlet box green light">
            <div class="portlet-title">
                <div class="caption">
                    Registro de Grupo
                </div>
            </div>

            <div class="portlet-body form">
                <form name="editGroup" class="form-horizontal" ng-submit="updateGroup(editGroup.$valid, $event)"
                      novalidate>
                    <div id="divError" class="form-body">

                        <h3 class="form form-section">Información base<hr/></h3>

                        <div class="form-group form-md-line-input" ng-class="{'has-error': varSlc == 0}">
                            <label class="control-label col-md-3"><span class="required">
                                *</span> Sucursal:
                            </label>

                            <div class="col-sm-5">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <select class="form-control" ng-model="varSlc">
                                        <option value="0">Seleccione</option>
                                        <option ng-repeat="office in officeList"
                                                value="{{office.id}}">{{office.name}}</option>
                                    </select>

                                    <div class="form-control-focus">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group form-md-line-input"
                             ng-class="{'has-error': editGroup.nameClassroom.$error.required||validator.nameClassroom.hasError}">
                            <label class="control-label col-sm-3"><span class="required">
                                *</span> Nombre de Grupo:
                            </label>

                            <div class="col-sm-5">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="classroomInstance.nameClassroom" class="form-control"
                                           name="nameClassroom" required
                                           placeholder="Introducir el nombre del salón"/>

                                    <div class="form-control-focus">
                                    </div>

                                    <p class="help-block">Grupo [A-Z||0-9]
                                    </p>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <span class="text-danger"
                                      ng-show="editGroup.nameClassroom.$error.required||validator.nameClassroom.hasError">
                                    {{validator.nameClassroom.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-md-line-input"
                             ng-class="{'has-error': editGroup.period.$error.required||validator.period.hasError}">
                            <label class="control-label col-sm-3"><span class="required">
                                *</span> Periodo del curso:
                            </label>

                            <div class="col-sm-5">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="classroomInstance.period" class="form-control"
                                           name="period" required
                                           placeholder="Introducir el periodo"/><span
                                        class="help-block"><h6>[2015-01]</h6></span>

                                    <div class="form-control-focus">
                                    </div>

                                </div>
                            </div>

                            <div class="col-sm-4">
                                <p class="text-danger"
                                   ng-show="editGroup.period.$error.required||validator.period.hasError">
                                    {{validator.period.message}}
                                </p>
                            </div>
                        </div>

                        <div class="form-group form-md-line-input"
                             ng-class="{'has-error': editGroup.places.$error.required||validator.places.hasError}">
                            <label class="control-label col-sm-3"><span class="required">
                                *</span> Capacidad del grupo:
                            </label>

                            <div class="col-sm-2">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="number" min="1" ng-model="classroomInstance.places"
                                           class="form-control" name="places" required/>

                                    <div class="form-control-focus">
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <span class="text-danger"
                                      ng-show="editGroup.places.$error.required||validator.places.hasError">
                                    {{validator.places.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group form-md-radios"
                             ng-class="{'has-error': classroomInstance.typeClassroomP == null}">
                            <label class="control-label col-md-3"><span class="required">
                                *</span>Tipo del grupo:
                            </label>

                            <div class="col-sm-5">
                                <div class="md-radio-inline">
                                    <div class="md-radio"><input type="radio"
                                                                 ng-model="classroomInstance.typeClassroomP"
                                                                 name="optionsRadios1" id="optionsR1" value="0"
                                                                 required>
                                        <label for="optionsR1">
                                            <span></span>
                                            <span class="check"></span>
                                            <span class="box"></span>
                                            Curso presencial</label>
                                    </div>

                                    <div class="md-radio"><input ng-click="inputR()" type="radio"
                                                                 ng-model="classroomInstance.typeClassroomP"
                                                                 name="optionsRadios1" id="optionsR2" value="1"
                                                                 required>
                                        <label for="optionsR2">
                                            <span></span>
                                            <span class="check"></span>
                                            <span class="box"></span>
                                            Examen simulacro</label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <span class="text-danger"
                                      ng-show="createGroup.typeClassroomP.$error.required||validator.typeClassroomP.hasError">
                                    {{validator.typeClassroomP.message}}
                                </span>
                            </div>
                        </div>

                        <div ng-show="classroomInstance.typeClassroomP == 0">
                            <div class="form-group form-md-line-input"
                                 ng-class="{'has-error': classroomInstance.typeClassroom == null}">
                                <label class="control-label col-md-3"><span class="required">
                                    *</span>Tipo de alumnos:
                                </label>

                                <div class="col-sm-5">
                                    <div class="md-radio-inline">
                                        <div class="md-radio"><input type="radio"
                                                                     ng-model="classroomInstance.typeClassroom"
                                                                     name="optionsRadios2" class="md-radiobtn"
                                                                     id="optionsRadio1" value="0"
                                                                     required checked>
                                            <label for="optionsRadio1">
                                                <span></span>
                                                <span class="check"></span>
                                                <span class="box"></span>
                                                Alumnos nuevos</label>
                                        </div>

                                        <div class="md-radio"><input type="radio"
                                                                     ng-model="classroomInstance.typeClassroom"
                                                                     name="optionsRadios2" id="optionsRadio2" value="1"
                                                                     required>
                                            <label for="optionsRadio2">
                                                <span></span>
                                                <span class="check"></span>
                                                <span class="box"></span>
                                                Alumnos incritos</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <span class="text-danger"
                                          ng-show="createGroup.typeClassroom.$error.required||validator.typeClassroom.hasError">
                                        {{validator.typeClassroom.message}}
                                    </span>
                                </div>
                            </div>

                            <div class="form-group form-md-line-input"
                                 ng-class="{'has-error': editGroup.priority.$error.required||validator.priority.hasError}">
                                <label class="control-label col-md-3"><span class="required">
                                    *</span> Precendencia:
                                </label>

                                <div class="col-sm-5">
                                    <div class="input-icon right">
                                        <i class="fa"></i>
                                        <input type="number" min="1" max="{{nofClassroom.nofCr+1}}"
                                               ng-model="classroomInstance.priority"
                                               class="form-control" name="priority" required/>

                                        <div class="form-control-focus">
                                        </div>
                                        <span class="help-block">La precendencia es el nivel de prioridad a ser publicado del 1 al {{nofClassroom.nofCr+1}}.</span>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <span class="text-danger"
                                          ng-show="editGroup.priority.$error.required||validator.priority.hasError">
                                        {{validator.priority.message}}
                                    </span>
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
                                <input type="text" ng-model="lesson.dateClass" data-date-start-date="+0d" readonly
                                       placeholder="Check out" name="dateClass" size="14" class="form-control dp"/>
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
                                    <input name="stHour" ng-model="leasson.stHour"
                                           class="form-control timepicker timepicker-default tp" readonly
                                           type="text">
                                </div>
                            </div>

                            <label class="control-label col-md-2">Hora final:
                            </label>


                            <div class="col-md-3">
                                <div class="input-icon">
                                    <i class="fa fa-clock-o"></i>
                                    <input name="endHour" ng-model="leasson.endHour"
                                           class="form-control timepicker timepicker-default tp2" readonly
                                           type="text">
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
                                <button ng-click="agregarFila(lesson)" class="btn blue-madison"
                                        type="button">Agregar clase</button>
                            </div>
                        </div>

                        <div class="panel panel-default table-responsive table-scrollable">
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
                                    <td>{{lesson.dateClass | date:'MM/dd/yyyy'}}</td>
                                    <td>{{lesson.stHour | date:'hh:mm:ss a'}}</td>
                                    <td>{{lesson.endHour | date:'hh:mm:ss a'}}</td>
                                    <td>{{lesson.name}}</td>
                                    <td class="text-center"><button ng-show="lesson.nofS == 0"
                                                                    ng-click="eliminarFila($index)"
                                                                    class="btn-sm btn-danger"><i
                                                class="fa fa-trash-o"></i></button><span class="text-danger"
                                                                                         ng-show="lesson.nofS != 0">Alumnos en clase</span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                        </div>


                        <!-- <div class="text-center padding-top-10px padding-button-10px"
                             ng-show="classroomInstance.placesOccupied != 0">

                            <div class="note note-info">
                                <i class="fa fa-info-circle"></i> Las clases no pueden ser editadas en esta sección, ya que cuentan con alumnos registrados.
                            </div>


                            <div class="form-group">
                                <label class="control-label">Editar clases:
                                </label>
                                <a type="button" href="#" class="btn btn-info disabled">Ver clases</a>
                            </div>
                        </div>-->
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="text-center">
                                <button type="submit" class="btn green"
                                        ng-disabled=" !(varSlc !=0) ||  editGroup.$invalid || !editGroup.$dirty || !(lessonList.length != 0)">Actualizar</button>
                                <button type="button" class="btn default" ng-click="cancelar();">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!-- END VALIDATION STATES-->
        </div>
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
