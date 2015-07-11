
<div class="row margin-top-10">
    <div class="col-md-12">

        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-globe"></i>Gestión de grupos
                </div>
            </div>

            <div class="portlet-body">
                <table class="table table-striped table-bordered table-hover" id="tabla">
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
                            <input type="text" ng-model="filtro.name" placeholder="Filtrar por nombre">
                        </th>
                        <th>
                            <input type="text" ng-model="filtro.lastName" placeholder="Filtrar por lugares">
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="classroom in classroomList|filter:filtro">
                            <td><a href="#/classroom/show/{{classroom.id}}">{{classroom.name}}</a></td>
                            <td><a href="#/classroom/show/{{classroom.id}}">{{classroom.lastName}}</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- END EXAMPLE TABLE PORTLET-->
    </div>
</div>
