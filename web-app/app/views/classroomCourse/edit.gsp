<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 17/07/15
  Time: 01:00 AM
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
                <form name="editClassroomCourse" ng-submit="saveClassroomCourse(editClassroomCourse.$valid, $event)" novalidate
                      class="form-horizontal">
                    <div class="form-body">

                        <div class="form-group"
                             ng-class="{'has-error': editClassroomCourse.typeService.$error.required||validator.typeService.hasError}">
                            <label class="control-label col-md-3">Tipo de servicio: <span class="required">
                                *</span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>

                                    <select ng-options=" typeService.id as typeService.name for typeService in typeServiceList"
                                            ng-model="classroomCourseInstance.typeService.id"
                                            name="classroomCourseInstance.typeService" required  class="form-control">
                                    </select>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editClassroomCourse.typeService.$error.required||validator.typeService.hasError">
                                {{validator.typeService.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editClassroomCourse.cost.$error.required || validator.cost.hasError}">
                            <label class="control-label col-md-3">Costo individual: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon left">
                                    <i class="fa fa-usd"></i>
                                    <input ng-model="classroomCourseInstance.cost" class="form-control" name="cost"
                                              required />
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editClassroomCourse.cost.$error.required || validator.cost.hasError">
                                {{validator.cost.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editClassroomCourse.period.$error.required || validator.period.hasError}">
                            <label class="control-label col-md-3">Periodo: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input ng-model="classroomCourseInstance.period" class="form-control" name="period"
                                              required />
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editClassroomCourse.period.$error.required || validator.period.hasError">
                                {{validator.period.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editClassroomCourse.active.$error.required || validator.active.hasError}">
                            <label class="control-label col-md-3">Estado: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <button type="button" class="btn"
                                            ng-class="classroomCourseInstance.active ? 'btn-success' : 'btn-danger' "
                                            ng-click="classroomCourseInstance.active = !classroomCourseInstance.active">
                                        {{ (classroomCourseInstance.active) ? 'Activo' : 'bloqueado'}}
                                    </button>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editClassroomCourse.active.$error.required || validator.active.hasError">
                                {{validator.active.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editClassroomCourse.stDate.$error.required || validator.stDate.hasError}">
                            <label class="control-label col-md-3">Fecha de inicio: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="classroomCourseInstance.stDate" data-date-start-date="+0d"
                                           readonly placeholder="{{classroomCourseInstance.stDate | date :'yyyy / MM / dd' }}" name="stDate" size="14"
                                           class="form-control" id="stDate"/>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editClassroomCourse.stDate.$error.required||validator.stDate.hasError">
                                {{validator.stDate.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editClassroomCourse.endDate.$error.required||validator.endDate.hasError}">
                            <label class="control-label col-md-3">Fecha final: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="classroomCourseInstance.endDate" data-date-start-date="+0d"
                                           readonly placeholder="{{classroomCourseInstance.endDate  | date:'MM/dd/yyyy' }}" name="endDate" size="14"
                                           class="form-control" id="endDate"/>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editClassroomCourse.endDate.$error.required||validator.endDate.hasError">
                                {{validator.endDate.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editClassroomCourse.numberClasses.$error.required||validator.numberClasses.hasError}">
                            <label class="control-label col-md-3">Número de Clases: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input ng-model="classroomCourseInstance.numberClasses" class="form-control" name="numberClasses"
                                              required />
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editClassroomCourse.numberClasses.$error.required||validator.numberClasses.hasError">
                                {{validator.numberClasses.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editClassroomCourse.typeCourse.$error.required||validator.typeCourse.hasError}">
                            <label class="control-label col-md-3">Tipo de curso: <span class="required">
                                *</span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>

                                    <select ng-options=" typeCourse.id as typeCourse.name for typeCourse in typeCourseList"
                                            ng-model="classroomCourseInstance.typeCourse.id" name="classroomCourseInstance.typeCourse" required  class="form-control">
                                    </select>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editClassroomCourse.typeCourse.$error.required||validator.typeCourse.hasError">
                                {{validator.typeCourse.message}}
                            </span>
                        </div>

                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green"
                                        ng-disabled="editClassroomCourse.$invalid">Guardar cambios</button>
                                <a href="#/classroomCourse/show/{{classroomCourseInstance.id}}" type="button" class="btn default">Cancelar</a>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>