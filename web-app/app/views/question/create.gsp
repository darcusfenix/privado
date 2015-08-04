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
                        Agregar nueva pregunta</span>
                </div>

            </div>

            <div class="portlet-body form">
                <form name="createQuestion" ng-submit="saveQuestion(createQuestion.$valid, $event)" novalidate
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
                             ng-class="{'has-error': createQuestion.number.$error.required || validator.number.hasError}">
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
                                      ng-show="createQuestion.number.$error.required || validator.number.hasError">
                                    {{validator.number.message}}
                                </span>
                            </div>
                        </div>

                        <!--<div class="form-group">
                            <div style="height:300px" ng-model="questionInstance.text" class="col-md-10 col-md-offset-1"
                                 id="editorContainer"></div>
                        </div>-->

                        <!--<div class="form-group">
                            <input type="button" value="Obtener función" ng-click="getFuncion()"
                                   class="btn btn-info col-md-2">
                        </input>
                            <textarea class="form-control col-md-10" dir="ltr" id="result" rows="5"
                                      spellcheck="false"></textarea>
                        </div>-->

                        <div class="form-group"
                             ng-class="{'has-error': varEditorMessage != undefined}">
                            <label class="control-label col-md-3">Pregunta: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">

                                <div style="height:300px"
                                     id="editorContainer"></div>

                                <span class="text-danger"
                                      ng-show="varEditorMessage">
                                    {{varEditorMessage}}
                                </span>
                            </div>
                        </div>

                        <div class="text-success text-center" ng-show="messageImage">
                            <strong>{{messageImage}}</strong>
                        </div>

                        <div class="form-group"
                             ng-class="{'text-info': file == null}">
                            <label class="control-label col-md-3">Imagen:
                            </label>

                            <div class="col-md-9">
                                <div class="left">
                                    <input type="file" name="file" class="form-control" uploader-model="file"/> <br>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green"
                                        ng-disabled="!(varSlc !=0) || createQuestion.$invalid">Registrar pregunta</button>
                                <a href="#/question" type="button" class="btn default">Cancelar</a>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>