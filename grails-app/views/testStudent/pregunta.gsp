<!DOCTYPE html>
<g:set var="context" value="${request.contextPath}" />
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
                            <img src="${context}/examen/images/ipnLogo2.png" alt="Preparacion IPN" />
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
                                <a href="${context}/examen/menu" class="active">MENÚ<i class="fa "></i></a>
                            </li>
                            <li>
                                <a href="${context}/examen/finalizar/${examenId}">Finalizar <i class="fa"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            
            
            <!-- Head Section -->
            <section class="page-section bg-light-alfa-30" data-background="${context}/examen/images/wall7.jpg">
                <div class="relative container align-left">
                    
                    <div class="row">
                        
                        <div class="col-md-8">
                            <h1 class="hs-line-11 font-alt mb-20 mb-xs-0">Examen simulacro</h1>
                            <div class="hs-line-4 font-alt black">
                                ${examen}
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
                <g:form name="testForm" controller="testStudent" action="respuestasPreguntas">
                    <div class="container relative">

                        <h5 class="pregunta mb-40 mt-60 mb-sm-40">
                            ${raw(mapQuestion.text)}
                        </h5>


                        <g:each in="${answers}" var="answer">
                            <ul>
                                <li>
                                    <g:field type="radio" class="respuesta btn btn-default" id="respuesta" name="respuesta" value="${answer.id}" />
                                    <g:if test="${answer.typeAnswer == 1}">
                                        <img src="/${answer.image}">
                                    </g:if>
                                    <g:if test="${answer.typeAnswer == 2 || answer.typeAnswer ==3}">
                                        ${raw(answer.textAnswer)}
                                    </g:if>

                                </li>
                            </ul>
                        </g:each>

                        <g:field type="hidden" id="pregunta" name="pregunta" value="${mapQuestion.id}" />

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
                            <a href="${context}/examen/finalizar/${examenId}" class="btn btn-mod btn-w btn-medium btn-round">Resultados</a>
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
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery.countdown.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'contact-form.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery.countdown.min.js')}"></script>

    <script type="text/javascript"
            src="${resource(dir: '/assets/global/plugins/MathJax', file: 'MathJax.js?config=MML_HTMLorMML.js')}"></script>

    <script type="text/javascript">
        var tiempo = ${diff};



        var fiveSeconds = new Date().getTime() + tiempo ;
        $('#clock').countdown(fiveSeconds, {elapse: true})
        .on('update.countdown', function (event) {
            var $this = $(this);
            if (event.elapsed) {
                $this.html(event.strftime('<span>Termino</span>'));
            } else {
                $this.html(event.strftime('<span>%H:%M:%S</span>'));
            }
        });
    </script>

    </body>
</html>
