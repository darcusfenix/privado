<div class="row">
    <div class="col-md-12">
        <!-- BEGIN VALIDATION STATES-->
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>Registro de Alumno
                </div>
            </div>

            <div class="portlet-body form form-horizontal">

                <form name="createUser" ng-submit="saveUser(createUser.$valid, $event)" novalidate>
                    <div class="form-body">
                        <div class="form-group" ng-class="{'has-error': createUser.username.$error.required||validator.username.hasError}">
                            <label class="control-label col-md-3">
                                Nombre de Usuario:
                            </label>
                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.username"  class="form-control" name="username" required/>
                                </div>
                            </div>
                            <span class="help-block" ng-show="createUser.username.$error.required||validator.username.hasError">
                                {{validator.username.message}}
                            </span>
                        </div>

                        <div class="form-group" ng-class="{'has-error': createUser.name.$error.required||validator.name.hasError}">
                            <label class="control-label col-md-3">Nombre(s): <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.name" class="form-control" name="name" required/>
                                </div>
                            </div>
                            <span class="help-block" ng-show="createUser.name.$error.required||validator.name.hasError">
                                {{validator.name.message}}
                            </span>
                        </div>

                        <div class="form-group" ng-class="{'has-error': createUser.lastName.$error.required||validator.lastName.hasError}">
                            <label class="control-label col-md-3">Apellido(s): <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.lastName" class="form-control" name="lastName"/>
                                </div>
                            </div>
                            <span class="help-block" ng-show="createUser.lastName.$error.required||validator.lastName.hasError">
                                {{validator.lastName.message}}
                            </span>
                        </div>

                        <div class="form-group" ng-class="{'has-error': createUser.address.$error.required||validator.address.hasError}">
                            <label class="control-label col-md-3">Direccion: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4" ng-class="{'has-error': createUser.address.$error.required||validator.address.hasError}">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.address" class="form-control" name="address" required/>
                                </div>
                            </div>
                            <span class="help-block" ng-show="createUser.address.$error.required||validator.address.hasError">
                                {{validator.address.message}}
                            </span>
                        </div>

                        <div class="form-group" ng-class="{'has-error': createUser.email.$error.required||validator.email.hasError}">
                            <label class="control-label col-md-3">Correo: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.email" class="form-control" name="email" required/>
                                </div>
                            </div>
                            <span class="help-block" ng-show="createUser.address.$error.required||validator.address.hasError">
                                {{validator.email.message}}
                            </span>
                        </div>

                        <div class="form-group" ng-class="{'has-error': createUser.phoneNumber.$error.required||validator.phoneNumber.hasError}">
                            <label class="control-label col-md-3">Teléfono: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.phoneNumber" class="form-control" name="phoneNumber" required/>
                                </div>
                            </div>
                            <span class="help-block" ng-show="createUser.phoneNumber.$error.required||validator.phoneNumber.hasError">
                                {{validator.phoneNumber.message}}
                            </span>
                        </div>

                        <div class="form-group" ng-class="{'has-error': createUser.mobileNumber.$error.required||validator.mobileNumber.hasError}">
                            <label class="control-label col-md-3">Teléfono Móvil: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.mobileNumber" class="form-control" name="mobileNumber"/>
                                </div>
                            </div>
                            <span class="help-block" ng-show="createUser.mobileNumber.$error.required||validator.mobileNumber.hasError">
                                {{validator.mobileNumber.message}}
                            </span>
                        </div>

                        <div class="form-group" ng-class="{'has-error': createUser.role.$error.required||validator.role.hasError}">
                            <label class="control-label col-md-3">Rol: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <select ng-options="role.id as role.authority for role in roles" ng-model="userInstance.authority.id" name="role" required></select>
                                </div>
                            </div>
                            <span class="help-block" ng-show="createUser.role.$error.required||validator.role.hasError">
                                {{validator.role.message}}
                            </span>
                        </div>

                        <div class="form-group" ng-class="{'has-error': createUser.role.$error.required||validator.role.hasError}">
                            <label class="control-label col-md-3">Contraseña: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="password" ng-model="userInstance.password" class="form-control" name="password" required/>
                                </div>
                            </div>
                            <span class="help-block" ng-show="createUser.password.$error.required||validator.password.hasError">
                                {{validator.password.message}}
                            </span>
                        </div>

                        <div class="form-group" ng-class="{'has-error': userInstance.verifyPassword !== userInstance.password}" ng-show="createUser.password.$dirty">
                            <label class="control-label col-md-3">Verifica Contraseña: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="password" value="{{userInstance.password}}" ng-model="userInstance.verifyPassword" placeholder="Contraseña" class="form-control"/>
                                </div>
                            </div>
                            <span class="help-block" ng-show="userInstance.verifyPassword !== userInstance.password">
                                Las contraseñas no coinciden
                            </span>
                        </div>
                    </div>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green" ng-disabled="createUser.$invalid">Registrar</button>
                                <button type="button" class="btn default" ng-click="cancelar();">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- END VALIDATION STATES-->
    </div>
</div>