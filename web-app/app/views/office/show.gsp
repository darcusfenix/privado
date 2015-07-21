<%--
  Created by IntelliJ IDEA.
  User: fernandotapia
  Date: 7/16/15
  Time: 5:17 PM
--%>

<div class="text-right">
    <button class="btn blue margin-top-10 margin-bottom-10" onclick="window.history.back();"><i
            class="fa fa-arrow-left"></i> Regresar</button>
</div>

<div class="alert alert-danger" ng-show="messageOfficeClass">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
    <strong>{{messageOfficeClass}}</strong> </a>
</div>

<div class="row margin-top-10">
<div class="col-md-10 col-md-offset-1">

<div class="portlet box green-haze">
<div class="portlet-title">
    <div class="caption">
        Grupos en la sucursal "{{officeInstance.name}}"
    </div>
</div>
</div>

<div class="portlet-body">
<table class="table table-striped table-bordered table-hover table-responsive table-scrollable"
       id="tabla">
    <thead>
    <tr>
        <th>
            Nombre
        </th>
        <th>
            Lugares
        </th>
        <th>
            Tipo
        </th>
    </tr>
    <tr>
        <th>
            <input type="text" ng-model="filtro.nameClassroom" placeholder="Filtrar por nombre">
        </th>
        <th>
            <input type="text" ng-model="filtro.places" placeholder="Filtrar por lugares">
        </th>
        <!--<th>
            <input type="text" ng-model="filtro.typeClassroom" placeholder="Filtrar por tipo de grupo">
        </th>-->
        <th>
            <input type="text" ng-model="filtro.stateClassroom.id" placeholder="Filtrar por estado">
        </th>
    </tr>
    </thead>
    <tbody>
    <tr ng-repeat="classroom in classroomByOffice|filter:filtro">
        <td><a href="#/classroom/show/{{classroom.id}}">{{classroom.nameClassroom}}</a></td>
        <td><a href="#/classroom/show/{{classroom.id}}">{{classroom.places}}</a></td>
        <td><span ng-if="classroom.typeClassroom == 0">Alumnos nuevos</span>
            <span ng-if="classroom.typeClassroom == 1">Alumnos inscritos</span></td>
        <!--<td><span ng-class="classroom.stateClassroom.id != 2 ? 'text-success' : 'text-danger'">{{getNameState(classroom.stateClassroom.id)}}</span></td>-->

    </tr>
    </tbody>
</table>
<br/>
<div class="portlet box green-haze">
    <div class="portlet-title">
        <div class="caption">
            Clases de inducción en la sucursal "{{officeInstance.name}}"
        </div>
    </div>
</div>
<table class="table table-striped table-bordered table-hover table-responsive table-scrollable"
       id="tablaInductionClass">
    <thead>
    <tr>
        <th>
            Nombre
        </th>
        <th>
            Lugares
        </th>
    </tr>
    <tr>
        <th>
            <input type="text" ng-model="filtro2.name" placeholder="Filtrar por nombre">
        </th>
        <th>
            <input type="text" ng-model="filtro2.places" placeholder="Filtrar por lugares">
        </th>
    </tr>
    </thead>
    <tbody>
    <tr ng-repeat="inductionClass in inductionClassByOffice|filter:filtro2">
        <td><a href="#/inductionClass/show/{{inductionClass.id}}">{{inductionClass.name}}</a></td>
        <td><a href="#/inductionClass/show/{{inductionClass.id}}">{{inductionClass.places}}</a></td>
    </tr>
    </tbody>
</table>


</div>


<div class="margin-top-15 margin-bottom-15 text-center">
<button class="btn btn-default" ng-click="editOffice();">Editar datos</button>
<button class="btn btn-danger" data-toggle="modal" href="#model-confirm">Eliminar</button>
</div>

<div class="modal fade" id="model-confirm" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
            <h4 class="modal-title text-danger">Mensaje de confirmación</h4>
        </div>
        <div class="modal-body ">
            <b>¿Está seguro que desea elimnar la officina {{officeInstance.name}}?</b>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="deleteOffice();">Eliminar</button>
        </div>
    </div>
    <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
</div>
</div>

