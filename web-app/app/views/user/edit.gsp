
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
                                <div class="tab-pane active" id="tab_1_1">
                                    <form name="editUser" ng-submit="updateUser(editUser.$valid)"novalidate>
                                        <div class="form-group">
                                            <label class="control-label">Nombre de usuario:</label>
                                            <input type="text" ng-model="userInstance.username" placeholder="Nombre de usuario" class="form-control"/>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label">Nombre:</label>
                                            <input type="text" ng-model="userInstance.name" placeholder="Nombre(s)" class="form-control"/>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label">Apellido:</label>
                                            <input type="text" ng-model="userInstance.lastName" placeholder="Apellido(s)" class="form-control"/>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label">Dirección:</label>
                                            <input type="text" ng-model="userInstance.address" placeholder="Dirección" class="form-control"/>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label">Correo Electrónico:</label>
                                            <input type="text" name="email" ng-model="userInstance.email" placeholder="E-Mail" class="form-control" required/>
                                            <span class="error" ng-show="editUser.email.$error.required">Required!</span><br>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label">Rol:</label>
                                            <select ng-options="role.id as role.authority for role in roles" ng-model="userInstance.authority.id"></select>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label">Teléfono:</label>
                                            <input type="text" ng-model="userInstance.phoneNumber" placeholder="Teléfono" class="form-control"/>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label">Teléfono Móvil:</label>
                                            <input type="text" ng-model="userInstance.mobileNumber" placeholder="Telefóno Móvil" class="form-control"/>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label">Contraseña:</label>
                                            <input type="password" name="password" ng-model="userInstance.password" placeholder="Contraseña" class="form-control" required/>
                                            <span class="error" ng-show="editUser.password.$error.required">Required!</span><br>
                                        </div>
                                        <div class="form-group" ng-show="editUser.password.$dirty">
                                            <label class="control-label">Verifica Contraseña:</label>
                                            <input type="password" ng-model="userInstance.verifyPassword" placeholder="Contraseña" class="form-control" required ng-valid=""/>
                                        </div>
                                        <div class="margiv-top-10">
                                            <button type="submit" class="btn purple" ng-disabled="editUser.$invalid || userInstance.verifyPassword !== userInstance.password">Actualizar</button>
                                            <button class="btn btn-danger" ng-click="cancelar()">Cancelar</button>
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