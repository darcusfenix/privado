
<div class="row margin-top-10">
    <div class="col-md-12">

        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-globe"></i>Relacionar alumnos
                </div>
            </div>

            <div class="portlet-body table-responsive table-scrollable">
                <table class="table table-striped table-bordered table-hover " id="tabla">
                    <thead>
                    <tr>
                        <th>
                            Nombre
                        </th>
                        <th>
                            Apellidos
                        </th>
                        <th>
                            Nombre en facebook
                        </th>
                        <th>
                            Grupo
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <input type="text" ng-model="filtro.name" placeholder="Filtrar por nombre">
                        </th>
                        <th>
                            <input type="text" ng-model="filtro.lastName" placeholder="Filtrar por Apellido">
                        </th>
                        <th>
                            <input type="text" ng-model="filtro.username" placeholder="Filtrar por nombre de usuario">
                        </th>
                        <th>
                            <input type="text" ng-model="filtro.group" placeholder="Filtrar por Grupo">
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="user in userList|filter:filtro">
                        <td><a href="#/inductionClass/userInductionClass/{{user.id}}">{{user.name}}</a></td>
                        <td><a href="#/inductionClass/userInductionClass/{{user.id}}">{{user.lastName}}</a></td>
                        <td><a href="#/inductionClass/userInductionClass/{{user.id}}">{{user.username}}</a></td>
                        <td><a href="#/inductionClass/userInductionClass/{{user.id}}">{{user.group.nameClassroom}}</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- END EXAMPLE TABLE PORTLET-->
    </div>
</div>
