<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 28/07/15
  Time: 08:57 PM
--%>

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