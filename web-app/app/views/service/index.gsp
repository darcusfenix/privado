<div class="row">
    <div class="col-md-12 ">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings font-purple-studio"></i>
                    <span class="caption-subject bold font-purple-studio uppercase">
                        Servicios</span>
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
                            <th>
                                Nombre
                            </th>
                            <th>
                                Descripción
                            </th>
                            <th>

                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="typeService in typesServiceList ">
                            <td class="text-center">
                                <a href="#/type-service/show/{{typeService.id}}"> {{$index + 1}} </a>
                            </td>
                            <td>
                                <a href="#/type-service/show/{{typeService.id}}"> {{typeService.name}} </a>
                            </td>
                            <td>
                                <a href="#/type-service/show/{{typeService.id}}"> {{typeService.description}} </a>
                            </td>
                            <td class="text-center">
                                <a href="#/type-service/show/{{typeService.id}}" class="btn btn-primary btn-sm uppercase"> Ver </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
