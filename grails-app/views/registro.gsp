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

    <!-- BEGIN THEME STYLES -->
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/global/css', file: 'components-md.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/global/css', file: 'plugins-md.css')}">

    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/tema/css', file: 'layout.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/tema/css/themes', file: 'light.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/tema/css', file: 'custom.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'assets/pages/css', file: 'coming-soon.css')}">

    <!-- END THEME STYLES -->

    <link rel="shortcut icon" href=""/>

    <r:layoutResources/>
</head>

<body>

<!-- BEGIN CONTAINER -->
<div class="container">
    <br>
    <br>
    <hr>

    <div class="row text-center">
        <div class="col-md-8 col-md-offset-2 coming-soon-content">
            <h1 id="titulo" >!Próximamente¡</h1>

            <h2 id="texto" style="color: white">
                Recuerda que el curso de preparación IPN - segunda vuelta se encuentra a poco tiempo de comenzar, no pierdas tu lugar.
            </h2>
            <br>

        </div>
    </div>

    <div class="row text-center">
        <div id="cont" class="col-md-12 hidden">

            <button onclick="registro()" class="btn btn-l blue" style="padding-bottom: 10px; padding-top: 0px;"
                    type="button">
                <h3>
                    SUSCRÍBETE <i class="m-icon-swapright m-icon-white"></i></h3></button>
        </div>
    </div>


    <div id="test">
    </div>

    <div class="row">
        <div class="col-md-6 col-md-offset-3 coming-soon-countdown">
            <div id="defaultCountdown">
            </div>
        </div>
    </div>

    <!--/end row-->
    <div class="row">
        <div class="coming-soon-footer">
            2015 &copy; Preparación IPN

            <ul class="social-icons margin-top-20">

                <li>
                    <a href="https://www.facebook.com/PreparacionIPN?fref=ts" data-original-title="Facebook"
                       class="facebook">
                    </a>
                </li>
                <li>
                    <a href="javascript:;" data-original-title="Twitter" class="twitter">
                    </a>
                </li>
                <li>
                    <a href="javascript:;" data-original-title="Goole Plus" class="googleplus">
                    </a>
                </li>
                <!--<li>
                    <a href="javascript:;" data-original-title="Feed" class="rss">
                    </a>
                </li>
                <li>
                    <a href="javascript:;" data-original-title="Pinterest" class="pintrest">
                    </a>
                </li>
                <li>
                    <a href="javascript:;" data-original-title="Linkedin" class="linkedin">
                    </a>
                </li>
                <li>
                    <a href="javascript:;" data-original-title="Vimeo" class="vimeo">
                    </a>
                </li>-->
            </ul>
        </div>
    </div>
</div>


<script type="text/javascript" src="${resource(dir: 'js', file: 'angular.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'ui-bootstrap-tpls-0.13.0.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'ui-bootstrap-custom-0.13.0.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'angular-route.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'angular-resource.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'loading-bar.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'ng-file-upload-shim.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'ng-file-upload.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'angular-sanitize.min.js')}"></script>


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


<script type="text/javascript"
        src="${resource(dir: '/assets/global/plugins/bootstrap-datepicker/js', file: 'bootstrap-datepicker.min.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: '/assets/global/plugins/bootstrap-timepicker/js', file: 'bootstrap-timepicker.min.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: '/assets/global/plugins/clockface/js', file: 'clockface.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: '/assets/global/plugins/bootstrap-daterangepicker', file: 'moment.min.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: '/assets/global/plugins/bootstrap-daterangepicker', file: 'daterangepicker.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: '/assets/global/plugins/bootstrap-colorpicker/js', file: 'bootstrap-colorpicker.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: '/assets/global/plugins/bootstrap-datetimepicker/js', file: 'bootstrap-datetimepicker.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: '/assets/global/plugins', file: 'jquery.pulsate.min.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: '/assets/global/plugins/jquery-bootpag', file: 'jquery.bootpag.min.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: '/assets/global/plugins/countdown', file: 'jquery.countdown.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: '/assets/global/plugins/countdown', file: 'jquery.countdown.min.js')}"></script>
<script type="text/javascript"
        src="${resource(dir: '/assets/global/plugins/backstretch', file: 'jquery.backstretch.min.js')}"></script>


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
<script type="text/javascript" src="${resource(dir: 'assets/global/scripts', file: 'coming-soon.js')}"></script>



<script type="text/javascript" src="${resource(dir: 'assets/scripts', file: 'table-advanced.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/pages/scripts', file: 'components-pickers.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'assets/global/scripts', file: 'ui-general.js')}"></script>


<script type="text/javascript" src="${resource(dir: 'assets/global/scripts', file: 'form-dropzone.js')}"></script>
<script>
    jQuery(document).ready(function () {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Demo.init(); // init demo features
        ComingSoon.init();

        $.backstretch([
            "${resource(dir: 'assets/admin/pages', file: '1.jpg')}",
            "${resource(dir: 'assets/admin/pages', file: '2.jpg')}",
            "${resource(dir: 'assets/admin/pages', file: '3.jpg')}",
            "${resource(dir: 'assets/admin/pages', file: '4.jpg')}",
        ], {
            fade: 800,
            duration: 5000
        });

    });

    function registro() {
        $(location).attr('href', "registro");
    }
</script>
<!-- END JAVASCRIPTS -->

</body>
</html>
