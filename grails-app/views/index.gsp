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


    <!-- begin profile user styles -->
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/global/plugins/bootstrap-fileinput', file: 'bootstrap-fileinput.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/pages/css', file: 'profile.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/pages/css', file: 'tasks.css')}">
    <!-- end profile user styles -->

    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/global/plugins/clockface/css', file: 'clockface.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: '/assets/global/plugins/bootstrap-datepicker/css', file: 'bootstrap-datepicker3.min.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: '/assets/global/plugins/bootstrap-timepicker/css', file: 'bootstrap-timepicker.min.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: '/assets/global/plugins/bootstrap-colorpicker/css', file: 'colorpicker.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: '/assets/global/plugins/bootstrap-daterangepicker', file: 'daterangepicker-bs3.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: '/assets/global/plugins/bootstrap-datetimepicker/css', file: 'bootstrap-datetimepicker.min.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: '/assets/global/plugins/dropzone', file: 'dropzone.css')}">

    <!-- FIN DE TODOS LOS ESTILOS PARA LA FUNCIONALIDAD DE LOS PLUGINS -->

    <!-- BEGIN THEME STYLES -->
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/global/css', file: 'components-md.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/global/css', file: 'plugins-md.css')}">

    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/tema/css', file: 'layout.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/tema/css/themes', file: 'light.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/tema/css', file: 'custom.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'spinnerTest.css')}">
    <!-- END THEME STYLES -->

    <link rel="shortcut icon" href="favicon.ico"/>

    <r:layoutResources/>
</head>

<body ng-app="ControlEscuela" class="page-md page-header-fixed page-sidebar-closed-hide-logo">

<div id="divSpinner" class="hidden">
    <img src="${resource(dir: 'images', file: 'ajax-loading.gif')}" class="ajax-loader"/>
</div>

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
            <div class="alert alert-success alert-dismissable" ng-show="$root.message">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
                <strong>{{$root.message}}</strong> </a>
            </div>

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
<script type="text/javascript" src="${resource(dir: 'js', file: 'ui-bootstrap-tpls-0.13.0.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'ui-bootstrap-custom-0.13.0.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'angular-route.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'angular-resource.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'loading-bar.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'ng-file-upload-shim.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'ng-file-upload.min.js')}"></script>

<script type="text/javascript" src="${resource(dir: 'app', file: 'ControlEscolar.js')}"></script>

<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'User.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'Role.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'Classroom.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'StateClassroom.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'TypeService.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'Service.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'VoucherPayment.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'StudentService.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'StateVoucher.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'Service.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'TypeService.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'TypeCourse.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'ClassroomCourse.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'OnlineCourse.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'MockExam.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'ExtraService.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'Office.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'Class.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'InductionClass.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'ExtraIncome.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'Section.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'Structure.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/resources', file: 'Question.js')}"></script>

<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'UserRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'ClassroomRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'VoucherPaymentRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'ServiceRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'TypeServiceRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'TypeCourseRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'ClassroomCourseRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'OnlineCourseRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'MockExamRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'ExtraServiceRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'Office.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'InductionClassRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'ExtraIncomeRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'SectionRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'StructureRoutes.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/routes/', file: 'QuestionRoutes.js')}"></script>

<script type="text/javascript" src="${resource(dir: 'app/controllers/user', file: 'User.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/VoucherPayment', file: 'VoucherPayment.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/main', file: 'Main.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/classroom', file: 'Classroom.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/service', file: 'Service.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/typeService', file: 'typeService.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/typeCourse', file: 'TypeCourse.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/classroomCourse', file: 'ClassroomCourse.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/OnlineCourse', file: 'OnlineCourse.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/mockExam', file: 'MockExam.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/extraService', file: 'ExtraService.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/office', file: 'Office.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/inductionClass', file: 'InductionClass.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/extraIncome', file: 'ExtraIncome.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/section', file: 'Section.js')}"></script>

<script type="text/javascript" src="${resource(dir: 'app/controllers/structure', file: 'Structure.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'app/controllers/question', file: 'Question.js')}"></script>
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


<script type="text/javascript" src="${resource(dir: '/assets/global/plugins/bootstrap-datepicker/js', file: 'bootstrap-datepicker.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/assets/global/plugins/bootstrap-timepicker/js', file: 'bootstrap-timepicker.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/assets/global/plugins/clockface/js', file: 'clockface.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/assets/global/plugins/bootstrap-daterangepicker', file: 'moment.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/assets/global/plugins/bootstrap-daterangepicker', file: 'daterangepicker.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/assets/global/plugins/bootstrap-colorpicker/js', file: 'bootstrap-colorpicker.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/assets/global/plugins/bootstrap-datetimepicker/js', file: 'bootstrap-datetimepicker.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/assets/global/plugins', file: 'jquery.pulsate.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/assets/global/plugins/jquery-bootpag', file: 'jquery.bootpag.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/assets/global/plugins/countdown', file: 'jquery.countdown.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/assets/global/plugins/backstretch', file: 'jquery.backstretch.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/assets/global/plugins/dropzone', file: 'dropzone.js')}"></script>
<!-- FIN DE TODOS LOS RECURSOS JS PARA LA FUNCIONALIDAD DE LOS PLUGINS -->

<!--  -->

<script type="text/javascript" src="${resource(dir: '/exportTables', file: 'jquery.base64.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/exportTables', file: 'html2canvas.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/exportTables', file: 'tableExport.js')}"></script>

<script type="text/javascript" src="${resource(dir: '/exportTables/jspdf', file: 'jspdf.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/exportTables/jspdf/libs', file: 'base64.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/exportTables/jspdf/libs', file: 'sprintf.js')}"></script>
<!--  -->

<script type="text/javascript" src="${resource(dir: 'assets/global/scripts', file: 'metronic.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/tema/scripts', file: 'layout.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/tema/scripts', file: 'demo.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/scripts', file: 'table-advanced.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/pages/scripts', file: 'components-pickers.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/global/scripts', file: 'ui-general.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/global/scripts', file: 'coming-soon.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/global/scripts', file: 'form-dropzone.js')}"></script>
<script>
    jQuery(document).ready(function () {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Demo.init(); // init demo features

       /**
        *  $.backstretch([
            "${resource(dir: 'assets/admin/pages', file: '1.jpg')}",
            "${resource(dir: 'assets/admin/pages', file: '2.jpg')}",
            "${resource(dir: 'assets/admin/pages', file: '3.jpg')}",
            "${resource(dir: 'assets/admin/pages', file: '4.jpg')}",
        ], {
            fade: 1000,
            duration: 10000
        });*/
    });
</script>
<!-- END JAVASCRIPTS -->

</body>
</html>
