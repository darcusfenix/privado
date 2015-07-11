<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8"/>
    <title>Control Escolar</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description"/>
    <meta content="" name="author"/>

    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'assets/global/plugins/font-awesome/css', file: 'font-awesome.min.css')}">
    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'assets/global/plugins/simple-line-icons', file: 'simple-line-icons.min.css')}">
    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'assets/global/plugins/bootstrap/css', file: 'bootstrap.min.css')}">
    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'assets/global/plugins/uniform/css/', file: 'uniform.default.css')}">
    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'assets/global/plugins/bootstrap-switch/css', file: 'bootstrap-switch.min.css')}">
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- AQUÍ ESTARÁN TODOS LOS ESTILOS PARA LA FUNCIONALIDAD DE LOS PLUGINS -->

    <!-- ESTOS PLUGINS SON PARA MOSTRAR TABLAS -->
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/global/plugins/select2', file: 'select2.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/global/plugins/datatables/extensions/Scroller/css', file: 'dataTables.scroller.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/global/plugins/datatables/extensions/ColReorder/css', file: 'dataTables.colReorder.min.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/global/plugins/datatables/plugins/bootstrap', file: 'dataTables.bootstrap.css')}" />
    <!-- FIN DE PLUGINS SON PARA MOSTRAR TABLAS -->

    <!-- begin profile user styles -->
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/global/plugins/bootstrap-fileinput', file: 'bootstrap-fileinput.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/pages/css', file: 'profile.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/pages/css', file: 'tasks.css')}">
    <!-- end profile user styles -->

    <!-- FIN DE TODOS LOS ESTILOS PARA LA FUNCIONALIDAD DE LOS PLUGINS -->

    <!-- BEGIN THEME STYLES -->
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/global/css', file: 'components-md.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/global/css', file: 'plugins-md.css')}">

    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/tema/css', file: 'layout.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/tema/css/themes', file: 'light.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/tema/css', file: 'custom.css')}">
    <!-- END THEME STYLES -->

    <link rel="shortcut icon" href="favicon.ico"/>

    <r:layoutResources/>
</head>

<body ng-app="ControlEscuela" class="page-md page-header-fixed page-sidebar-closed-hide-logo">

<!-- BEGIN HEADER -->
<g:include view="tpl/header.html"/>
<!-- END HEADER -->

<div class="clearfix">
</div>

<!-- BEGIN CONTAINER -->
<div class="page-container">

    <!-- BEGIN SIDEBAR -->
    <g:include view="tpl/sidebar.html"/>
    <!-- END SIDEBAR -->


    <div class="page-content-wrapper">
        <div class="page-content">

            <!-- BEGIN PAGE HEAD -->
            <g:include view="tpl/page-head.html"/>
            <!-- END PAGE HEAD -->

            <!-- BEGIN ACTUAL CONTENT -->
            <div ng-view class="fade-in-up"></div>
            <!-- END ACTUAL CONTENT -->
        </div>
    </div>
</div>
<!-- END CONTAINER -->

<!-- BEGIN FOOTER -->
<g:include view="tpl/footer.html"/>
<!-- END FOOTER -->

<script type="text/javascript" src="${resource(dir: 'js', file: 'angular.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'angular-route.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'angular-resource.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'loading-bar.js')}"></script>

<script type="text/javascript" src="${resource(dir: 'app', file: 'ControlEscolar.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'User.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'Classroom.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/user', file: 'User.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/main', file: 'Main.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/classroom', file: 'Classroom.js')}"></script>

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script type="text/javascript" src="${resource(dir: 'assets/global/plugins', file: 'respond.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/global/plugins', file: 'excanvas.min.js')}"></script>
<![endif]-->
<script type="text/javascript" src="${resource(dir: 'assets/global/plugins', file: 'jquery.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/global/plugins', file: 'jquery-migrate.min.js')}"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script type="text/javascript"
        src="${resource(dir: 'assets/global/plugins/jquery-ui', file: 'jquery-ui.min.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: 'assets/global/plugins/bootstrap/js', file: 'bootstrap.min.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: 'assets/global/plugins/bootstrap-hover-dropdown', file: 'bootstrap-hover-dropdown.min.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: 'assets/global/plugins/jquery-slimscroll', file: 'jquery.slimscroll.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/global/plugins', file: 'jquery.blockui.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/global/plugins', file: 'jquery.cokie.min.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: 'assets/global/plugins/uniform', file: 'jquery.uniform.min.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: 'assets/global/plugins/bootstrap-switch/js', file: 'bootstrap-switch.min.js')}"></script>
<!-- END CORE PLUGINS -->



<!-- AQUÍ ESTARAN TODOS LOS RECURSOS JS PARA LA FUNCIONALIDAD DE LOS PLUGINS -->

<!-- ESTOS JS SON PARA LA FUNCIONALIDAD DE LAS TABLAS -->
<script type="text/javascript" src="${resource(dir: 'assets/global/plugins/select2', file: 'select2.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/global/plugins/datatables/media/js', file: 'jquery.dataTables.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/global/plugins/datatables/extensions/TableTools/js', file: 'dataTables.tableTools.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/global/plugins/datatables/extensions/ColReorder/js', file: 'dataTables.colReorder.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/global/plugins/datatables/extensions/Scroller/js', file: 'dataTables.scroller.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/global/plugins/datatables/plugins/bootstrap', file: 'dataTables.bootstrap.js')}"></script>
<!-- FIN DE JS SON PARA LA FUNCIONALIDAD DE LAS TABLAS -->

<!-- FIN DE TODOS LOS RECURSOS JS PARA LA FUNCIONALIDAD DE LOS PLUGINS -->



<script type="text/javascript" src="${resource(dir: 'assets/global/scripts', file: 'metronic.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/tema/scripts', file: 'layout.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/tema/scripts', file: 'demo.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/scripts', file: 'table-advanced.js')}"></script>



<script>
    jQuery(document).ready(function () {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Demo.init(); // init demo features

    });
</script>
<!-- END JAVASCRIPTS -->

</body>
</html>
