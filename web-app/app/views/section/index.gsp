<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 28/07/15
  Time: 08:57 PM
--%>

<div class="row">
    <div class="col-md-12 ">
        <div class="alert alert-warning  margin-bottom-10" ng-show="sectionList.length === 0">
            <strong> No hay secciones registrados </strong>
        </div>
        <div class="portlet light bordered" ng-hide="sectionList.length === 0">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings "></i>
                    <span class="caption-subject bold  uppercase">
                        Secciones para exámenes</span>
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
                                Nombre
                            </th>
                            <th class="text-center" >
                                Descripción
                            </th>
                            <th class="text-center" >
                                # Preguntas Asociadas
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="section in sectionList ">
                            <td class="text-center">
                                <a href="#/section/show/{{section.id}}">{{$index + 1}} </a>
                            </td>
                            <td class="text-right">
                                <a href="#/section/show/{{section.id}}">{{ section.name }}  </a>
                            </td>
                            <td class="text-right">
                                <a href="#/section/show/{{section.id}}">{{ section.description }}  </a>
                            </td>
                            <td class="text-center">
                                <a href="#/section/show/{{section.id}}">{{ section.question.length }}  </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>