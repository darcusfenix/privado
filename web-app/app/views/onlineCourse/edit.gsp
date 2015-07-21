<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 17/07/15
  Time: 09:33 PM
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
                <form name="editOnlineCourse" ng-submit="saveOnlineCourse(editOnlineCourse.$valid, $event)" novalidate
                      class="form-horizontal">
                    <div class="form-body">

                        <div class="form-group"
                             ng-class="{'has-error': editOnlineCourse.typeService.$error.required||validator.typeService.hasError}">
                            <label class="control-label col-md-3">Tipo de servicio: <span class="required">
                                *</span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>

                                    <select ng-options=" typeService.id as typeService.name for typeService in typeServiceList"
                                            ng-model="onlineCourseInstance.typeService.id"
                                            name="onlineCourseInstance.typeService" required  class="form-control">
                                    </select>
                                </div>
                                <span class="help-block"
                                      ng-show="editOnlineCourse.typeService.$error.required||validator.typeService.hasError">
                                    {{validator.typeService.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editOnlineCourse.cost.$error.required || validator.cost.hasError}">
                            <label class="control-label col-md-3">Costo individual: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon left">
                                    <i class="fa fa-usd"></i>
                                    <input type="number" ng-model="onlineCourseInstance.cost" class="form-control" name="cost"
                                           required />
                                </div>
                                <span class="help-block"
                                      ng-show="editOnlineCourse.cost.$error.required || validator.cost.hasError">
                                    {{validator.cost.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editOnlineCourse.period.$error.required || validator.period.hasError}">
                            <label class="control-label col-md-3">Periodo: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input ng-model="onlineCourseInstance.period" class="form-control" name="period"
                                           required />
                                </div>
                                <span class="help-block"
                                      ng-show="editOnlineCourse.period.$error.required || validator.period.hasError">
                                    {{validator.period.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editOnlineCourse.active.$error.required || validator.active.hasError}">
                            <label class="control-label col-md-3">Estado: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <button type="button" class="btn"
                                            ng-class="onlineCourseInstance.active ? 'btn-success' : 'btn-danger' "
                                            ng-click="onlineCourseInstance.active = !onlineCourseInstance.active">
                                        {{ (onlineCourseInstance.active) ? 'Activo' : 'bloqueado'}}
                                    </button>
                                </div>
                                <span class="help-block"
                                      ng-show="editOnlineCourse.active.$error.required || validator.active.hasError">
                                    {{validator.active.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editOnlineCourse.stDate.$error.required || validator.stDate.hasError}">
                            <label class="control-label col-md-3">Fecha de inicio: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="onlineCourseInstance.stDate" data-date-start-date="+0d" required
                                           readonly placeholder="{{onlineCourseInstance.stDate | date :'yyyy / MM / dd' }}" name="stDate" size="14"
                                           class="form-control" id="stDate"/>
                                </div>
                                <span class="help-block"
                                      ng-show="editOnlineCourse.stDate.$error.required||validator.stDate.hasError">
                                    {{validator.stDate.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editOnlineCourse.endDate.$error.required||validator.endDate.hasError}">
                            <label class="control-label col-md-3">Fecha final: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="onlineCourseInstance.endDate" data-date-start-date="+0d" required
                                           readonly placeholder="{{onlineCourseInstance.endDate  | date:'MM/dd/yyyy' }}" name="endDate" size="14"
                                           class="form-control" id="endDate"/>
                                </div>
                                <span class="help-block"
                                      ng-show="editOnlineCourse.endDate.$error.required||validator.endDate.hasError">
                                    {{validator.endDate.message}}
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green"
                                        ng-disabled="editOnlineCourse.$invalid">Guardar cambios</button>
                                <a href="#/onlineCourse/show/{{onlineCourseInstance.id}}" type="button" class="btn default">Cancelar</a>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>