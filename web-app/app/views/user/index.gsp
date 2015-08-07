<div class="row margin-top-10">
    <div class="col-md-12">

        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-globe"></i>Lista de los alumnos
                </div>
            </div>

            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover table-responsive table-scrollable"
                           id="tabla">
                        <thead>
                        <tr>
                            <th>
                                Nombre
                            </th>
                            <th>
                                Apellido
                            </th>
                            <th>
                                Username
                            </th>
                            <th>
                                Teléfono
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
                                <input type="text" ng-model="filtro.username"
                                       placeholder="Filtrar por nombre de suario">
                            </th>
                            <th>
                                <input type="text" ng-model="filtro.phoneNumber" placeholder="Filtrar por teléfono">
                            </th>
                            <th>
                                <input type="text" ng-model="filtro.group" placeholder="Filtrar por grupo">
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="user in userList|filter:filtro">
                            <td><a href="#/user/show/{{user.id}}">{{user.name}}</a></td>
                            <td><a href="#/user/show/{{user.id}}">{{user.lastName}}</a></td>
                            <td><a href="#/user/show/{{user.id}}">{{user.username}}</a></td>
                            <td><a href="#/user/show/{{user.id}}">{{user.phoneNumber}}</a></td>
                            <td><a href="#/user/show/{{user.id}}">{{user.group.nameClassroom}}</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- END EXAMPLE TABLE PORTLET-->
    </div>
</div>
