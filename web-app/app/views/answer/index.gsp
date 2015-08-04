<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 30/07/15
  Time: 07:47 PM
--%>

<div class="row">
    <div class="col-md-12 ">
        <div class="alert alert-warning  margin-bottom-10" ng-show="answerList.length === 0">
            <strong> No hay respuestas registradas</strong>
        </div>
        <div class="portlet light bordered" ng-hide="answerList.length === 0">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings font-purple-studio"></i>
                    <span class="caption-subject bold font-purple-studio uppercase">
                        Respuestas</span>
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
                                Sección
                            </th>
                            <th class="text-center" >
                                Pregunta
                            </th>
                            <th class="text-center" >
                                Tipo de respuesta
                            </th>
                            <th class="text-center" >
                                Solución
                            </th>
                            <th class="text-center" >
                                Respuesta
                            </th>
                            <th class="text-center" >

                            </th>
                        </tr>
                        <tr>
                            <th>

                            </th>
                            <th>
                                <input type="text" class="form-control" ng-model="filtro.sectionName" placeholder="Filtrar por sección">
                            </th>
                            <th>
                                <input type="text" class="form-control" ng-model="filtro.questionName" placeholder="Filtrar por pregunta">
                            </th>
                            <th>

                            </th>
                            <th>

                            </th>
                            <th>

                            </th>
                            <th>

                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="answer in answerList  | filter:filtro " end-repeat-answer-list>
                            <td class="text-center">
                                <a href="#/answer/show/{{answer.id}}">{{$index + 1}} </a>
                            </td>
                            <td class="text-right">
                                <a href="#/answer/show/{{answer.id}}">{{ answer.sectionName  }}  </a>
                            </td>
                            <td class="text-right">
                                <a href="#/answer/show/{{answer.id}}">{{ answer.questionName }}  </a>
                            </td>
                            <td class="text-center">
                                <a href="#/answer/show/{{answer.id}}">
                                    {{ answer.typeAnswer === 1 ? 'IMAGEN': '' }}
                                    {{ answer.typeAnswer === 2 ? 'TEXTO': '' }}
                                    {{ answer.typeAnswer === 3 ? 'ECUCACIÓN MATEMÁTICA': '' }}
                                </a>
                            </td>
                            <td class="text-center">
                                <a href="#/answer/show/{{answer.id}}">
                                    <button type="button" class="btn"
                                            ng-class="answer.state ? 'btn-success' : 'btn-danger' ">
                                        {{ (answer.state) ? 'Correcta' : 'Incorrecta'}}
                                    </button>
                                </a>
                            </td>
                            <td class="text-center" style="font-size: 18px;">
                                <a href="#/answer/show/{{answer.id}}">
                                    <img src="{{answer.image}}" ng-show="answer.typeAnswer === 1">
                                    <span  ng-show="answer.typeAnswer === 2 || answer.typeAnswer === 3"
                                           class="html" >
                                    </span>
                                </a>
                            </td>
                            <td class="text-centert">
                                <a href="#/answer/show/{{answer.id}}" class="btn btn-primary text-center">
                                    ver
                                </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

