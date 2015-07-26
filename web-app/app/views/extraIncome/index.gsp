<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 25/07/15
  Time: 09:56 PM
--%>

<div class="row">
    <div class="col-md-12 ">
        <div class="alert alert-warning  margin-bottom-10" ng-show="extraIncomeList.length === 0">
            <strong> No hay ingresos extra registrados </strong>
        </div>
        <div class="portlet light bordered" ng-hide="extraIncomeList.length === 0">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings font-purple-studio"></i>
                    <span class="caption-subject bold font-purple-studio uppercase">
                        Ingresos Extra</span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" >
                                #
                            </th>
                            <th class="text-center" >
                                Servicio Extra
                            </th>
                            <th class="text-center" >
                                Oficina
                            </th>
                            <th class="text-center" >
                                Fecha
                            </th>
                            <th class="text-center" >
                                Cantidad
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="course in extraIncomeList ">
                            <td class="text-center">
                                 {{$index + 1}} 
                            </td>
                            <td class="text-right">
                                 {{ getNameService( course.extraService.id ) }} 
                            </td>
                            <td class="text-right">
                                 {{ getNameOffice( course.office.id ) }} 
                            </td>
                            <td class="text-center">
                                 {{course.incomeDate}} 
                            </td>
                            <td class="text-right">
                                 {{course.income | currency: " $ " }} 
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>