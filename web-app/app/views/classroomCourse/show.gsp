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
                <!--<button type="button" class="btn btn-danger" ng-click="deleteClassroomCourse();">Eliminar</button>-->
                <a href="#/classroomCourse" type="button" class="btn btn-default"  ng-click="cancelar();">Cancelar</a>
            </div>
        </div>
    </div>
</div>