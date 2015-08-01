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
                    <i class="icon-settings "></i>
                    <span class="caption-subject bold uppercase">
                        Agregar nueva respuesta</span>
                </div>

            </div>

            <div class="form-body form-horizontal">
                <div class="form-group">
                    <label class="control-label col-md-3">Sección: <span class="required">
                        *</span>
                    </label>
                    <div class="col-md-9">
                        <div class="input-icon right">
                            <i class="fa"></i>
                            <select ng-options=" section.id as section.name for section in sectionList"
                                    ng-model="sectionSelected"
                                    ng-change="updateQuestions(); "
                                    class="form-control">
                                <option value="">Seleccione una opción</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <div class="portlet-body form">
                <form name="editAnswer" ng-submit="saveAnswer(editAnswer.$valid, $event)" novalidate
                      class="form-horizontal" >
                    <div class="form-body">

                        <div class="form-group"
                             ng-class="{'has-error': editAnswer.question.$error.required||validator.question.hasError}"
                             ng-show="questionBySectionList.length > 0">
                            <label class="control-label col-md-3">Pregunta: <span class="required">
                                *</span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <select  ng-options=" question.id as question.text for question in questionBySectionList"
                                             ng-model="answerInstance.question.id"
                                             name="answerInstance.question" required  class="form-control">
                                            <option value="">Seleccione una opción</option>
                                    </select>
                                </div>
                                <span class="help-block"
                                      ng-show="editAnswer.question.$error.required||validator.question.hasError">
                                    {{validator.question.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editAnswer.textAnswer.$error.required || validator.textAnswer.hasError}"
                             ng-show="questionBySectionList.length > 0">
                            <label class="control-label col-md-3">Respuesta (texto): <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="left">
                                    <textarea type="text" ng-model="answerInstance.textAnswer" class="form-control" name="textAnswer" min="1"
                                           required ></textarea>
                                </div>
                                <span class="help-block"
                                      ng-show="editAnswer.textAnswer.$error.required || validator.textAnswer.hasError">
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editAnswer.state.$error.required || validator.state.hasError}"
                             ng-show="questionBySectionList.length > 0">
                            <label class="control-label col-md-3">Estado: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <button type="button" class="btn"
                                            ng-class="answerInstance.state ? 'btn-success' : 'btn-danger' "
                                            ng-click="answerInstance.state = !answerInstance.state">
                                        {{ (answerInstance.state) ? 'Correcta' : 'Incorrecta'}}
                                    </button>
                                </div>
                                <span class="help-block"
                                      ng-show="editAnswer.state.$error.required || validator.state.hasError">
                                    {{validator.state.message}}
                                </span>
                            </div>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': editAnswer.image.$error.required || validator.image.hasError}"
                             ng-show="questionBySectionList.length > 0">
                            <label class="control-label col-md-3">Imagen: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-9">
                                <div class="left">
                                    <input type="file" ng-model="answerInstance.image" class="form-control" name="image"
                                               />
                                </div>
                                <span class="help-block"
                                      ng-show="editAnswer.image.$error.required || validator.image.hasError">
                                </span>
                            </div>
                        </div>


                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green"
                                        ng-disabled="editAnswer.$invalid">Registrar sección</button>
                                <a href="#/answer" type="button" class="btn default">Cancelar</a>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>