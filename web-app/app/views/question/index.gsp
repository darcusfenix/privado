<%--
  Created by IntelliJ IDEA.
  User: fernandoTapia
  Date: 31/07/15
  Time: 01:33 AM
--%>

<div class="row">
    <div class="col-md-12 ">
        <div class="alert alert-warning  margin-bottom-10" ng-show="questionList.length === 0">
            <strong> No hay preguntas registradas </strong>
        </div>
        <div class="portlet light bordered" ng-hide="questionList.length === 0">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings font-purple-studio"></i>
                    <span class="caption-subject bold  uppercase">
                        Preguntas para exámenes</span>
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
                                Número de pregunta
                            </th>
                            <th class="text-center" >
                                Pregunta
                            </th>
                            <th class="text-center" >
                                # Respuestas asociadas
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="question in questionList ">
                            <td class="text-center">
                                <a href="#/question/show/{{question.id}}">{{$index + 1}} </a>
                            </td>
                            <td class="text-right">
                                <a href="#/question/show/{{question.id}}">{{ question.number }}  </a>
                            </td>
                            <td class="text-right">
                                <a href="#/question/show/{{question.id}}">{{ question.text }}  </a>
                            </td>
                            <td class="text-center">
                                <a href="#/question/show/{{question.id}}">{{ question.answer.length }}  </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>