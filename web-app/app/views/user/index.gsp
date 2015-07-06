<div class="row margin-top-10">
    <div class="col-md-12">
        <a href="#/user/create" class="btn btn-info">Crear Usuario</a>
    </div>
</div>

<div class="row margin-top-10">
    <div class="col-md-12">
        <!-- BEGIN EXAMPLE TABLE PORTLET-->

        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-globe"></i>Lista de los alumnos
                </div>

                <div class="tools">
                    <a href="javascript:;" class="reload">
                    </a>
                    <a href="javascript:;" class="remove">
                    </a>
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
                            Apellido
                        </th>
                        <th>
                            Username
                        </th>
                        <th>
                            Teléfono
                        </th>
                    </tr>
                    </thead>
                    <tbody">
                    <tr ng-repeat="user in userList">
                        <td><a href="#/user/show/{{user.id}}">{{user.name}}</a></td>
                        <td><a href="#/user/show/{{user.id}}">{{user.lastName}}</a></td>
                        <td><a href="#/user/show/{{user.id}}">{{user.username}}</a></td>
                        <td><a href="#/user/show/{{user.id}}">{{user.phoneNumber}}</a></td>
                    </tr>
                </tbody>
                </table>
            </div>
        </div>
        <!-- END EXAMPLE TABLE PORTLET-->
    </div>
</div>
