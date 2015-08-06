<%--
  Created by IntelliJ IDEA.
  User: fernandotapia
  Date: 7/21/15
  Time: 11:02 AM
--%>

<div class="text-right">
    <button class="btn blue margin-top-10 margin-bottom-10" onclick="window.history.back();"><i
            class="fa fa-arrow-left"></i> Regresar</button>
</div>

<div class="alert alert-danger" ng-show="messageStructure">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
    <strong>{{message}}</strong> </a>
</div>

<div class="row margin-top-10">
    <div class="col-md-10 col-md-offset-1">

        <div class="portlet box green-haze">
            <div class="portlet-title">
                 <div class="caption">
                 Examen del servicio "{{structureInstance.mockExamName}}"
                </div>
        </div>

        <div class="portlet-body">
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1_1">
                    <h3 class="form form-section">Información base<hr/></h3>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">Nombre del examen:
                    </label>
                    <b>{{structureInstance.name}}</b>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">Descripción del examen:
                    </label>
                    <b>{{structureInstance.description}}</b>
                </div>
                <br/>
                <div class="tab-pane active" id="tab_1_2">
                    <h3 class="form form-section">Secciones asociadas<hr/></h3>
                </div>
                <div class="table-responsive col-md-10 col-md-offset-1">
                    <div class="form-group text-center">
                        <button class="btn btn-default" ng-disabled="varSection" ng-click="addSections();">Asociar secciones</button>
                    </div>
                    <div class="text-success text-center" ng-show="messagesSectionList">
                        <strong>{{messagesSectionList}}</strong>
                    </div>
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" >
                                #
                            </th>
                            <th class="text-center" >
                                Nombre
                            </th>
                            <th class="text-center container" >
                                Descripción
                            </th>
                            <th class="text-center">Asociación</th>
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
                            <td class="text-center"><input ng-click="clickSection();" type="checkbox" id="{{section.id}}" value="{{section.id}}" name="chkSection"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <br/>
                <div class="form-group text-center">
                    <button class="btn btn-default" ng-click="editStructure();">Editar datos</button>
                    <button class="btn btn-danger" data-toggle="modal" href="#model-confirm">Eliminar</button>
                </div>
            </div>
        </div>
        </div>

        <div class="modal fade" id="model-confirm" tabindex="-1" role="basic" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title text-danger">Mensaje de confirmación</h4>
                    </div>
                    <div class="modal-body ">
                        <b>¿Está seguro que desea elimnar el examen '{{structureInstance.name}}'?</b>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="deleteStructure();">Eliminar</button>
                    </div>
                </div>
    <!-- /.modal-content -->
            </div>
<!-- /.modal-dialog -->
        </div>
    </div>
</div>

