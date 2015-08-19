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
        <link rel="stylesheet" href="${resource(dir: 'examen/css/light', file: 'lightcase.css')}">
    </head>
    <body class="appear-animate fondoGeometry">
        
        <!-- Page Loader -->        
        <div class="page-loader">
            <div class="loader">Cargando...</div>
        </div>
        <!-- End Page Loader -->
        
        <!-- Page Wrap -->
        <div class="page" id="top">
            
            <!-- Head Section -->
            <section class="page-section bg-light-alfa-30" data-background="images/wall7.jpg">
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
                                TIEMPO: 1:10:00 min&nbsp;
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
            </section>

            <section class="page-section">
                <div class="container relative">
                    
                    <h1 class="section-title rojo font-alt mb-70 mb-sm-40">
                        <strong>Resultados</strong>
                    </h1>
                    <h3 class="align-center">Has obtenido <strong>54 aciertos </strong>de 65 posibles</h3>
                    <div class="row multi-columns-row alt-features-grid">
                        <div class="col-sm-6 col-md-4 col-lg-4">
                            <div class="alt-features-item align-center">
                                <div class="alt-features-icon">
                                    <span class="icon-circle-compass"></span>
                                </div>
                                <h3 class="alt-features-title font-alt azul">Matem&aacute;ticas</h3>
                                <div class="alt-features-descr align-center">
                                    <p class="align-center">14 aciertos</p>
                                    <p class="align-center">6 errores</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-4">
                            <div class="alt-features-item align-center">
                                <div class="alt-features-icon">
                                    <span class="icon-genius"></span>
                                </div>
                                <h3 class="alt-features-title font-alt naranja">Ciencias Experimentales</h3>
                                <div class="alt-features-descr align-center">
                                    <p class="align-center">19 aciertos</p>
                                    <p class="align-center">1 errores</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-4">
                            <div class="alt-features-item align-center">
                                <div class="alt-features-icon">
                                    <span class=" icon-book-open"></span>
                                </div>
                                <h3 class="alt-features-title font-alt verde">Comunicaci&oacute;n</h3>
                                <div class="alt-features-descr align-center">
                                    <p class="align-center">21 aciertos</p>
                                    <p class="align-center">4 errores</p>
                                </div>
                            </div>
                        </div>

                    </div>

                    <p class="mt-60 align-center azul ">A continuaci&oacute;n se muestran los resultados correctos de cada pregunta, revisa tus resultados.</p>

                    <div class="row">


                        <!-- Col -->
                        <h1>${tk}</h1>

                        <div class="col-sm-10 col-sm-offset-1">

                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs tpl-tabs animate">
                                <g:each in="${relations}" var="relation" status="i">
                                    <li class=" align-center col-sm-4 ${colors[i]}">
                                        <a href="#relation-${relation.section.id}" data-toggle="tab"
                                           aria-expanded="false">${relation.section.name}</a>
                                    </li>
                                </g:each>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content tpl-tabs-cont section-text">

                                <g:each in="${relations}" var="relation" status="i">
                                    <div class="tab-pane fade ${i == 0 ? 'active' : ''}  in"
                                         id="relation-${relation.section.id}">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-hover table-bordered">
                                                <thead>
                                                <tr>
                                                    <th class="col-md-8">
                                                        Pregunta
                                                    </th>
                                                    <th class="col-md-2 align-center">
                                                        Tu respuesta
                                                    </th>
                                                    <th class="col-md-2 align-center">
                                                        Respuesta correcta
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <g:each in="${questions}" var="map">
                                                    <g:if test="${relation.section.id == map.key}">
                                                        <g:each in="${map.value}" var="question">
                                                            <tr>
                                                                <td>
                                                                    ${raw(question.number)}
                                                                </td>
                                                                <td class="align-center">
                                                                    A
                                                                </td>
                                                                <td class="align-center">
                                                                    <a href="${raw(question.urlVideo)}" class="button line-blue" data-rel="lightcase"><span aria-hidden="true" class="icon-video"></span></a>
                                                                </td>
                                                            </tr>
                                                        </g:each>
                                                    </g:if>
                                                </g:each>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </g:each>

                            </div>

                        </div>

                        <!-- End Col -->                         
                        
                    </div>
                    <!-- End Row -->
                    
                </div>
            </section>
            
            
            <!-- Call Action Section -->
            <!--section class="small-section Bguinda mt-40">
                <div class="container relative">
                    
                    <div class="align-center">
                        <h3 class="banner-heading font-alt"><img src="../../examen/images/ipnLogo.png" alt="Preparacion IPN" /></h3>
                    </div>                    
                </div>
            </section-->
            <!-- End Call Action Section -->
        </div>
        <!-- End Page Wrap -->
        
        
        <!-- JS -->
        <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'jquery-1.11.1.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'examen/js', file: 'lightcase.js')}"></script>
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
            jQuery(document).ready(function($) {
                $('a[data-rel^=lightcase]').lightcase();
            });
        </script>
    </body>
</html>
