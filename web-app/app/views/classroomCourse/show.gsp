<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 17/07/15
  Time: 12:59 AM
--%>

<div class="row">
    <div class="col-md-8 col-md-offset-2 ">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-cogs"></i>Información del Curso
                </div>
            </div>

            <div class="portlet-body">
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Tipo de Servicio:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{ getNameService(classroomCourseInstance.typeService.id) }}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Costo individual:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{classroomCourseInstance.cost | currency: " $ "}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Periodo:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{classroomCourseInstance.period}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Estado:
                    </div>

                    <div class="col-md-7 value uppercase">
                        <span ng-class=" (classroomCourseInstance.active) ? 'text-success' : 'text-danger' ">
                            {{ (classroomCourseInstance.active) ? "Activo" : "Bloqueado" }}
                        </span>
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Fecha de inicio:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{classroomCourseInstance.stDate}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Fecha final:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{classroomCourseInstance.endDate}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Número de Clases:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{classroomCourseInstance.numberClasses}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Tipo de curso:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{ getNameCourse( classroomCourseInstance.typeCourse.id) }}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Alumnos Inscritos:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{classroomCourseInstance.studentService.length}}
                    </div>
                </div>
            </div>
            <div class="form-actions noborder">
                <a href="#/classroomCourse/edit/{{classroomCourseInstance.id}}" type="button" class="btn btn-primary">Editar</a>
                <button type="button" class="btn btn-danger" data-toggle="modal" href="#model-confirm">Eliminar</button>
                <a href="#/classroomCourse" type="button" class="btn btn-default"  ng-click="cancelar();">Cancelar</a>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="model-confirm" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title text-warning">Mensaje</h4>
            </div>
            <div class="modal-body text-danger">
                {{ (classroomCourseInstance.studentService.length > 0) ? 'EL servicio no se pude eliminar porque hay alumnos inscritos en él': '¿Está se guro que desa eliminar el servicio?' }}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="delete();" ng-show="classroomCourseInstance.studentService.length == 0">Eliminar</button>
                <button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
