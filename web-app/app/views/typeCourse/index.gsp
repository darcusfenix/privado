<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 16/07/15
  Time: 12:03 AM
--%>

<div class="row">
    <div class="col-md-12 ">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings font-purple-studio"></i>
                    <span class="caption-subject bold font-purple-studio uppercase">
                        Tipos de Curso</span>
                </div>

            </div>

            <div class="portlet-body">

                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>

                            <th class="text-center">
                                #
                            </th>
                            <th>
                                Nombre
                            </th>
                            <th>
                                Descripción
                            </th>
                            <th>

                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="typeCourse in typesCourseList ">
                            <td class="text-center">
                                <a href="#/type-course/show/{{typeCourse.id}}"> {{$index + 1}} </a>
                            </td>
                            <td>
                                <a href="#/type-course/show/{{typeCourse.id}}"> {{typeCourse.name}} </a>
                            </td>
                            <td>
                                <a href="#/type-course/show/{{typeCourse.id}}"> {{typeCourse.description}} </a>
                            </td>
                            <td class="text-center">
                                <a href="#/type-course/show/{{typeCourse.id}}" class="btn btn-primary btn-sm uppercase"> Ver </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>