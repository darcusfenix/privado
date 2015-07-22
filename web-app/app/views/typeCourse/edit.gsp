<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 16/07/15
  Time: 12:03 AM
--%>

<div class="row">
    <div class="col-md-8 col-md-offset-2 ">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings font-purple-studio"></i>
                    <span class="caption-subject bold font-purple-studio uppercase">
                        Actualizar datos del tipo de curso</span>
                </div>

            </div>

            <div class="portlet-body form">
                <form name="createTypeCourse" ng-submit="savetypeCourse(createTypeCourse.$valid, $event)" novalidate
                      class="form-horizontal">
                    <div class="form-body">

                        <div class="form-group"
                             ng-class="{'has-error': createTypeCourse.username.$error.required||validator.username.hasError}">
                            <label class="control-label col-md-3">
                                Nombre:
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="typeCourseInstance.name" class="form-control"
                                           name="username" required/>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="createTypeCourse.username.$error.required||validator.username.hasError">
                                {{validator.username.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': createTypeCourse.name.$error.required||validator.name.hasError}">
                            <label class="control-label col-md-3">Descripción: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <textarea ng-model="typeCourseInstance.description" class="form-control" name="name"
                                              required></textarea>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="createTypeCourse.name.$error.required||validator.name.hasError">
                                {{validator.name.message}}
                            </span>
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green"
                                        ng-disabled="createTypeCourse.$invalid">Guardar cambios</button>
                                <button type="button" class="btn default" ng-click="cancelar();">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>