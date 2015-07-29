<%--
  Created by IntelliJ IDEA.
  User: Tapia Mujica Fernando
  Date: 27/07/15
  Time: 05:48 PM
--%>

<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <div class="alert alert-warning  margin-bottom-10" ng-show="structureList.length === 0">
            <strong>No hay examenes registrados</strong>
        </div>

        <div class="portlet light bordered" ng-hide="structureList.length === 0">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings font-purple-studio"></i>
                    <span class="caption-subject bold font-purple-studio uppercase">
                        Estructura de examenes</span>
                </div>
            </div>

            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center">
                                #
                            </th>
                            <th class="text-center">
                                Servicio Examen simulacro
                            </th>
                            <th class="text-center">
                                Nombre
                            </th>
                        </tr>
                        <tr>
                            <th></th>
                            <th class="text-center"><input type="text" ng-model="filtro.mockExamName"
                                                           placeholder="Filtrar por servicio"></th>
                            <th class="text-center"><input type="text" ng-model="filtro.name"
                                                           placeholder="Filtrar por nombre"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="structure in structureList | filter: filtro">
                            <td class="text-center">
                                {{$index + 1}}
                            </td>
                            <td class="text-center">
                                <a href="#/mockExam/show/{{structure.mockExam.id}}">{{structure.mockExamName}}</a>
                            </td>
                            <td class="text-center"><a href="#/structure/show/{{structure.id}}">
                                {{structure.name}}</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>