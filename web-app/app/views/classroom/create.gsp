<div class="row">
    <div class="col-md-12">
        <!-- BEGIN VALIDATION STATES-->
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>Registro de Grupo
                </div>
            </div>

            <div class="portlet-body form form-horizontal">

                    <div class="form-body">
                        <div class="alert alert-danger display-hide">
                            <button class="close" data-close="alert"></button>
                            You have some form errors. Please check below.
                        </div>

                        <div class="alert alert-success display-hide">
                            <button class="close" data-close="alert"></button>
                            Your form validation is successful!
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Nombre de Grupo: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="classroomInstance.nameClassroom"  class="form-control" name="nameClassroom"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Capacidad del grupo: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="classroomInstance.places" class="form-control" name="places"/>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button  class="btn green" ng-click="saveClassroom();">Registrar</button>
                                <button type="button" class="btn default" ng-click="cancelar();">Cancelar</button>
                            </div>
                        </div>
                    </div>

            </div>
        </div>
        <!-- END VALIDATION STATES-->
    </div>
</div>



%{--
<ul>
    <li>Username: <input ng-model="userInstance.username" type="text"> </li>
    <li>Name: <input ng-model="userInstance.name" type="text"> </li>
    <li>Last Name: <input ng-model="userInstance.lastName" type="text"> </li>
    <li>Phone Number: <input ng-model="userInstance.phoneNumber" type="text"> </li>
</ul>
<button ng-click="saveUser()">Actualizar</button>
<button ng-click="cancelar()">Cancelar</button>--}%
