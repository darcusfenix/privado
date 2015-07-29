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
                                Fecha y Hora
                            </th>
                            <th class="text-center" >
                                Cantidad
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="course in extraIncomeList ">
                            <td class="text-center">
                                 <a href="#/extraIncome/show/{{course.id}}">{{$index + 1}} </a>
                            </td>
                            <td class="text-right">
                                <a href="#/extraIncome/show/{{course.id}}">{{ getNameService( course.extraService.id ) }}  </a>
                            </td>
                            <td class="text-right">
                                <a href="#/extraIncome/show/{{course.id}}">{{ getNameOffice( course.office.id ) }}  </a>
                            </td>
                            <td class="text-center">
                                <a href="#/extraIncome/show/{{course.id}}">{{course.incomeDate}}  </a>
                            </td>
                            <td class="text-right">
                                <a href="#/extraIncome/show/{{course.id}}">{{course.income | currency: " $ " }} </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>