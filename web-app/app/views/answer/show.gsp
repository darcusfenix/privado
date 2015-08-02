<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 30/07/15
  Time: 07:47 PM
--%>

<div class="row">
    <div class="col-md-8 col-md-offset-2 ">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-cogs"></i>Información de la respuesta
                </div>
            </div>

            <div class="portlet-body">

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Sección:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{section.name}}
                    </div>
                </div>


                <div class="row static-info">
                    <div class="col-md-5 name">
                        Pregunta:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{question.text}}
                    </div>
                </div>


                <div class="row static-info">
                    <div class="col-md-5 name">
                        Tipo de respuesta:
                    </div>

                    <div class="col-md-7 value uppercase">
                        {{ answerInstance.typeAnswer === 1 ? 'IMAGEN': '' }}
                        {{ answerInstance.typeAnswer === 2 ? 'TEXTO': '' }}
                        {{ answerInstance.typeAnswer === 3 ? 'ECUCACIÓN MATEMÁTICA': '' }}
                    </div>
                </div>

                <div class="row static-info">
                    <div class="col-md-5 name">
                        Solución:
                    </div>

                    <div class="col-md-7 value uppercase" >
                        <span ng-class=" (answerInstance.state) ? 'text-success' : 'text-danger' ">
                            {{answerInstance.state ? 'CORRECTA': 'INCORRECTA'}}
                        </span>
                    </div>
                </div>


                <div class="row static-info">
                    <div class="col-md-5 name">
                        Respuesta:
                    </div>

                    <div class="col-md-7 value uppercase">
                        <img src="{{answerInstance.image}}" ng-show="answerInstance.typeAnswer === 1">
                        <span  ng-show="answerInstance.typeAnswer === 2 || answerInstance.typeAnswer === 3"
                               id="html">

                        </span>
                    </div>
                </div>

            </div>

            <div class="form-actions noborder">
                <a href="#/answer/edit/{{answerInstance.id}}" type="button"
                   class="btn btn-primary">Editar</a>
                <button type="button" class="btn btn-danger" data-toggle="modal" href="#model-confirm">Eliminar</button>
                <a href="#/answer" type="button" class="btn btn-default" ng-click="cancelar();">Cancelar</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="model-confirm" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title text-warning">Mensaje de confirmación</h4>
            </div>
            <div class="modal-body text-danger">
                ¿Está se guro que desa eliminar el servicio?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"
                        ng-click="delete();">Eliminar</button>
                <button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->