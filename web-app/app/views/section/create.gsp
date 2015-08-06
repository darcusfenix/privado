<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 28/07/15
  Time: 08:57 PM
--%>

<div class="row">
    <div class="col-md-8 col-md-offset-2 ">

        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings "></i>
                    <span class="caption-subject bold uppercase">
                        Agregar nueva sección</span>
                </div>

            </div>

            <div class="portlet-body form">
                <form name="editSection" ng-submit="saveSection(editSection.$valid, $event)" novalidate
                      class="form-horizontal">
                    <div class="form-body">


                        <div class="form-group"
                             ng-class="{'has-error': editSection.name.$error.required || validator.name.hasError}">
                            <label class="control-label col-md-3">Nombre: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="left">
                                    <input type="text" ng-model="sectionInstance.name" class="form-control" name="name" min="1"
                                           required />
                                </div>
                                <span class="help-block"
                                      ng-show="editSection.name.$error.required || validator.name.hasError">
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editSection.description.$error.required || validator.description.hasError}">
                            <label class="control-label col-md-3">Descripción: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="left">
                                    <textarea ng-model="sectionInstance.description" class="form-control" name="description"
                                              required ></textarea>
                                </div>
                                <span class="help-block"
                                      ng-show="editSection.description.$error.required || validator.description.hasError">
                                </span>
                            </div>
                        </div>


                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green"
                                        ng-disabled="editSection.$invalid">Registrar sección</button>
                                <a href="#/section" type="button" class="btn default">Cancelar</a>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>