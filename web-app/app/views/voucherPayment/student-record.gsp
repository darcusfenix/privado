<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 12/07/15
  Time: 06:26 PM
--%>


<div class="row">
    <div class="margin-top-10 text-right">
        <button class="btn btn-success margin-top-10 margin-bottom-10" onclick="window.history.back();"><i
                class="fa fa-arrow-left"></i> Regresar</button>
    </div>
    <div class="col-md-6 col-sm-12">
        <div class="portlet yellow-crusta box">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-cogs"></i>Información del Alumno
                </div>
            </div>
            <div class="portlet-body">
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Nombre:
                    </div>
                    <div class="col-md-7 value">
                        {{user.name}}
                    </div>
                </div>
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Apellidos:
                    </div>
                    <div class="col-md-7 value">
                        {{user.lastName}}
                    </div>
                </div>
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Dirección:
                    </div>
                    <div class="col-md-7 value">
                        {{user.address}}
                    </div>
                </div>
                <div class="row static-info" ng-show="user.socialNetworkUrl">
                    <div class="col-md-5 name">
                        Social:
                    </div>
                    <div class="col-md-7 value">
                        {{user.socialNetworkUrl}}
                    </div>
                </div>
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Correo Electrónico:
                    </div>
                    <div class="col-md-7 value">
                        {{user.email}}
                    </div>
                </div>
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Teléfono:
                    </div>
                    <div class="col-md-7 value">
                        {{user.phoneNumber}}
                    </div>
                </div>
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Celular:
                    </div>
                    <div class="col-md-7 value">
                        {{user.mobileNumber}}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-sm-12">
        <div class="portlet blue-hoki box">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-cogs"></i>Información del Servicio
                </div>
            </div>
            <div class="portlet-body">
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Tipo:
                    </div>
                    <div class="col-md-7 value">
                        {{getNameService(service.id)}}
                    </div>
                </div>
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Periodo:
                    </div>
                    <div class="col-md-7 value">
                        {{service.period}}
                    </div>
                </div>
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Fecha de inicio:
                    </div>
                    <div class="col-md-7 value">
                        {{service.stDate}}
                    </div>
                </div>
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Fecha de termino:
                    </div>
                    <div class="col-md-7 value">
                        {{service.endDate}}
                    </div>
                </div>
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Descripción:
                    </div>
                    <div class="col-md-7 value">
                        {{getNameServiceDescription(service.id)}}
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


<div class="row margin-top-10">

    <div class="col-md-6 col-sm-12">

        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-globe"></i>Historial de pagos
                </div>
            </div>

            <div class="portlet-body">
                <table class="table table-striped table-bordered table-hover" id="tabla">
                    <thead>
                    <tr>
                        <th class="text-center">
                            Monto
                        </th>
                        <th class="text-center">
                            Fecha de pago
                        </th>
                        <th class="text-center">
                            Estado
                        </th>

                    </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="voucherPayemnt in recordVoucherPayment">
                            <td class="text-center">
                                {{voucherPayemnt.pay | currency:" $ " }}
                            </td>
                            <td class="text-center">
                                {{voucherPayemnt.payDate}}
                            </td>
                            <td class="text-center">
                                <span ng-class=" (voucherPayemnt.stateVoucher.id === 2) ? 'text-success' : 'text-danger'"> {{ (voucherPayemnt.stateVoucher.id === 2) ? 'Aprobado' : 'Pendiente'}} </span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- END EXAMPLE TABLE PORTLET-->
    </div>
</div>