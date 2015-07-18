<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 17/07/15
  Time: 09:33 PM
--%>

<div class="row">
    <div class="col-md-12 ">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings font-purple-studio"></i>
                    <span class="caption-subject bold font-purple-studio uppercase">
                        Cursos online</span>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" >
                                #
                            </th>
                            <th class="text-center" >
                                Tipo de Servicio
                            </th>
                            <th class="text-center" >
                                Costo individual
                            </th>
                            <th class="text-center" >
                                Periodo
                            </th>
                            <th class="text-center" >
                                Estado
                            </th>
                            <th class="text-center" >
                                Fecha de inicio
                            </th>
                            <th class="text-center" >
                                Fecha final
                            </th>
                            <th class="text-center" >
                                Alumnos Inscritos
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="course in onlineCourseList ">
                            <td class="text-center">
                                <a href="#/onlineCourse/show/{{course.id}}"> {{$index + 1}} </a>
                            </td>
                            <td class="text-right">
                                <a href="#/onlineCourse/show/{{course.id}}"> {{ getNameService( course.typeService.id ) }} </a>
                            </td>
                            <td class="text-right">
                                <a href="#/onlineCourse/show/{{course.id}}"> {{course.cost | currency: " $ " }} </a>
                            </td>
                            <td class="text-center">
                                <a href="#/onlineCourse/show/{{course.id}}"> {{course.period}} </a>
                            </td>
                            <td class="text-center">
                                <a href="#/onlineCourse/show/{{course.id}}">
                                    <span ng-class=" (course.active) ? 'text-success' : 'text-danger' ">
                                        {{ (course.active) ? "Activo" : "Bloqueado" }}
                                    </span>
                                </a>
                            </td>
                            <td class="text-right">
                                <a href="#/onlineCourse/show/{{course.id}}"> {{course.stDate}} </a>
                            </td>
                            <td class="text-right">
                                <a href="#/onlineCourse/show/{{course.id}}"> {{course.endDate}} </a>
                            </td>
                            <td class="text-center">
                                <a href="#/onlineCourse/show/{{course.id}}"> {{course.studentService.length}} </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>