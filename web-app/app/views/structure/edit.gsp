<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 25/07/15
  Time: 09:56 PM
--%>

<div class="row">
    <div class="col-md-8 col-md-offset-2 ">
        <div class="alert alert-warning  margin-bottom-10" ng-show="mockExamListList.length === 0">
            <strong>NO HAY EXÁMENES ACTIVOS, DEBE TENER AL MENOS UNO ACTIVO</strong>
        </div>

        <div class="portlet light bordered" ng-hide="mockExamListList.length === 0">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings "></i>
                    <span class="caption-subject bold uppercase">
                        Registrar Examen</span>
                </div>

            </div>

            <div class="portlet-body form">
                <form name="editExam" ng-submit="updateMockExam(editExam.$valid, $event)" novalidate
                      class="form-horizontal">
                    <div class="form-body">

                        <div class="form-group"
                             ng-class="{'has-error': varSlc == 0}">
                            <label class="control-label col-md-4">Servicio (examen): <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-8">
                                <div class="input-icon right">
                                    <i class="fa"></i>

                                    <select class="form-control" ng-model="varSlc">
                                        <option value="0">Seleccione</option>
                                        <option ng-repeat="mockExam in mockExamListList"
                                                value="{{mockExam.id}}">{{mockExam.name}}</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editExam.name.$error.required || validator.name.hasError}">
                            <label class="control-label col-md-4">Nombre: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-8">
                                <div class="input-icon left">
                                    <i class="fa fa-pencil-square-o"></i>
                                    <input type="text" ng-model="structureInstance.name" class="form-control"
                                           name="name"
                                           required/>
                                </div>
                                <span class="help-block"
                                      ng-show="editExam.name.$error.required || validator.name.hasError">
                                    {{validator.name.message}}
                                </span>
                            </div>
                        </div>


                        <div class="form-group"
                             ng-class="{'has-error': editExam.description.$error.required || validator.description.hasError}">
                            <label class="control-label col-md-4">Descripción: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-8">
                                <div class="input-icon left">
                                    <i class="fa fa-pencil-square-o"></i>
                                    <textarea ng-model="structureInstance.description" class="form-control"
                                              name="description"
                                              required></textarea>
                                </div>
                                <span class="help-block"
                                      ng-show="editExam.description.$error.required || validator.description.hasError">
                                    {{validator.description.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <button type="submit" class="btn green"
                                            ng-disabled="!(varSlc !=0) || editExam.$invalid || (!editExam.$dirty)">Guardar Examen</button>
                                    <a href="#/structure" type="button" class="btn default">Cancelar</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </form>
            </div>

            <div class="modal fade" id="model-confirm" tabindex="-1" role="basic" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title text-danger">Mensaje de alerta</h4>
                        </div>

                        <div class="modal-body ">
                            <b>{{errorName.message}}</b>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </div>
    </div>
</div>