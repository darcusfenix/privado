<%--
  Created by IntelliJ IDEA.
  User: fernandotapia
  Date: 7/21/15
  Time: 11:02 AM
--%>

<div class="text-right">
    <button class="btn blue margin-top-10 margin-bottom-10" onclick="window.history.back();"><i
            class="fa fa-arrow-left"></i> Regresar</button>
</div>

<div class="alert alert-danger" ng-show="messageInductionClass">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
    <strong>{{messageInductionClass}}</strong> </a>
</div>

<div class="row margin-top-10">
    <div class="col-md-10 col-md-offset-1">

        <div class="portlet box green-haze">
            <div class="portlet-title">
                 <div class="caption">
                 Clase de inducción "{{inductionClassInstance.name}}"
                </div>
        </div>

        <div class="portlet-body">
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1_1">
                    <h3 class="form form-section">Información base<hr/></h3>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">Nombre de la officina:
                    </label>
                    <b>{{inductionClassInstance.office.name}}</b>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">Capacidad de la clase de inducción:
                    </label>
                    <b>{{inductionClassInstance.places}}</b>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Estado de la clase:
                    </label>
                    <b><span ng-class="inductionClassInstance.nameStateClassroom != 'Cerrado' ? 'text-success' : 'text-danger'">{{inductionClassInstance.nameStateClassroom}}</span></b>
                </div>

                <div class="form-group">
                <label class="control-label col-md-3">Fecha:
                    </label>
                    <b>{{inductionClassInstance.date | date:'yyyy-MM-dd'}}</b>
                </div>

                 <div class="form-group">
                 <label class="control-label col-md-3">Hora:
                 </label>
                    <b>{{inductionClassInstance.date | date:'h:mm a'}}</b>
                 </div>
                 <div class="form-group" id="pulsate-regular" style="padding:5px;">
                    <label class="control-label col-md-3">Lugares disponibles:
                    </label>
                        <b>{{inductionClassInstance.places-inductionClassInstance.placesOccupied}}</b>
                 </div>
                 <div class="form-group text-center" ng-show="inductionClassInstance.placesOccupied > 0">
                    <button class="btn btn-info" data-toggle="modal" href="#model-user">Consultar Alumnos</button>
                 </div>
                <br/>
                <div class="form-group text-center">
                    <button class="btn btn-default" ng-click="editInductionClass();">Editar datos</button>
                    <button class="btn btn-danger" data-toggle="modal" href="#model-confirm">Eliminar</button>
                </div>
            </div>
        </div>
        </div>

        <div class="modal fade" id="model-user" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title text-danger">Información de alumnos</h4>
                    </div>
                    <div class="modal-body table-responsive table-scrollable">
                    <table class="table table-striped table-bordered table-hover" id="tableUser">
                        <thead>
                        <tr>
                            <th>
                                Nombre
                            </th>
                            <th>
                                Apellido
                            </th>
                            <th>
                                Grupo
                            </th>
                        </tr>
                        <tr>
                            <th><input type="text" ng-model="filtro.name" placeholder="Filtrar por Nombre"></th>
                            <th><input type="text" ng-model="filtro.lastName" placeholder="Filtrar por Apellido"></th>
                            <th><input type="text" ng-model="filtro.group.nameClassroom" placeholder="Filtrar por grupo"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="student in inductionClassInstance.students|filter:filtro">
                            <td><a ng-click="showStudent(student.id)">{{student.name}}</a></td>
                            <td>{{student.lastName}}</td>
                            <td>{{student.group.nameClassroom}}</td>
                        </tr>
                        </tbody>
                    </table>
                    </div>
                </div>
    <!-- /.modal-content -->
            </div>
<!-- /.modal-dialog -->
        </div>

        <div class="modal fade" id="model-confirm" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title text-danger">Mensaje de confirmación</h4>
                    </div>
                    <div class="modal-body ">
                        <b>¿Está seguro que desea elimnar la clase de inducción {{inductionClassInstance.name}}?</b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="deleteInductionClass();">Eliminar</button>
                    </div>
                </div>
    <!-- /.modal-content -->
            </div>
<!-- /.modal-dialog -->
        </div>
    </div>
</div>

