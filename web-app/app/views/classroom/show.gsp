<div class="row margin-top-10">
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat2">
            <div class="display">
                <div class="number">
                    <h3 class="font-purple-soft">{{classroomInstance.placesOccupied}}</h3>
                    <small>Alumnos</small>
                </div>

                <div class="icon">
                    <i class="icon-user"></i>
                </div>
            </div>

            <div class="progress-info">
                <div class="progress">
                    <span class="progress-bar progress-bar-success purple-soft"
                          style="width:{{(classroomInstance.placesOccupied*100)/classroomInstance.places}}%">
                </div>

                <div class="status">
                    <div class="status-title">Ocupabilidad</div>

                    <div class="status-number">{{(classroomInstance.placesOccupied*100)/classroomInstance.places}}%</div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat2">
            <div class="display">
                <div class="number">
                    <h3 class="font-green-sharp">
                        <small class="font-green-sharp">$</small>
                        7800
                    </h3>
                    <small>INGRESOS</small>
                </div>

                <div class="icon">
                    <i class="icon-pie-chart"></i>
                </div>
            </div>

            <div class="progress-info">
                <div class="progress">
                    <span class="progress-bar progress-bar-success green-sharp" style="width: 10%;">
                </div>

                <div class="status">
                    <div class="status-title">progreso</div>

                    <div class="status-number">10%</div>
                </div>
            </div>
        </div>
    </div>

    <div class="text-right">
        <button class="btn blue margin-top-10 margin-bottom-10" onclick="window.history.back();"><i
                class="fa fa-arrow-left"></i> Regresar</button>
    </div>

    <div class="col-md-10 col-md-offset-1">

        <div class="alert alert-danger" ng-show="errorMessage">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
            <strong>{{errorMessage}}</strong> </a>
        </div>
        <!-- BEGIN VALIDATION STATES-->
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">
                    {{classroomInstance.nameOffice}} - {{classroomInstance.nameClassroom}}
                </div>
            </div>

            <div class="portlet-body">
                <div class="tab-content">
                    <div class="tab-pane active" id="tab_1_1">
                        <h3 class="form form-section">Información base<hr/></h3>

                        <div class="form-group">
                            <label class="control-label col-md-3">Periodo del curso:
                            </label>
                            <b>{{classroomInstance.period}}</b>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Capacidad del grupo:
                            </label>
                            <b>{{classroomInstance.places}}</b>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Tipo del grupo:
                            </label>
                            <b ng-if="classroomInstance.typeClassroom == 0">Alumnos nuevos</b>
                            <b ng-if="classroomInstance.typeClassroom == 1">Alumnos inscritos</b>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">Estado del grupo:
                        </label>
                        <b>{{classroomInstance.nameStateClassroom}}</b>
                    </div>

                    <div class="form-group" id="pulsate-regular" style="padding:5px;">
                        <label class="control-label col-md-3">Lugares disponibles:
                        </label>
                        <b>{{classroomInstance.places-classroomInstance.placesOccupied}}</b>
                    </div>

                </div>

                <br/>

                <h3 class="form form-section">Horario del grupo<hr/></h3>

                <div class="panel panel-default">
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
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="lesson in lessonList">
                            <td>{{lesson.dateClass | date:'yyyy-MM-dd'}}</td>
                            <td>{{lesson.stHour | date:'h:mm:ss a'}}</td>
                            <td>{{lesson.endHour | date:'h:mm:ss a'}}</td>
                            <td>{{lesson.name}}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="margin-top-10 text-center">
                    <button class="btn btn-default" ng-click="editClassroom();">Editar datos</button>
                    <button class="btn btn-danger" data-toggle="modal" href="#model-confirm">Eliminar</button>
                </div>
            </div>

            <div class="modal fade" id="model-confirm" tabindex="-1" role="basic" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title text-danger">Mensaje de confirmación</h4>
                        </div>

                        <div class="modal-body ">
                            <b>¿Está seguro que desea elimnar el grupo {{classroomInstance.nameClassroom}}?, será eliminado el horario</b>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal"
                                    ng-click="deleteClassroom();">Eliminar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </div>
    </div>
    <!-- END VALIDATION STATES-->
</div>
</div>

