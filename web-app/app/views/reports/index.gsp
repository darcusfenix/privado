<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 9/08/15
  Time: 10:42 PM
--%>
<div class="row margin-top-10">
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat2">
            <div class="display">
                <div class="number">
                    <h3 class="font-green-sharp">{{studentList ? studentList.length : 0}}</h3>
                    <small>Alumnos inscritos con pago</small>
                </div>
                <div class="icon">
                    <i class="icon-pie-chart"></i>
                </div>
            </div>
        </div>
    </div>
</div>
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
</div>
<div class="row margin-top-10">
    <div class="col-md-12">
        <div class="alert {{ (message.type == 1 ) ? 'alert-success': 'alert-danger' }}  margin-bottom-10"
             ng-show="message.show">
            <strong>{{message.text}}</strong>
        </div>
        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-globe"></i>Alumnos del grupo <b>{{classRoomNameCurrent}}</b> que han realizado su pago
                </div>
            </div>

            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover table-responsive" id="tabla">
                        <thead>
                        <tr>
                            <th class="text-center">
                                #
                            </th>
                            <th class="text-center">
                                Nombre
                            </th>
                            <th class="text-center">
                                Apellido
                            </th>
                            <th class="text-center">
                                Correo Electrónico
                            </th>
                            <th class="text-center">
                                Total Pagado
                            </th>
                        </tr>
                        <tr>
                            <th>

                            </th>
                            <th>
                                <input type="text" ng-model="filtro.name" placeholder="Filtrar por nombre">
                            </th>
                            <th>
                                <input type="text" ng-model="filtro.lastName" placeholder="Filtrar por Apellido">
                            </th>
                            <th>
                                <input type="text" ng-model="filtro.email" placeholder="Filtrar por correo electrónico">
                            </th>
                            <th>

                            </th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr ng-repeat="user in studentList | filter:filtro" ng-if="user.totalRequired !== 0">
                            <td class="text-center">
                                {{$index + 1}}
                            </td>
                            <td><a href="#/voucherPayment/student/{{user.id}}" target="_blank">{{user.name}}</a></td>
                            <td><a href="#/voucherPayment/student/{{user.id}}" target="_blank">{{user.lastName}}</a></td>
                            <td><a href="#/voucherPayment/student/{{user.id}}" target="_blank">{{user.email}}</a></td>
                            <td class="text-right">
                                {{user.totalPaid | currency:" $ " }}
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