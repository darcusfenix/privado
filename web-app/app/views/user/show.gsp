<!-- BEGIN PAGE CONTENT-->
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PROFILE SIDEBAR -->
        <div class="profile-sidebar" style="width:250px;">
            <!-- PORTLET MAIN -->
            <div class="portlet light profile-sidebar-portlet">
                <!-- SIDEBAR USERPIC -->
                <div class="profile-userpic">
                    <img src="assets/pages/media/profile/profile_user.jpg" class="img-responsive" alt="">
                </div>
                <!-- END SIDEBAR USERPIC -->
                <!-- SIDEBAR USER TITLE -->
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name">
                        {{userInstance.username}}
                    </div>

                    <div class="profile-usertitle-job">
                        Alumno
                    </div>
                </div>
                <!-- END SIDEBAR USER TITLE -->
                <!-- SIDEBAR BUTTONS -->
                <div class="profile-userbuttons">
                    <button type="button" class="btn btn-circle green-haze btn-sm">Follow</button>
                    <button type="button" class="btn btn-circle btn-danger btn-sm">Message</button>
                </div>
                <!-- END SIDEBAR BUTTONS -->
                <!-- SIDEBAR MENU -->
                <div class="profile-usermenu">
                    <ul class="nav">
                        <li>
                            <a href="extra_profile.html">
                                <i class="icon-home"></i>
                                Overview</a>
                        </li>
                        <li class="active">
                            <a href="extra_profile_account.html">
                                <i class="icon-settings"></i>
                                Cuenta</a>
                        </li>
                        <li>
                            <a href="page_todo.html" target="_blank">
                                <i class="icon-check"></i>
                                Tasks</a>
                        </li>
                        <li>
                            <a href="extra_profile_help.html">
                                <i class="icon-info"></i>
                                Help</a>
                        </li>
                    </ul>
                </div>
                <!-- END MENU -->
            </div>
            <!-- END PORTLET MAIN -->
            <!-- PORTLET MAIN -->
            <div class="portlet light">
                <!-- STAT -->
                <div class="row list-separated profile-stat">
                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="uppercase profile-stat-title">
                            37
                        </div>

                        <div class="uppercase profile-stat-text">
                            Projects
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="uppercase profile-stat-title">
                            51
                        </div>

                        <div class="uppercase profile-stat-text">
                            Tasks
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="uppercase profile-stat-title">
                            61
                        </div>

                        <div class="uppercase profile-stat-text">
                            Uploads
                        </div>
                    </div>
                </div>
                <!-- END STAT -->
                <div>
                    <h4 class="profile-desc-title">About Marcus Doe</h4>
                    <span class="profile-desc-text">Lorem ipsum dolor sit amet diam nonummy nibh dolore.</span>

                    <div class="margin-top-20 profile-desc-link">
                        <i class="fa fa-globe"></i>
                        <a href="http://www.keenthemes.com">www.keenthemes.com</a>
                    </div>

                    <div class="margin-top-20 profile-desc-link">
                        <i class="fa fa-twitter"></i>
                        <a href="http://www.twitter.com/keenthemes/">@keenthemes</a>
                    </div>

                    <div class="margin-top-20 profile-desc-link">
                        <i class="fa fa-facebook"></i>
                        <a href="http://www.facebook.com/keenthemes/">keenthemes</a>
                    </div>
                </div>
            </div>
            <!-- END PORTLET MAIN -->
        </div>
        <!-- END BEGIN PROFILE SIDEBAR -->
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
                                <li>
                                    <a href="#tab_1_2" data-toggle="tab">Change Avatar</a>
                                </li>
                                <li>
                                    <a href="#tab_1_3" data-toggle="tab">Change Password</a>
                                </li>
                                <li>
                                    <a href="#tab_1_4" data-toggle="tab">Privacy Settings</a>
                                </li>
                            </ul>
                        </div>

                        <div class="portlet-body">
                            <div class="tab-content">
                                <!-- PERSONAL INFO TAB -->
                                <div class="tab-pane active" id="tab_1_1">

                                    <div class="form-group">
                                        <label class="control-label">Nombre:</label>
                                        <b class="uppercase">{{userInstance.name}}</b>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Apellido:</label>
                                        <b class="uppercase ">{{userInstance.lastName}}</b>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Teléfono:</label>
                                        <b class="uppercase ">{{userInstance.phoneNumber}}</b>
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


