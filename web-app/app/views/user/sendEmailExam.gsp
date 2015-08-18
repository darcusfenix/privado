<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 8/7/15
  Time: 4:00 PM
--%>


<div class="row">
    <div class="col-md-5">
        <div class="input-icon right">
            <i class="fa"></i>
            <select  ng-options=" classroom.id as classroom.nameClassroom for classroom in classRoomList"
                     ng-model="classroom"
                     required  class="form-control" ng-change="getStudentsByClassroom(classroom);">
                <option value="">Seleccione un grupo</option>
            </select>
        </div>
    </div>
    <div class="col-md-5">
        <div class="input-icon right">
            <i class="fa"></i>
            <button class="btn btn-warning" ng-click="sentoToAllStudents()" ng-show="studentList.length > 0"> Enviar a todos los del grupo</button>
        </div>
    </div>
</div>

<div class="row margin-top-10">
    <div class="col-md-12">

        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-globe"></i>Lista de los alumnos para enviar correo de invitación a examen
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
                                Grupo
                            </th>
                            <th>
                                Enviar
                            </th>
                            <th>
                                Enviar correo
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <input type="text" ng-model="filtro.name" placeholder="Filtrar por nombre" class="form-control">
                            </th>
                            <th>
                                <input type="text" ng-model="filtro.lastName" placeholder="Filtrar por Apellido" class="form-control">
                            </th>
                            <th>
                                <input type="text" ng-model="filtro.username"
                                       placeholder="Filtrar por nombre de suario" class="form-control">
                            </th>
                            <th>
                                <input type="text" ng-model="filtro.phoneNumber" placeholder="Filtrar por teléfono" class="form-control">
                            </th>
                            <th>
                                <input type="text" ng-model="filtro.group" placeholder="Filtrar por grupo" class="form-control">
                            </th>
                            <th>

                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="user in studentList|filter:filtro">
                            <td><a href="#/user/show/{{user.id}}">{{user.name}}</a></td>
                            <td><a href="#/user/show/{{user.id}}">{{user.lastName}}</a></td>
                            <td><a href="#/user/show/{{user.id}}">{{user.username}}</a></td>
                            <td><a href="#/user/show/{{user.id}}">{{user.phoneNumber}}</a></td>
                            <td><a href="#/user/show/{{user.id}}">{{user.group.nameClassroom}}</a></td>
                            <td>
                                <button class="btn btn-primary" ng-click="sendEmailExam(user.id)">Enviar</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- END EXAMPLE TABLE PORTLET-->
    </div>
</div>
