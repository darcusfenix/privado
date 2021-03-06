<div class="row">
    <div class="col-md-12">
        <!-- BEGIN VALIDATION STATES-->
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    Registro de Alumno
                </div>
            </div>

            <div class="portlet-body form form-horizontal">

                <form name="createUser" ng-submit="saveUser(createUser.$valid, $event)" novalidate>
                    <div class="form-body">

                        <div class="form-group"
                             ng-class="{'has-error': createUser.name.$error.required||validator.name.hasError}">
                            <label class="control-label col-md-3">Nombre(s): <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.name" class="form-control" name="name"
                                           required/>
                                </div>
                            </div>
                            <span class="help-block" ng-show="createUser.name.$error.required||validator.name.hasError">
                                {{validator.name.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': createUser.lastName.$error.required||validator.lastName.hasError}">
                            <label class="control-label col-md-3">Apellido(s): <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.lastName" class="form-control"
                                           name="lastName"/>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="createUser.lastName.$error.required||validator.lastName.hasError">
                                {{validator.lastName.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': createUser.email.$error.required||validator.email.hasError}">
                            <label class="control-label col-md-3">Correo: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.email" class="form-control" name="email"
                                           required/>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="createUser.email.$error.required||validator.email.hasError">
                                {{validator.email.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': createUser.phoneNumber.$error.required||validator.phoneNumber.hasError}">
                            <label class="control-label col-md-3">Teléfono: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.phoneNumber" class="form-control"
                                           name="phoneNumber" required/>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="createUser.phoneNumber.$error.required||validator.phoneNumber.hasError">
                                {{validator.phoneNumber.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': createUser.mobileNumber.$error.required||validator.mobileNumber.hasError}">
                            <label class="control-label col-md-3">Teléfono Móvil: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.mobileNumber" class="form-control"
                                           name="mobileNumber"/>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="createUser.mobileNumber.$error.required||validator.mobileNumber.hasError">
                                {{validator.mobileNumber.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': createUser.role.$error.required||validator.role.hasError}">
                            <label class="control-label col-md-3">Rol: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <select ng-options="role.id as role.authority for role in roles"
                                            ng-model="userInstance.authority.id" class="form-control" name="role"
                                            required></select>
                                </div>
                            </div>
                            <span class="help-block" ng-show="createUser.role.$error.required||validator.role.hasError">
                                {{validator.role.message}}
                            </span>
                        </div>

                        <div ng-show="userInstance.authority.id==1" class="form-group">
                            <label class="control-label col-md-3">Grupo: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <select ng-options="group.id as group.nameClassroom for group in classroomList"
                                            ng-model="userInstance.group.id" name="group" required></select>
                                </div>
                            </div>
                            <span class="help-block" ng-show="editUser.group.$error.required||validator.group.hasError">
                                {{validator.role.message}}
                            </span>
                        </div>

                        <div ng-show="userInstance.authority.id==1" class="form-group">
                            <label class="control-label col-md-3">Ex Alumno: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="checkbox" ng-model="userInstance.previousStudent"
                                           name="previousStudent">
                                </div>
                            </div>
                            <span class="help-block" ng-show="editUser.group.$error.required||validator.group.hasError">
                                {{validator.role.message}}
                            </span>
                        </div>

                        <div ng-show="userInstance.authority.id==1" class="form-group">
                            <label class="control-label col-md-3">Comentario: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <textarea type="text" rows="4" cols="50" ng-model="userInstance.comment"
                                              name="comment"></textarea>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="editUser.comment.$error.required||validator.group.hasError">
                                {{validator.comment.message}}
                            </span>
                        </div>

                        <!--div ng-show="userInstance.authority.id==1" class="form-group">
                            <label class="control-label col-md-3">Red Social: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.socialNetworkUrl" name="socialNetworkUrl">
                                </div>
                            </div>
                            <span class="help-block" ng-show="editUser.socialNetworkUrl.$error.required||validator.socialNetworkUrl.hasError">
                                {{validator.socialNetworkUrl.message}}
                            </span>
                        </div-->

                        <div class="form-group"
                             ng-class="{'has-error': createUser.username.$error.required||validator.username.hasError}">
                            <label class="control-label col-md-3">
                                Nombre en facebook:
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="text" ng-model="userInstance.username" class="form-control"
                                           name="username" required/>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="createUser.username.$error.required||validator.username.hasError">
                                {{validator.username.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': createUser.role.$error.required||validator.role.hasError}">
                            <label class="control-label col-md-3">Contraseña: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="password" ng-model="userInstance.password" class="form-control"
                                           name="password" required/>
                                </div>
                            </div>
                            <span class="help-block"
                                  ng-show="createUser.password.$error.required||validator.password.hasError">
                                {{validator.password.message}}
                            </span>
                        </div>

                        <div class="form-group"
                             ng-class="{'has-error': userInstance.verifyPassword !== userInstance.password}"
                             ng-show="createUser.password.$dirty">
                            <label class="control-label col-md-3">Verifica Contraseña: <span class="required">
                                *</span>
                            </label>

                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <input type="password" value="{{userInstance.password}}"
                                           ng-model="userInstance.verifyPassword" placeholder="Contraseña"
                                           class="form-control"/>
                                </div>
                            </div>
                            <span class="help-block" ng-show="userInstance.verifyPassword !== userInstance.password">
                                Las contraseñas no coinciden
                            </span>
                        </div>
                    </div>
                    <hr>

                    <div class="portlet-title">
                        <div class="caption">
                            Dirección
                        </div>
                    </div>
                    <hr>

                    <div class="form-group"
                         ng-class="{'has-error': createUser.state.$error.required||validator.state.hasError}">
                        <label class="control-label col-md-3">Estado: <span class="required">
                            *</span>
                        </label>

                        <div class="col-md-4"
                             ng-class="{'has-error': createUser.state.$error.required||validator.state.hasError}">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <select ng-model="userInstance.state" class="form-control" name="estate" required>
                                    <option value="Distrito Federal">Distrito Federal</option>
                                    <option value="Aguascalientes">Aguascalientes</option>
                                    <option value="Baja California">Baja California</option>
                                    <option value="Baja California Sur">Baja California Sur</option>
                                    <option value="Campeche">Campeche</option>
                                    <option value="Chiapas">Chiapas</option>
                                    <option value="Chihuahua">Chihuahua</option>
                                    <option value="Coahuila">Coahuila</option>
                                    <option value="Colima">Colima</option>
                                    <option value="Durango">Durango</option>
                                    <option value="Guanajuato">Guanajuato</option>
                                    <option value="Guerrero">Guerrero</option>
                                    <option value="Hidalgo">Hidalgo</option>
                                    <option value="Jalisco">Jalisco</option>
                                    <option value="Mexico">M&eacute;xico</option>
                                    <option value="Michoacan">Michoac&aacute;n</option>
                                    <option value="Morelos">Morelos</option>
                                    <option value="Nayarit">Nayarit</option>
                                    <option value="Nuevo Leon">Nuevo Le&oacute;n</option>
                                    <option value="Oaxaca">Oaxaca</option>
                                    <option value="Puebla">Puebla</option>
                                    <option value="Queretaro">Quer&eacute;taro</option>
                                    <option value="Quintana Roo">Quintana Roo</option>
                                    <option value="San Luis Potosi">San Luis Potos&iacute;</option>
                                    <option value="Sinaloa">Sinaloa</option>
                                    <option value="Sonora">Sonora</option>
                                    <option value="Tabasco">Tabasco</option>
                                    <option value="Tamaulipas">Tamaulipas</option>
                                    <option value="Tlaxcala">Tlaxcala</option>
                                    <option value="Veracruz">Veracruz</option>
                                    <option value="Yucatan">Yucat&aacute;n</option>
                                    <option value="Zacatecas">Zacatecas</option>
                                </select>
                            </div>
                        </div>
                        <span class="help-block" ng-show="createUser.state.$error.required||validator.state.hasError">
                            {{validator.state.message}}
                        </span>
                    </div>

                    <div class="form-group"
                         ng-class="{'has-error': createUser.city.$error.required||validator.city.hasError}">
                        <label class="control-label col-md-3">Ciudad/Municipio/Delegación: <span class="required">
                            *</span>
                        </label>

                        <div class="col-md-4"
                             ng-class="{'has-error': createUser.city.$error.required||validator.city.hasError}">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" ng-model="userInstance.city" class="form-control" name="city"
                                       required/>
                            </div>
                        </div>
                        <span class="help-block" ng-show="createUser.city.$error.required||validator.city.hasError">
                            {{validator.city.message}}
                        </span>
                    </div>

                    <div class="form-group"
                         ng-class="{'has-error': createUser.town.$error.required||validator.town.hasError}">
                        <label class="control-label col-md-3">Colonia: <span class="required">
                            *</span>
                        </label>

                        <div class="col-md-4"
                             ng-class="{'has-error': createUser.town.$error.required||validator.town.hasError}">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" ng-model="userInstance.town" class="form-control" name="town"
                                       required/>
                            </div>
                        </div>
                        <span class="help-block" ng-show="createUser.town.$error.required||validator.town.hasError">
                            {{validator.town.message}}
                        </span>
                    </div>

                    <div class="form-group"
                         ng-class="{'has-error': createUser.zipCode.$error.required||validator.zipCode.hasError}">
                        <label class="control-label col-md-3">Código Postal: <span class="required">
                            *</span>
                        </label>

                        <div class="col-md-4"
                             ng-class="{'has-error': createUser.zipCode.$error.required||validator.zipCode.hasError}">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" ng-model="userInstance.zipCode" class="form-control" name="zipCode"
                                       required/>
                            </div>
                        </div>
                        <span class="help-block"
                              ng-show="createUser.zipCode.$error.required||validator.zipCode.hasError">
                            {{validator.zipCode.message}}
                        </span>
                    </div>

                    <div class="form-group"
                         ng-class="{'has-error': createUser.street.$error.required||validator.street.hasError}">
                        <label class="control-label col-md-3">Calle: <span class="required">
                            *</span>
                        </label>

                        <div class="col-md-4"
                             ng-class="{'has-error': createUser.street.$error.required||validator.street.hasError}">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" ng-model="userInstance.street" class="form-control" name="street"
                                       required/>
                            </div>
                        </div>
                        <span class="help-block" ng-show="createUser.street.$error.required||validator.street.hasError">
                            {{validator.street.message}}
                        </span>
                    </div>

                    <div class="form-group"
                         ng-class="{'has-error': createUser.streetNumber.$error.required||validator.streetNumber.hasError}">
                        <label class="control-label col-md-3">Número: <span class="required">
                            *</span>
                        </label>

                        <div class="col-md-4"
                             ng-class="{'has-error': createUser.streetNumber.$error.required||validator.streetNumber.hasError}">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" ng-model="userInstance.streetNumber" class="form-control"
                                       name="streetNumber" required/>
                            </div>
                        </div>
                        <span class="help-block"
                              ng-show="createUser.streetNumber.$error.required||validator.streetNumber.hasError">
                            {{validator.streetNumber.message}}
                        </span>
                    </div>

                    <hr>

                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-offset-3 col-md-9">
                                <button type="submit" class="btn green"
                                        ng-disabled="createUser.$invalid">Registrar</button>
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