<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 17/07/15
  Time: 10:59 PM
--%>

<div class="row">
    <div class="col-md-8 col-md-offset-2 ">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-cogs"></i>Información del Examen Simulacro
                </div>
            </div>

            <div class="portlet-body">
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Tipo de Servicio:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{ getNameService(mockExamInstance.typeService.id) }}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Costo individual:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{mockExamInstance.cost | currency: " $ "}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Periodo:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{mockExamInstance.period}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Estado:
                    </div>

                    <div class="col-md-7 value uppercase">
                        <span ng-class=" (mockExamInstance.active) ? 'text-success' : 'text-danger' ">
                            {{ (mockExamInstance.active) ? "Activo" : "Bloqueado" }}
                        </span>
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Fecha de inicio:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{mockExamInstance.stDate}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Fecha final:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{mockExamInstance.endDate}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Alumnos Inscritos:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{mockExamInstance.studentService.length}}
                    </div>
                </div>
            </div>

            <div class="form-actions noborder">
                <a href="#/mockExam/edit/{{mockExamInstance.id}}" type="button"
                   class="btn btn-primary">Editar</a>
                <!--<button type="button" class="btn btn-danger" ng-click="deleteonlineCourse();">Eliminar</button>-->
                <a href="#/mockExam" type="button" class="btn btn-default" ng-click="cancelar();">Cancelar</a>
            </div>
        </div>
    </div>
</div>