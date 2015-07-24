<div class="row margin-top-10">
    <div class="col-md-12">

        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa"></i>Gestión de grupos
                </div>
            </div>

            <div class="portlet-body table-responsive table-scrollable">
                <table class="table table-striped table-bordered table-hover" id="tabla">
                    <thead>
                    <tr>
                        <th>
                            Sucursal
                        </th>
                        <th>
                            Periodo
                        </th>
                        <th>
                            Nombre
                        </th>
                        <th>
                            Lugares disponibles
                        </th>
                        <th>
                            Tipo
                        </th>
                        <th>
                            Tipo de alumnos
                        </th>
                        <th>
                            Estatus
                        </th>
                    </tr>
                    <tr>
                        <th><input type="text" ng-model="filtro.nameOffice" placeholder="Filtrar por sucursal"></th>
                        <th><input type="text" ng-model="filtro.period" placeholder="Filtrar por periodo"></th>
                        <th>
                            <input type="text" ng-model="filtro.nameClassroom" placeholder="Filtrar por nombre">
                        </th>
                        <th>
                            <input type="text" ng-model="filtro.places" placeholder="Filtrar por lugares">
                        </th>
                        <th>
                            <input type="text" ng-model="filtro.typeClassroom" placeholder="Filtrar por tipo de grupo">
                        </th>
                        <th>
                            <input type="text" ng-model="filtro.typeClassroom" placeholder="Filtrar por tipo de alumnos">
                        </th>
                        <th>
                            <input type="text" ng-model="filtro.nameStateClassroom" placeholder="Filtrar por estado">
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="classroom in classroomList|filter:filtro">
                        <td class="text-center"><a href="#/classroom/show/{{classroom.id}}">{{classroom.nameOffice}}</a></td>
                        <td class="text-center"><a href="#/classroom/show/{{classroom.id}}">{{classroom.period}}</a></td>
                        <td><a href="#/classroom/show/{{classroom.id}}">{{classroom.nameClassroom}}</a></td>
                        <td><a  href="#/classroom/show/{{classroom.id}}">{{classroom.places}} - {{classroom.placesOccupied}} = {{classroom.places-classroom.placesOccupied}}</a></td>
                        <td><span ng-if="classroom.typeClassroomP == 0">Curso presencial</span>
                        <span ng-if="classroom.typeClassroomP == 1">Examen simulacro</span></td>
                        <td><span ng-if="classroom.typeClassroom == 0">Alumnos nuevos</span>
                            <span ng-if="classroom.typeClassroom == 1">Alumnos inscritos</span></td>
                        <td><span ng-class="classroom.idStateClassroom != 2 ? 'text-success' : 'text-danger'">{{classroom.nameStateClassroom}}</span></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- END EXAMPLE TABLE PORTLET-->
    </div>
</div>
