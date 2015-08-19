<!DOCTYPE html>
<html>
    <head>
        <title>PREPARACI&Oacute;N IPN</title>
        <meta name="description" content="">
        <meta name="keywords" content="Preparacion, IPN, curso, curso en linea, ">
        <meta charset="utf-8">
        <meta name="author" content="Roman Kirichik">
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

        <!-- Favicons -->
        <link rel="shortcut icon" href="${resource(dir: 'examen/images', file: 'favicon.ico')}">

        <!-- CSS -->
        <link rel="stylesheet" href="${resource(dir: 'examen/css', file: 'bootstrap.min.css')}">
        <link rel="stylesheet" href="${resource(dir: 'examen/css', file: 'style.css')}">
        <link rel="stylesheet" href="${resource(dir: 'examen/css', file: 'style-responsive.css')}">
        <link rel="stylesheet" href="${resource(dir: 'examen/css', file: 'animate.min.css')}">
        <link rel="stylesheet" href="${resource(dir: 'examen/css', file: 'vertical-rhythm.min.css')}">
        <link rel="stylesheet" href="${resource(dir: 'examen/css', file: 'owl.carousel.css')}">
        <link rel="stylesheet" href="${resource(dir: 'examen/css', file: 'magnific-popup.css')}">
    </head>
    <body class="appear-animate fondoGeometry">
        
        <!-- Page Loader -->        
        <div class="page-loader">
            <div class="loader">Cargando...</div>
        </div>
        <!-- End Page Loader -->
        
        <!-- Page Wrap -->
        <div class="page" id="top">
            <nav class="main-nav js-stick">
                <div class="full-wrapper relative clearfix">
                    <div class="nav-logo-wrap local-scroll">
                        <a href="mp-index.html" class="logo">
                            <img src="../../examen/images/ipnLogo2.png" alt="Preparacion IPN" />
                        </a>
                    </div>
                    <div class="mobile-nav">
                        <i class="fa fa-bars"></i>
                    </div>
                    <div class="inner-nav desktop-nav">
                        <ul class="clearlist">
                            <li>
                                <a href="${context}/examen" class="active">Inicio <i class="fa "></i></a>
                            </li>
                            <li>
                                <a href="#" class="mn-has-sub">Secci&oacute;nes <i class="fa fa-angle-down"></i></a>
                                <ul class="mn-sub mn-has-multi to-left">
                                    <li class="mn-sub-multi">
                                        <ul>
                                            <g:each in="${relations}" var="relation" >
                                                <li>
                                                    <a href="#">${relation.section.name}</a>
                                                </li>
                                            </g:each>
                                        </ul>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="${context}/resultados">Finalizar <i class="fa"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            
            
            <!-- Head Section -->
            <section class="page-section bg-light-alfa-30" data-background="../../examen/images/wall7.jpg">
                <div class="relative container align-left">
                    
                    <div class="row">
                        
                        <div class="col-md-8">
                            <h1 class="hs-line-11 font-alt mb-20 mb-xs-0">Examen simulacro</h1>
                            <div class="hs-line-4 font-alt black">
                                Versi&oacute;n A
                            </div>
                        </div>

                        <div class="col-md-4 mt-30">
                            <div class="mod-breadcrumbs font-alt align-right">
                                <a href="#">TIEMPO: <span id="clock"></span></a>&nbsp;
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
            </section>
           
            <section class="page-section">
                <g:form action="examen/questionAnswer" >
                    <div class="container relative">
                        <g:each in="${mapQuestion}" var="question">
                        <h5 class="pregunta mb-40 mt-60 mb-sm-40">
                            ${raw(question.text)}
                        </h5>
                        </g:each>

                        <g:each in="${answers}" var="answer">
                            <ul>
                                <li><g:field type="radio" class="respuesta btn btn-default" id="respuesta" name="respuesta" value="${raw(answer.textAnswer)}" /> ${raw(answer.textAnswer)} </li>
                            </ul>
                        </g:each>

                        <g:field type="hidden" id="idPregunta" name="idPregunta" value="${raw(mapQuestion.getId())}" />
                        <g:submitButton name="questionAnswer" class="btn col-lg-offset-5 btn-mod mt-50 btn-large btn-round Bverde" value="Continuar"/>
                    </div>
                </g:form>
            </section>


            <!-- Call Action Section -->
            <section class="small-section Bguinda mt-40">
                <div class="container relative">
                    <div class="align-center">
                        <h3 class="banner-heading font-alt">Finalizar examen</h3>
                        <div>
                            <a href="${context}/resultados" class="btn btn-mod btn-w btn-medium btn-round">Resultados</a>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Call Action Section -->

            <div class="scroll-to-top" style="display: block;">
                <i class="icon-arrow-up"></i>
            </div>
        </div>
        <!-- End Page Wrap -->


        <!-- JS -->
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery-1.11.1.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery.easing.1.3.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'bootstrap.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'SmoothScroll.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery.scrollTo.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery.localScroll.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery.viewport.mini.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery.countTo.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery.appear.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery.sticky.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery.parallax-1.1.3.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery.fitvids.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'owl.carousel.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'isotope.pkgd.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'imagesloaded.pkgd.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery.magnific-popup.min.js')}"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'gmap3.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'wow.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'masonry.pkgd.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery.simple-text-rotator.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'all.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'contact-form.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'contact-form.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'contact-form.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'contact-form.js')}"></script>
        
        <script type="text/javascript">
           $("#clock")
           .countdown("2015/08/09", function(event) {//Parametro que tendra que se variable dependiendo la hora en la que entre el usuario
             $(this).text(
               event.strftime('%H:%M:%S')
             );
           });
         </script>
    </body>
</html>
