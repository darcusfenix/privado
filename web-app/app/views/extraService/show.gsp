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
                    <i class="fa fa-cogs"></i>Información del Servicio Extra
                </div>
            </div>

            <div class="portlet-body">
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Tipo de Servicio:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{ getNameService(extraServiceInstance.typeService.id) }}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Costo individual:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{extraServiceInstance.cost | currency: " $ "}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Periodo:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{extraServiceInstance.period}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Monto total:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{extraServiceInstance.fullIncome}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Estado:
                    </div>

                    <div class="col-md-7 value uppercase">
                        <span ng-class=" (extraServiceInstance.active) ? 'text-success' : 'text-danger' ">
                            {{ (extraServiceInstance.active) ? "Activo" : "Bloqueado" }}
                        </span>
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Fecha de inicio:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{extraServiceInstance.stDate}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Fecha final:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{extraServiceInstance.endDate}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Alumnos que han pagado:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{extraServiceInstance.studentService.length}}
                    </div>
                </div>
            </div>

            <div class="form-actions noborder">
                <a href="#/extraService/edit/{{extraServiceInstance.id}}" type="button"
                   class="btn btn-primary">Editar</a>
                <!--<button type="button" class="btn btn-danger" ng-click="deleteextraService();">Eliminar</button>-->
                <a href="#/extraService" type="button" class="btn btn-default" ng-click="cancelar();">Cancelar</a>
            </div>
        </div>
    </div>
</div>