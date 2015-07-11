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

                                    <div class="margiv-top-10">
                                        <button class="btn purple" ng-click="editUser();">Editar datos</button>
                                        <button class="btn btn-danger" ng-click="deleteUser();">Eliminar</button>
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


