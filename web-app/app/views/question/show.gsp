<%--
  Created by IntelliJ IDEA.
  User: fernandoTapia
  Date: 31/07/15
  Time: 02:46 PM
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
                    <i class="fa fa-cogs"></i>Información de la pregunta para exámenes
                </div>
            </div>

            <div class="portlet-body">

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Sección:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{questionInstance.sectionName}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Identificador:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{questionInstance.number}}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Pregunta:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{questionInstance.text}}
                    </div>
                </div>

                <div class="tiles">
                    <div class="tile image double selected">
                        <div class="tile-body">
                            <img src="{{questionInstance.urlImg}}" alt="">
                        </div>
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Número de respuestas asociadas:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{ questionInstance.answer.length }}
                    </div>
                </div>

            </div>

            <div class="form-actions noborder">
                <a href="#/question/edit/{{questionInstance.id}}" type="button"
                   class="btn btn-primary">Editar</a>
                <button type="button" class="btn btn-danger" data-toggle="modal" href="#model-confirm">Eliminar</button>
                <a href="#/question" type="button" class="btn btn-default" ng-click="cancelar();">Cancelar</a>
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
                {{ (questionInstance.question.length > 0 ) ?
                'La sección no se pude eliminar porque hay preguntas asociadas': '¿Está seguro que desa eliminar esta pregunta?' }}
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="deleteQuestion();"
                        ng-show="questionInstance.answer.length === 0">Eliminar</button>
                <button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->