<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 28/07/15
  Time: 08:57 PM
--%>
<div class="text-right">
    <button class="btn blue margin-top-10 margin-bottom-10" onclick="window.history.back();"><i
            class="fa fa-arrow-left"></i> Regresar</button>
</div>

<div class="row">
    <div class="col-md-8 col-md-offset-2 ">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-cogs"></i>Información de la sección para exámenes
                </div>
            </div>

            <div class="portlet-body">

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Nombre:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{sectionInstance.name}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Descripción:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{sectionInstance.description}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Número de preguntas asociadas:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{ sectionInstance.question.length }}
                    </div>
                </div>

                <br/>

                <div class="tab-pane active" id="tab_1_2">
                    <h3 class="form form-section">Preguntas asociadas<hr/></h3>
                </div>

                <div class="table-responsive col-md-10 col-md-offset-1">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center">
                                Imagen
                            </th>
                            <th class="text-center">
                                Identificador
                            </th>
                            <th class="text-center container">
                                Pregunta
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="question in questionList ">
                            <td class="text-center">
                                <a href="#/question/show/{{question.id}}"><img src="{{question.urlImg}}" alt="">
                                </a>
                            </td>
                            <td class="text-right">
                                <a href="#/question/show/{{question.id}}">{{ question.number }}</a>
                            </td>
                            <td class="text-right">
                                <a href="#/question/show/{{section.id}}">{{ question.text }}</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>

            <div class="form-actions noborder">
                <a href="#/section/edit/{{sectionInstance.id}}" type="button"
                   class="btn btn-primary">Editar</a>
                <button type="button" class="btn btn-danger" data-toggle="modal" href="#model-confirm">Eliminar</button>
                <a href="#/section" type="button" class="btn btn-default" ng-click="cancelar();">Cancelar</a>
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
                {{ (sectionInstance.question.length > 0 ) ?
                'La sección no se pude eliminar porque hay preguntas asociadas': '¿Está se guro que desa eliminar esta sección?' }}
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="delete();"
                        ng-show="sectionInstance.question.length === 0">Eliminar</button>
                <button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->