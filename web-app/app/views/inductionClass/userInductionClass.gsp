<div class="text-right">
    <button class="btn blue margin-top-10 margin-bottom-10" onclick="window.history.back();"><i
            class="fa fa-arrow-left"></i> Regresar</button>
</div>

<div class="alert alert-danger" ng-show="messageInductionClass">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
    <strong>Relaci&oacute;n de alumnos con clase de inducci&oacute;n</strong> </a>
</div>

<div class="row margin-top-10">
    <div class="col-md-10 col-md-offset-1">

        <div class="portlet box green-haze">
            <div class="portlet-title">
                 <div class="caption">
                 Clase de inducción
                </div>
            </div>
        </div>

        <div class="portlet-body">
            <div class="tab-content">
                <h1>Asignacion</h1>

                <form name="" class="mt-50" ng-submit="" class novalidate class="form-horizontal">

                    <div class="form-group">
                        <label class="control-label col-md-3">Clase de induccion: <span class="required">
                            *</span>
                        </label>

                        <div class="col-md-5">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <select ng-options="InductionClass.id as InductionClass.name for InductionClass in inductionClassList"
                                       ng-model="InductionClass.id"  name="InductionClass.name" class="form-control" required>
                                </select>
                            </div>
                        </div>

                        <span class="help-block" ng-show="editUser.group.$error.required||validator.group.hasError">
                            {{validator.role.message}}
                        </span>
                    </div>

                    <br><br><br>

                    <div class="form-group text-center mt-50">
                        <button class="btn btn-primary" ng-click="editInductionClass();">Registrar clase</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
