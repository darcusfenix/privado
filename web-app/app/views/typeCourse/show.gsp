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
                        Información de este tipo curso</span>
                </div>

            </div>
            <div class="portlet-body">
                <div class="scroller" style="height:200px">
                    <h4>Nombre:  <b>{{typeCourseInstance.name}}</b> </h4>
                    <br>
                    <h4>Descripción::  <b>{{typeCourseInstance.description}}</b> </h4>
                </div>
                <div class="form-actions noborder">
                    <button type="button" class="btn blue" ng-click="editTypeCourse();">Editar</button>
                    <button type="button" class="btn btn-danger" ng-click="deleteTypeCourse();">Eliminar</button>
                    <button type="button" class="btn default"  ng-click="cancelar();">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
</div>