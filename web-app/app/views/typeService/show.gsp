<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 15/07/15
  Time: 09:00 PM
--%>

<div class="row">
    <div class="col-md-8 col-md-offset-2 ">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings font-purple-studio"></i>
                    <span class="caption-subject bold font-purple-studio uppercase">
                        Información de este tipo servicio</span>
                </div>

            </div>
            <div class="portlet-body">
                <div class="scroller" style="height:200px">
                    <h4>Nombre:  <b>{{typeServiceInstance.name}}</b> </h4>
                    <br>
                    <h4>Descripción::  <b>{{typeServiceInstance.description}}</b> </h4>
                </div>
                <div class="form-actions noborder">
                    <button type="button" class="btn blue" ng-click="editTypeService();">Editar</button>
                    <button type="button" class="btn btn-danger" ng-click="deleteTypeService();">Eliminar</button>
                    <button type="button" class="btn default"  ng-click="cancelar();">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
</div>