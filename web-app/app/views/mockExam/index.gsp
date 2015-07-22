<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 17/07/15
  Time: 10:59 PM
--%>
<div class="row">
    <div class="col-md-12 ">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings font-purple-studio"></i>
                    <span class="caption-subject bold font-purple-studio uppercase">
                        Exámenes Simulacro</span>
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
                                Nombre
                            </th>
                            <th class="text-center" >
                                Duración (min)
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
                        <tr ng-repeat="exam in mockExamList ">
                            <td class="text-center">
                                <a href="#/mockExam/show/{{exam.id}}"> {{$index + 1}} </a>
                            </td>
                            <td class="text-right">
                                <a href="#/mockExam/show/{{exam.id}}"> {{ getNameService( exam.typeService.id ) }} </a>
                            </td>
                            <td class="text-right">
                                <a href="#/mockExam/show/{{exam.id}}"> {{exam.name}} </a>
                            </td>
                            <td class="text-center">
                                <a href="#/mockExam/show/{{exam.id}}"> {{exam.term}} </a>
                            </td>
                            <td class="text-right">
                                <a href="#/mockExam/show/{{exam.id}}"> {{exam.cost | currency: " $ " }} </a>
                            </td>
                            <td class="text-center">
                                <a href="#/mockExam/show/{{exam.id}}"> {{exam.period}} </a>
                            </td>
                            <td class="text-center">
                                <a href="#/mockExam/show/{{exam.id}}">
                                    <span ng-class=" (exam.active) ? 'text-success' : 'text-danger' ">
                                        {{ (exam.active) ? "Activo" : "Bloqueado" }}
                                    </span>
                                </a>
                            </td>
                            <td class="text-right">
                                <a href="#/mockExam/show/{{exam.id}}"> {{exam.stDate}} </a>
                            </td>
                            <td class="text-right">
                                <a href="#/mockExam/show/{{exam.id}}"> {{exam.endDate}} </a>
                            </td>
                            <td class="text-center">
                                <a href="#/mockExam/show/{{exam.id}}"> {{exam.studentService.length}} </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>