<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 8/07/15
  Time: 09:17 PM
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
                    <i class="fa fa-globe"></i>Alumnos del grupo <b>{{classRoomNameCurrent}}</b>
                </div>
            </div>

            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover table-responsive" id="tabla">
                        <thead>
                        <tr>
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
                                Total requerido
                            </th>
                            <th class="text-center">
                                Cantidad pagada
                            </th>
                            <th class="text-center">
                                Ingresar cantidad
                            </th>
                            <th class="text-center">
                                Confirmar pago único
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
                                <input type="text" ng-model="filtro.email" placeholder="Filtrar por correo electrónico">
                            </th>
                            <th>

                            </th>
                            <th>

                            </th>
                            <th>

                            </th>
                            <th>

                            </th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr ng-repeat="user in studentList | filter:filtro" ng-if="user.totalRequired !== 0">
                            <td><a href="#/voucherPayment/student/{{user.id}}" target="_blank">{{user.name}}</a></td>
                            <td><a href="#/voucherPayment/student/{{user.id}}" target="_blank">{{user.lastName}}</a></td>
                            <td><a href="#/voucherPayment/student/{{user.id}}" target="_blank">{{user.email}}</a></td>

                            <td class="text-right">
                                {{user.totalRequired | currency:" $ " }}
                            </td>
                            <td class="text-right">
                                {{user.totalPaid | currency:" $ " }}
                            </td>
                            <td class="text-center" >
                                <div class="input-icon text-left" ng-show="user.totalPaid <  user.totalRequired">

                                    <i class="fa fa-usd"></i>

                                    <input type="number" class="form-control" placeholder="Cantidad"
                                           ng-model="user.voucherPayment.pay" min="1.0" max="{{user.totalRequired}}" style="width: 200px;">
                                </div>
                                <span class="text-success uppercase"
                                      ng-show="user.totalPaid >=  user.totalRequired">pagado</span>
                            </td>
                            <td class="text-center">
                                <button ng-disabled="user.voucherPayment.pay <= 0" class="btn btn-primary uppercase"
                                        ng-click="saveSingleVoucherPayment(user.voucherPayment.pay, user.id); "
                                        ng-show="user.totalPaid <  user.totalRequired">Ingresar</button>
                                <span class="text-success uppercase"
                                      ng-show="user.totalPaid >=  user.totalRequired">pagado</span>
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
