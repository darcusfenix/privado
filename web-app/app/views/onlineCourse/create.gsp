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
                        Crear curso online</span>
                </div>

            </div>

            <div class="portlet-body form">
                <form name="editonlineCourse" ng-submit="saveOnlineCourse(editonlineCourse.$valid, $event)"
                      novalidate
                      class="form-horizontal">
                    <div class="form-body">

                        <div class="form-group"
                             ng-class="{'has-error': editonlineCourse.typeService.$error.required||validator.typeService.hasError}">
                            <label class="control-label col-md-3">Tipo de servicio: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>

                                    <select ng-options=" typeService.id as typeService.name for typeService in typeServiceList"
                                            ng-model="onlineCourseInstance.typeService.id"
                                            name="onlineCourseInstance.typeService" required class="form-control">
                                    </select>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editonlineCourse.typeService.$error.required||validator.typeService.hasError">
                                {{validator.typeService.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editonlineCourse.cost.$error.required || validator.cost.hasError}">
                            <label class="control-label col-md-3">Costo individual: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon left">
                                    <i class="fa fa-usd"></i>
                                    <input ng-model="onlineCourseInstance.cost" class="form-control" name="cost" type="number" min="1"
                                           required/>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editonlineCourse.cost.$error.required || validator.cost.hasError">
                                {{validator.cost.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editonlineCourse.period.$error.required || validator.period.hasError}">
                            <label class="control-label col-md-3">Periodo: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input ng-model="onlineCourseInstance.period" class="form-control" name="period"
                                           required/>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editonlineCourse.period.$error.required || validator.period.hasError">
                                {{validator.period.message}}
                            </span>
                        </div>



                        <div class="form-group"
                             ng-class="{'has-error': editonlineCourse.active.$error.required || validator.active.hasError}">
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
                            </div>
                            <span class="help-block"
                                  ng-show="editonlineCourse.active.$error.required || validator.active.hasError">
                                {{validator.active.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editonlineCourse.stDate.$error.required || validator.stDate.hasError}">
                            <label class="control-label col-md-3">Fecha de inicio: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="onlineCourseInstance.stDate"
                                           data-date-start-date="+0d"
                                           readonly placeholder="{{onlineCourseInstance.stDate}}" name="stDate"
                                           size="14"
                                           class="form-control" id="stDate"/>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editonlineCourse.stDate.$error.required||validator.stDate.hasError">
                                {{validator.stDate.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editonlineCourse.endDate.$error.required||validator.endDate.hasError}">
                            <label class="control-label col-md-3">Fecha final: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="onlineCourseInstance.endDate"
                                           data-date-start-date="+0d"
                                           readonly placeholder="{{onlineCourseInstance.endDate}}" name="endDate"
                                           size="14"
                                           class="form-control" id="endDate"/>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editonlineCourse.endDate.$error.required||validator.endDate.hasError">
                                {{validator.endDate.message}}
                            </span>
                        </div>

                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green"
                                        ng-disabled="editonlineCourse.$invalid">Crear cambios</button>
                                <a href="#/onlineCourse" type="button"
                                   class="btn default">Cancelar</a>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>