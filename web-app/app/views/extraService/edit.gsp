<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 20/07/15
  Time: 10:06 PM
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
                <form name="editExtraService" ng-submit="saveExtraService(editExtraService.$valid, $event)" novalidate
                      class="form-horizontal">
                    <div class="form-body">

                        <div class="form-group"
                             ng-class="{'has-error': editExtraService.typeService.$error.required||validator.typeService.hasError}">
                            <label class="control-label col-md-3">Tipo de servicio: <span class="required">
                                *</span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>

                                    <select ng-options=" typeService.id as typeService.name for typeService in typeServiceList"
                                            ng-model="extraServiceInstance.typeService.id"
                                            name="extraServiceInstance.typeService" required  class="form-control">
                                    </select>
                                </div>
                                <span class="help-block"
                                      ng-show="editExtraService.typeService.$error.required||validator.typeService.hasError">
                                    {{validator.typeService.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editExtraService.description.$error.required || validator.description.hasError}">
                            <label class="control-label col-md-3">Descripción: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input ng-model="extraServiceInstance.description" class="form-control" name="description"
                                           required />
                                </div>
                                <span class="help-block"
                                      ng-show="editExtraService.description.$error.required || validator.description.hasError">
                                    {{validator.description.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editExtraService.cost.$error.required || validator.cost.hasError}">
                            <label class="control-label col-md-3">Costo individual: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon left">
                                    <i class="fa fa-usd"></i>
                                    <input type="number" ng-model="extraServiceInstance.cost" class="form-control" name="cost" min="1"
                                           required />
                                </div>
                                <span class="help-block"
                                      ng-show="editExtraService.cost.$error.required || validator.cost.hasError">
                                    {{validator.cost.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editExtraService.period.$error.required || validator.period.hasError}">
                            <label class="control-label col-md-3">Periodo: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input ng-model="extraServiceInstance.period" class="form-control" name="period" placeholder="ejemplo: 2015-05"
                                           required />
                                </div>
                                <span class="help-block"
                                      ng-show="editExtraService.period.$error.required || validator.period.hasError">
                                    {{validator.period.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editExtraService.active.$error.required || validator.active.hasError}">
                            <label class="control-label col-md-3">Estado: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <button type="button" class="btn"
                                            ng-class="extraServiceInstance.active ? 'btn-success' : 'btn-danger' "
                                            ng-click="extraServiceInstance.active = !extraServiceInstance.active">
                                        {{ (extraServiceInstance.active) ? 'Activo' : 'bloqueado'}}
                                    </button>
                                </div>
                                <span class="help-block"
                                      ng-show="editExtraService.active.$error.required || validator.active.hasError">
                                    {{validator.active.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editExtraService.stDate.$error.required || validator.stDate.hasError}">
                            <label class="control-label col-md-3">Fecha de inicio: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="extraServiceInstance.stDate" data-date-start-date="+0d" required
                                           readonly placeholder="{{extraServiceInstance.stDate | date :'yyyy / MM / dd' }}" name="stDate" size="14"
                                           class="form-control" id="stDate"/>
                                </div>
                                <span class="help-block"
                                      ng-show="editExtraService.stDate.$error.required||validator.stDate.hasError">
                                    {{validator.stDate.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editExtraService.endDate.$error.required||validator.endDate.hasError}">
                            <label class="control-label col-md-3">Fecha final: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="extraServiceInstance.endDate" data-date-start-date="+0d" required
                                           readonly placeholder="{{extraServiceInstance.endDate  | date:'MM/dd/yyyy' }}" name="endDate" size="14"
                                           class="form-control" id="endDate"/>
                                </div>
                                <span class="help-block"
                                      ng-show="editExtraService.endDate.$error.required||validator.endDate.hasError">
                                    {{validator.endDate.message}}
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green"
                                        ng-disabled="editExtraService.$invalid">Guardar cambios</button>
                                <a href="#/extraService/show/{{extraServiceInstance.id}}" type="button" class="btn default">Cancelar</a>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>