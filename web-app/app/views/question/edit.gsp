<%--
  Created by IntelliJ IDEA.
  User: fernandoTapia
  Date: 31/07/15
  Time: 02:37 AM
--%>

<div class="row">
    <div class="col-md-10 col-md-offset-1 ">
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
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': updateQuestion.text.$error.required || validator.text.hasError}">
                            <label class="control-label col-md-3">Pregunta: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="left">
                                    <textarea ng-model="questionInstance.text" class="form-control"
                                              name="text"
                                              required></textarea>
                                </div>
                                <span class="help-block"
                                      ng-show="updateQuestion.text.$error.required || validator.text.hasError">
                                </span>
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

                        <div class="form-group">
                            <p class="col-md-5">
                                <span class="label label-danger">
                                    NOTE:</span> Si selecciona una nueva imagen la actual será eliminada.
                            </p>

                            <div class="tiles col-md-7">
                                <div class="tile image double selected">
                                    <div class="tile-body">
                                        <img id="imgFile" src="{{questionInstance.urlImg}}" alt="">
                                    </div>
                                </div>
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