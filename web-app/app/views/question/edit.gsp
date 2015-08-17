<%--
  Created by IntelliJ IDEA.
  User: fernandoTapia
  Date: 31/07/15
  Time: 02:37 AM
--%>

<div class="row">
    <div class="col-md-12 col-md-offset-0 ">
        <div class="alert alert-warning  margin-bottom-10" ng-show="sectionList.length === 0">
            <strong>No hay secciones registradas, para poder crear preguntas debe existir al menos una sección</strong>
        </div>

        <div class="portlet light bordered" ng-hide="sectionList.length === 0">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-settings "></i>
                    <span class="caption-subject bold uppercase">
                        Editar pregunta</span>
                </div>

            </div>

            <div class="portlet-body form">
                <form name="updateQuestion" ng-submit="editQuestion(updateQuestion.$valid, $event);" novalidate
                      class="form-horizontal">
                    <div class="form-body">

                        <div class="form-group"
                             ng-class="{'has-error': varSlc == 0}">
                            <label class="control-label col-md-3">Sección (examen): <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>

                                    <select class="form-control" ng-model="varSlc">
                                        <option value="0">Seleccione</option>
                                        <option ng-repeat="section in sectionList"
                                                value="{{section.id}}">{{section.name}}</option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="form-group"
                             ng-class="{'has-error': updateQuestion.number.$error.required || validator.number.hasError}">
                            <label class="control-label col-md-3">Identificador de pregunta: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="left">
                                    <input type="text" ng-model="questionInstance.number" class="form-control"
                                           name="number"
                                           required/>
                                </div>
                                <span class="help-block"
                                      ng-show="updateQuestion.number.$error.required || validator.number.hasError">
                                    {{validator.number.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Pregunta en: </label>
                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <a  class="btn blue" ng-click="typeQuestion = 1"> Texto </a>
                                    <a  class="btn blue" ng-click="typeQuestion = 2"> Ecuación Matemática </a>
                                    <a  class="btn blue" ng-click="removeText()" ng-show="typeQuestion === 1"> Limpiar texto </a>
                                </div>
                            </div>
                        </div>


                        <div class="form-group"
                             ng-class="{'has-error': varEditorMessage != undefined}" ng-show="typeQuestion === 2">
                            <label class="control-label col-md-3">Pregunta en ecuación Matemática: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="form-group">
                                    <div style="height:300px"
                                         id="editorContainer"></div>

                                </div>
                                <span class="text-danger"
                                      ng-show="varEditorMessage">
                                    {{varEditorMessage}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': varEditorMessage != undefined}" ng-show="typeQuestion === 1">
                            <label class="control-label col-md-3">Pregunta en texto: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">

                                <div name="summernote" id="summernote_1">
                                </div>

                            </div>
                        </div>

                        <div class="text-success text-center" ng-show="messageImage">
                            <strong>{{messageImage}}</strong>
                        </div>

                        <div class="form-group"
                             ng-class="{'text-info': file == null}">
                            <label class="control-label col-md-3">Imagen: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="left">
                                    <input type="file" id="fileI" name="file" class="form-control"
                                           uploader-model="file" ng-click="changeForm()"/> <br>
                                </div>
                            </div>
                        </div>

                        <div class="form-group" ng-show="questionInstance.urlImg">
                            <p class="col-md-4">
                                <span class="label label-danger">
                                    NOTE:</span> Si selecciona una nueva imagen la actual será eliminada.
                            </p>

                            <div class="tiles col-md-8">
                                <div class="tile-body">
                                    <img class="img-rounded img-responsive" src="{{questionInstance.urlImg}}"
                                         alt="">
                                </div>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': updateQuestion.urlVideo.$error.required || validator.urlVideo.hasError}">
                            <label class="control-label col-md-3">URL Video: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="left">
                                    <input type="text" ng-model="questionInstance.urlVideo" class="form-control"
                                           name="urlVideo"/>
                                </div>
                                <span class="help-block"
                                      ng-show="updateQuestion.urlVideo.$error.required || validator.urlVideo.hasError">
                                    {{validator.urlVideo.message}}
                                </span>
                            </div>
                        </div>

                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green"
                                        ng-disabled="!(varSlc !=0) || updateQuestion.$invalid || (!updateQuestion.$dirty)">Actualizar pregunta</button>
                                <a href="#/question" type="button" class="btn default">Cancelar</a>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>