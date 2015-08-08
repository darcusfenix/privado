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
                                    <a href="#tab_1_1" data-toggle="tab">Información Personal</a>
                                </li>
                                <!--
                                <li>
                                    <a href="#tab_1_2" data-toggle="tab">Change Avatar</a>
                                </li>
                                <li>
                                    <a href="#tab_1_3" data-toggle="tab">Change Password</a>
                                </li>
                                <li>
                                    <a href="#tab_1_4" data-toggle="tab">Privacy Settings</a>
                                </li>
                                -->
                            </ul>
                        </div>

                        <div class="portlet-body">
                            <div class="tab-content">
                                <!-- PERSONAL INFO TAB -->
                                <div class="tab-pane active" id="tab_1_1">

                                    <div class="form-group">
                                        <label class="control-label">Nombres(s):</label>
                                        <b class="uppercase">{{userInstance.name}}</b>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Apellido(s):</label>
                                        <b class="uppercase ">{{userInstance.lastName}}</b>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Teléfono:</label>
                                        <b class="uppercase ">{{userInstance.phoneNumber}}</b>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Móvil:</label>
                                        <b class="uppercase">{{userInstance.mobileNumber}}</b>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Email:</label>
                                        <b class="">{{userInstance.email}}</b>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Direcci&oacute;n:</label>
                                        <b class="uppercase ">{{userInstance.fullAddress}}</b>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Usuario en facebook:</label>
                                        <b class="">{{userInstance.username}}</b>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Grupo:</label>
                                        <b class="uppercase">{{userInstance.group.nameClassroom}}</b>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Comentario:</label>
                                        <b class="uppercase">{{userInstance.comment}}</b>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Clase de inducci&oacute;n:</label>
                                        <b class="">{{userInstance.induction}}</b>
                                    </div>

                                    <div class="margiv-top-10">
                                        <button class="btn purple" ng-click="editUser();">Editar datos</button>
                                        <button class="btn btn-danger" data-toggle="modal"
                                                href="#model-confirm">Eliminar</button>
                                    </div>

                                    <div class="modal fade" id="model-confirm" tabindex="-1" role="basic"
                                         aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true"></button>
                                                    <h4 class="modal-title text-danger">Mensaje de confirmación</h4>
                                                </div>

                                                <div class="modal-body ">
                                                    <b>¿Está seguro que desea eliminar el usuario {{userInstance.name}} {{userInstance.lastName}} ?</b>
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-success"
                                                            data-dismiss="modal">Cancelar</button>
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal"
                                                            ng-click="deleteUser(0);">Eliminar</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>

                                    <div class="modal fade" id="model-confirm2" tabindex="-1" role="basic"
                                         aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true"></button>
                                                    <h4 class="modal-title text-danger">Mensaje de error</h4>
                                                </div>

                                                <div class="modal-body text-center">
                                                    <div id="messageError">
                                                    </div>

                                                    <span class="text-danger">¿Está seguro que desea eliminar definitivamente el usuario {{userInstance.name}} {{userInstance.lastName}} ?</span>
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-success"
                                                            data-dismiss="modal">Cancelar</button>
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal"
                                                            ng-click="deleteUser(1);">Eliminar</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
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

