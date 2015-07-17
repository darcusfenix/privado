<%--
  Created by IntelliJ IDEA.
  User: fernandotapia
  Date: 7/16/15
  Time: 5:17 PM
--%>

<div class="row margin-top-10">
    <div class="col-md-10 col-md-offset-1">

        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    Gestión de grupos de la sucursal "{{officeInstance.name}}"
                </div>
            </div>

        <div class="portlet-body">
            <table class="table table-striped table-bordered table-hover table-responsive table-scrollable" id="tabla">
                <thead>
                <tr>
                    <th>
                        Nombre
                    </th>
                    <th>
                        Lugares
                    </th>
                    <th>
                        Estatus
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
        </div>
        </div>

    </div>
</div>

