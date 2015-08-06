<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 25/07/15
  Time: 09:56 PM
--%>

<div class="row">
    <div class="col-md-8 col-md-offset-2 ">
        <div class="alert alert-warning  margin-bottom-10" ng-show="extraServiceList.length === 0">
            <strong> NO HAY SERVICIOS ACTIVOS, DEBE ESTAR AL MENOS UNO ACTIVO </strong>
        </div>
        <div class="portlet light bordered" ng-hide="extraServiceList.length === 0">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings "></i>
                    <span class="caption-subject bold uppercase">
                        Registrar Ingreso</span>
                </div>

            </div>

            <div class="portlet-body form">
                <form name="editExtraIncome" ng-submit="saveExtraIncome(editExtraIncome.$valid, $event)" novalidate
                      class="form-horizontal">
                    <div class="form-body">

                        <div class="form-group"
                             ng-class="{'has-error': editExtraIncome.extraService.$error.required||validator.extraService.hasError}">
                            <label class="control-label col-md-3">Servicio (extra): <span class="required">
                                *</span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>

                                    <select ng-options=" extraService.id as (extraService.description + ' ---  Cantidad requerida: $ ' + extraService.cost) for extraService in extraServiceList "
                                            ng-model="extraIncomeInstance.extraService.id"
                                            name="extraIncomeInstance.extraService" required  class="form-control">
                                    </select>
                                </div>
                                <span class="help-block"
                                      ng-show="editExtraIncome.extraService.$error.required||validator.extraService.hasError">
                                    {{validator.extraService.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editExtraIncome.office.$error.required||validator.office.hasError}">
                            <label class="control-label col-md-3">Oficina: <span class="required">
                                *</span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>

                                    <select ng-options=" office.id as office.description for office in officeList"
                                            ng-model="extraIncomeInstance.office.id"
                                            name="extraIncomeInstance.office" required  class="form-control" >
                                    </select>
                                </div>
                                <span class="help-block"
                                      ng-show="editExtraIncome.office.$error.required||validator.office.hasError">
                                    {{validator.office.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editExtraIncome.income.$error.required || validator.income.hasError}">
                            <label class="control-label col-md-3">Cantidad: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon left">
                                    <i class="fa fa-usd"></i>
                                    <input type="number" ng-model="extraIncomeInstance.income" class="form-control" name="income" min="1"
                                           required />
                                </div>
                                <span class="help-block"
                                      ng-show="editExtraIncome.income.$error.required || validator.income.hasError">
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editExtraIncome.incomeDate.$error.required || validator.incomeDate.hasError}">
                            <label class="control-label col-md-3">Fecha y hora: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon left">
                                    <input type="datetime" ng-model="extraIncomeInstance.incomeDate" class="form-control" name="incomeDate" min="1"
                                           required  readonly/>
                                </div>
                                <span class="help-block"
                                      ng-show="editExtraIncome.incomeDate.$error.required || validator.incomeDate.hasError">
                                </span>
                            </div>
                        </div>


                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green"
                                        ng-disabled="editExtraIncome.$invalid">Guardar cambios</button>
                                <a href="#/extraIncome" type="button" class="btn default">Cancelar</a>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>