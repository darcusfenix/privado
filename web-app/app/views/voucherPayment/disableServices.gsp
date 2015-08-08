<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 8/08/15
  Time: 10:36 AM
--%>

<div class="row">
    <div class="col-md-5 col-md-offset-3 ">

        <div class="portlet light bordered" ng-hide="extraServiceList.length === 0">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings font-purple-studio"></i>
                    <span class="caption-subject bold font-purple-studio uppercase">
                        Cancelación de servicios a alumnos</span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" >
                                Servicio
                            </th>
                            <th class="text-center" >
                                Periodo
                            </th>
                            <th class="text-center" >

                            </th>

                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="service in servicesList ">
                            <td class="text-center">
                                {{getNameService (service.typeService.id) }}
                            </td>
                            <td class="text-center">
                                {{service.period }}
                            </td>
                            <td class="text-center">
                                <button class="btn btn-warning" ng-click="disableService(service.id);">Deshabilitar servicios</button>
                            </td>

                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>