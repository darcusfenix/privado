<%--
  Created by IntelliJ IDEA.
  User: fernandotapia
  Date: 7/18/15
  Time: 12:47 PM
--%>
<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <!-- BEGIN VALIDATION STATES-->
        <div class="portlet box green">
            <div class="portlet-title">
                <div class="caption">
                    Crear clase de inducción
                </div>
            </div>

            <div class="portlet-body form">
                <form name="createInductionClass" class="form-horizontal"
                      ng-submit="saveInductionClass(createInductionClass.$valid, $event)" novalidate>
                    <div class="form-body">

                        <div class="form-group" ng-class="{'has-error': varSlc == 0}">
                            <label class="control-label col-md-3"><span class="required">
                                *</span> Sucursal:
                            </label>

                            <div class="col-md-6">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <select class="form-control input-medium" ng-model="varSlc">
                                        <option value="0">Seleccione</option>
                                        <option ng-repeat="office in officeList"
                                                value="{{office.id}}">{{office.name}}</option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="form-group"
                             ng-class="{'has-error': createInductionClass.name.$error.required||validator.name.hasError}">
                            <label class="control-label col-md-3"><span class="required">
                                *</span> Nombre de la clase de inducción:
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="inductionClassInstance.name" class="form-control"
                                           name="name" required placeholder="Nombre"/>
                                </div>
                            </div>

                            <p class="help-block"
                               ng-show="createInductionClass.name.$error.required||validator.name.hasError">
                                {{validator.name.message}}
                            </p>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': createInductionClass.places.$error.required||validator.places.hasError}">
                            <label class="control-label col-md-3"><span class="required">
                                *</span> Cupo:
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="number" min="1" ng-model="inductionClassInstance.places"
                                           class="form-control" name="places" required/>
                                </div>
                            </div>

                            <p class="help-block"
                               ng-show="createInductionClass.places.$error.required||validator.places.hasError">
                                {{validator.places.message}}
                            </p>
                        </div>

                        <div class="form-group" ng-class="{'has-error': validatorFecha.hasError || varDate == 0}">
                            <label class="control-label col-md-3"><span class="required">
                                *</span> Fecha:
                            </label>

                            <div class="col-md-5">
                                <div class="input-group date form_meridian_datetime" data-date="2012-12-21T15:25:00Z">
                                    <input type="text" size="16" class="form-control dtime">
                                    <span class="input-group-btn">
                                        <button class="btn default date-reset" type="button"><i class="fa fa-times"></i>
                                        </button>
                                        <button class="btn default date-set" type="button"><i
                                                class="fa fa-calendar"></i></button>
                                    </span>
                                </div>
                                <!-- /input-group -->
                            </div>

                            <span class="text-danger"
                                  ng-show="validatorFecha.hasError">
                                {{validatorFecha.message}}
                            </span>
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="text-center">
                                <button type="submit" class="btn green"
                                        ng-disabled="createInductionClass.$invalid || varSlc == 0 || varDate == 0">Registrar</button>
                                <button type="button" class="btn default" ng-click="cancelar();">Cancelar</button>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
