<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 17/07/15
  Time: 10:59 PM
--%>

<div class="row">
    <div class="col-md-8 col-md-offset-2 ">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings "></i>
                    <span class="caption-subject bold uppercase">
                        Actualizar datos</span>
                </div>

            </div>

            <div class="portlet-body form">
                <form name="editMockExam" ng-submit="saveMockExam(editMockExam.$valid, $event)" novalidate
                      class="form-horizontal">
                    <div class="form-body">

                        <div class="form-group"
                             ng-class="{'has-error': editMockExam.typeService.$error.required||validator.typeService.hasError}">
                            <label class="control-label col-md-3">Tipo de servicio: <span class="required">
                                *</span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>

                                    <select ng-options=" typeService.id as typeService.name for typeService in typeServiceList"
                                            ng-model="mockExamInstance.typeService.id"
                                            name="mockExamInstance.typeService" required  class="form-control">
                                    </select>
                                </div>
                                <span class="help-block"
                                      ng-show="editMockExam.typeService.$error.required||validator.typeService.hasError">
                                    {{validator.typeService.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editMockExam.cost.$error.required || validator.cost.hasError}">
                            <label class="control-label col-md-3">Costo individual: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon left">
                                    <i class="fa fa-usd"></i>
                                    <input type="number" ng-model="mockExamInstance.cost" class="form-control" name="cost" min="1"
                                           required />
                                </div>
                                <span class="help-block"
                                      ng-show="editMockExam.cost.$error.required || validator.cost.hasError">
                                    {{validator.cost.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editmockExam.name.$error.required || validator.name.hasError}">
                            <label class="control-label col-md-3">Nombre: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input ng-model="mockExamInstance.name" class="form-control" name="name"
                                           required/>
                                </div>
                                <span class="help-block"
                                      ng-show="editmockExam.name.$error.required || validator.name.hasError">
                                    {{validator.term.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editmockExam.term.$error.required || validator.term.hasError}">
                            <label class="control-label col-md-3">Duración: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="number" ng-model="mockExamInstance.term" class="form-control" name="term" min="1" placeholder="Tiempo en minutos"
                                           required/>
                                </div>
                                <span class="help-block"
                                      ng-show="editmockExam.term.$error.required || validator.term.hasError">
                                    {{validator.term.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editMockExam.period.$error.required || validator.period.hasError}">
                            <label class="control-label col-md-3">Periodo: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input ng-model="mockExamInstance.period" class="form-control" name="period"
                                           required />
                                </div>
                                <span class="help-block"
                                      ng-show="editMockExam.period.$error.required || validator.period.hasError">
                                    {{validator.period.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editMockExam.active.$error.required || validator.active.hasError}">
                            <label class="control-label col-md-3">Estado: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <button type="button" class="btn"
                                            ng-class="mockExamInstance.active ? 'btn-success' : 'btn-danger' "
                                            ng-click="mockExamInstance.active = !mockExamInstance.active">
                                        {{ (mockExamInstance.active) ? 'Activo' : 'bloqueado'}}
                                    </button>
                                </div>
                                <span class="help-block"
                                      ng-show="editMockExam.active.$error.required || validator.active.hasError">
                                    {{validator.active.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editMockExam.stDate.$error.required || validator.stDate.hasError}">
                            <label class="control-label col-md-3">Fecha de inicio: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="mockExamInstance.stDate" data-date-start-date="+0d" required
                                           readonly placeholder="{{mockExamInstance.stDate | date :'yyyy / MM / dd' }}" name="stDate" size="14"
                                           class="form-control" id="stDate"/>
                                </div>
                                <span class="help-block"
                                      ng-show="editMockExam.stDate.$error.required||validator.stDate.hasError">
                                    {{validator.stDate.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editMockExam.endDate.$error.required||validator.endDate.hasError}">
                            <label class="control-label col-md-3">Fecha final: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="mockExamInstance.endDate" data-date-start-date="+0d" required
                                           readonly placeholder="{{mockExamInstance.endDate  | date:'MM/dd/yyyy' }}" name="endDate" size="14"
                                           class="form-control" id="endDate"/>
                                </div>
                                <span class="help-block"
                                      ng-show="editMockExam.endDate.$error.required||validator.endDate.hasError">
                                    {{validator.endDate.message}}
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green"
                                        ng-disabled="editMockExam.$invalid">Guardar cambios</button>
                                <a href="#/mockExam/show/{{mockExamInstance.id}}" type="button" class="btn default">Cancelar</a>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>