
<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PROFILE CONTENT -->
        <div class="profile-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light">
                        <div class="portlet-title tabbable-line">
                            <div class="caption caption-md">
                                <i class="icon-globe theme-font hide"></i>
                                <span class="caption-subject font-blue-madison bold uppercase">Cuenta de perfil</span>
                            </div>
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#tab_1_1" data-toggle="tab">Editar información Personal</a>
                                </li>
                            </ul>
                        </div>

                        <div class="portlet-body">
                            <div class="tab-content">
                                <!-- PERSONAL INFO TAB -->
                                <div class="portlet-body form form-horizontal" id="tab_1_1">
                                    <form name="editUser" ng-submit="updateUser(editUser.$valid, $event)" novalidate>

                                        <div class="form-body">

                                            <div class="form-group" ng-class="{'has-error': editUser.username.$error.required||validator.username.hasError}">
                                                <label class="control-label col-md-3">
                                                    Nombre de Usuario:
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <input type="text" ng-model="userInstance.username"  class="form-control" name="username" required/>
                                                    </div>
                                                </div>
                                                <span class="help-block" ng-show="editUser.username.$error.required||validator.username.hasError">
                                                    {{validator.username.message}}
                                                </span>
                                            </div>

                                            <div class="form-group" ng-class="{'has-error': editUser.name.$error.required||validator.name.hasError}">
                                                <label class="control-label col-md-3">Nombre(s): <span class="required">
                                                    *</span>
                                                </label>

                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <input type="text" ng-model="userInstance.name" class="form-control" name="name" required/>
                                                    </div>
                                                </div>
                                                <span class="help-block" ng-show="editUser.name.$error.required||validator.name.hasError">
                                                    {{validator.name.message}}
                                                </span>
                                            </div>

                                            <div class="form-group" ng-class="{'has-error': editUser.lastName.$error.required||validator.lastName.hasError}">
                                                <label class="control-label col-md-3">Apellido(s): <span class="required">
                                                    *</span>
                                                </label>

                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <input type="text" ng-model="userInstance.lastName" class="form-control" name="lastName"/>
                                                    </div>
                                                </div>
                                                <span class="help-block" ng-show="editUser.lastName.$error.required||validator.lastName.hasError">
                                                    {{validator.lastName.message}}
                                                </span>
                                            </div>

                                            <div class="form-group" ng-class="{'has-error': editUser.address.$error.required||validator.address.hasError}">
                                                <label class="control-label col-md-3">Direccion: <span class="required">
                                                    *</span>
                                                </label>

                                                <div class="col-md-4" ng-class="{'has-error': editUser.address.$error.required||validator.address.hasError}">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <input type="text" ng-model="userInstance.address" class="form-control" name="address" required/>
                                                    </div>
                                                </div>
                                                <span class="help-block" ng-show="editUser.address.$error.required||validator.address.hasError">
                                                    {{validator.address.message}}
                                                </span>
                                            </div>

                                            <div class="form-group" ng-class="{'has-error': editUser.email.$error.required||validator.email.hasError}">
                                                <label class="control-label col-md-3">Correo: <span class="required">
                                                    *</span>
                                                </label>

                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <input type="text" ng-model="userInstance.email" class="form-control" name="email" required/>
                                                    </div>
                                                </div>
                                                <span class="help-block" ng-show="editUser.address.$error.required||validator.address.hasError">
                                                    {{validator.email.message}}
                                                </span>
                                            </div>

                                            <div class="form-group" ng-class="{'has-error': editUser.phoneNumber.$error.required||validator.phoneNumber.hasError}">
                                                <label class="control-label col-md-3">Teléfono: <span class="required">
                                                    *</span>
                                                </label>

                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <input type="text" ng-model="userInstance.phoneNumber" class="form-control" name="phoneNumber" required/>
                                                    </div>
                                                </div>
                                                <span class="help-block" ng-show="editUser.phoneNumber.$error.required||validator.phoneNumber.hasError">
                                                    {{validator.phoneNumber.message}}
                                                </span>
                                            </div>

                                            <div class="form-group" ng-class="{'has-error': editUser.mobileNumber.$error.required||validator.mobileNumber.hasError}">
                                                <label class="control-label col-md-3">Teléfono Móvil: <span class="required">
                                                    *</span>
                                                </label>

                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <input type="text" ng-model="userInstance.mobileNumber" class="form-control" name="mobileNumber"/>
                                                    </div>
                                                </div>
                                                <span class="help-block" ng-show="editUser.mobileNumber.$error.required||validator.mobileNumber.hasError">
                                                    {{validator.mobileNumber.message}}
                                                </span>
                                            </div>

                                            <div class="form-group" ng-class="{'has-error': editUser.role.$error.required||validator.role.hasError}">
                                                <label class="control-label col-md-3">Rol: <span class="required">
                                                    *</span>
                                                </label>

                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <select ng-options="role.id as role.authority for role in roles" ng-model="userInstance.authority.id" name="role" required></select>
                                                    </div>
                                                </div>
                                                <span class="help-block" ng-show="editUser.role.$error.required||validator.role.hasError">
                                                    {{validator.role.message}}
                                                </span>
                                            </div>

                                            <div class="form-group" ng-class="{'has-error': editUser.role.$error.required||validator.role.hasError}">
                                                <label class="control-label col-md-3">Contraseña: <span class="required">
                                                    *</span>
                                                </label>

                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <input type="password" ng-model="userInstance.password" class="form-control" name="password" required/>
                                                    </div>
                                                </div>
                                                <span class="help-block" ng-show="editUser.password.$error.required||validator.password.hasError">
                                                    {{validator.password.message}}
                                                </span>
                                            </div>

                                            <div class="form-group" ng-class="{'has-error': userInstance.verifyPassword !== userInstance.password}" ng-show="editUser.password.$dirty">
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
                                                    <button type="submit" class="btn purple" ng-disabled="!editUser.$dirty || !editUser.$valid   || !(userInstance.verifyPassword !== userInstance.password)">Actualizar</button>
                                                    <button class="btn btn-danger" ng-click="cancelar()">Cancelar</button>
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <!-- END PERSONAL INFO TAB -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END PROFILE CONTENT -->
    </div>
</div>
<!-- END PAGE CONTENT-->