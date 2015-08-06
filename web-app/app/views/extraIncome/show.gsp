<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 25/07/15
  Time: 09:56 PM
--%>

<div class="row">
    <div class="col-md-8 col-md-offset-2 ">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-cogs"></i>Información del ingreso extra
                </div>
            </div>

            <div class="portlet-body">
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Servicio Extra:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{ getNameExtraService(extraIncomeInstance.extraService.id) }}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Sucursal:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{ getNameOffice(extraIncomeInstance.office.id) }}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Fecha y hora:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{extraIncomeInstance.incomeDate}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Cantidad:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{extraIncomeInstance.income | currency: " $ "}}
                    </div>
                </div>


            </div>

            <div class="form-actions noborder">
                <a href="#/extraIncome/edit/{{extraIncomeInstance.id}}" type="button"
                   class="btn btn-primary">Editar</a>
                <button type="button" class="btn btn-danger" data-toggle="modal" href="#model-confirm">Eliminar</button>
                <a href="#/extraIncome" type="button" class="btn btn-default" ng-click="cancelar();">Cancelar</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="model-confirm" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title text-warning">Mensaje de confirmación</h4>
            </div>
            <div class="modal-body text-danger">
                ¿Está se guro que desa eliminar el ingreso extra?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="delete();">Eliminar</button>
                <button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->