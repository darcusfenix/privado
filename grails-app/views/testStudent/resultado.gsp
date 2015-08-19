<g:set var="context" value="${request.contextPath}" />
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
                        <div class="col-sm-10 col-sm-offset-1">
                            <ul class="nav nav-tabs tpl-tabs animate">
                                <li class="active align-center col-sm-4 Bazul">
                                    <a href="#one" data-toggle="tab" aria-expanded="false">Matem&aacute;ticas</a>
                                </li>
                                <li class="col-sm-4  align-center Bnaranja">
                                    <a href="#two" data-toggle="tab" aria-expanded="false">Ciencias experimentales</a>
                                </li>
                                <li class="col-sm-4  align-center Bverde">
                                    <a href="#three" data-toggle="tab" aria-expanded="true">Comunicaci&oacute;n</a>
                                </li>
                            </ul>
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


                                            <!--tr>
                                                <td>
                                                    Pregunta 1
                                                </td>
                                                <td class="align-center">
                                                     A
                                                </td>
                                                <td class="align-center">
                                                     <a href="https://www.youtube.com/embed/SdVxNdAqUlo" class="button line-blue" data-rel="lightcase"><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                           <tr>
                                                <td>
                                                    Pregunta 2
                                                </td>
                                                <td class="align-center">
                                                     B
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 3
                                                </td>
                                                <td class="align-center">
                                                     C
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 4
                                                </td>
                                                <td class="align-center">
                                                     D
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 5
                                                </td>
                                                <td class="align-center">
                                                     A
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 6
                                                </td>
                                                <td class="align-center">
                                                     B
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 7
                                                </td>
                                                <td class="align-center">
                                                     B
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 8
                                                </td>
                                                <td class="align-center">
                                                     C
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 9
                                                </td>
                                                <td class="align-center">
                                                     C
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 10
                                                </td>
                                                <td class="align-center">
                                                     A
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 11
                                                </td>
                                                <td class="align-center">
                                                     D
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 12
                                                </td>
                                                <td class="align-center">
                                                     D
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 13
                                                </td>
                                                <td class="align-center">
                                                     C
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 14
                                                </td>
                                                <td class="align-center">
                                                     A
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 15
                                                </td>
                                                <td class="align-center">
                                                     B
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 16
                                                </td>
                                                <td class="align-center">
                                                     D
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 17
                                                </td>
                                                <td class="align-center">
                                                     C
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 18
                                                </td>
                                                <td class="align-center">
                                                     A
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 19
                                                </td>
                                                <td class="align-center">
                                                     B
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 20
                                                </td>
                                                <td class="align-center">
                                                     C
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            </tbody>
                                            </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="two">
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
                                            <tr>
                                                <td>
                                                    Pregunta 21
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                           <tr>
                                                <td>
                                                    Pregunta 22
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 23
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 24
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 25
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 26
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 27
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 28
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 29
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 30
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 31
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 32
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 33
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 34
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 35
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 36
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 37
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 38
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 39
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 40
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            </tbody>
                                            </table>
                                        </div>
                                </div>
                                <div class="tab-pane fade" id="three">
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
                                            <tr>
                                                <td>
                                                    Pregunta 41
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                           <tr>
                                                <td>
                                                    Pregunta 42
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 43
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 44
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 45
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 46
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 47
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 48
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 49
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 50
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 51
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 52
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 53
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 54
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 55
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 56
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 57
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 58
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 59
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pregunta 60
                                                </td>
                                                <td class="align-center">
                                                     Sin contestar
                                                </td>
                                                <td class="align-center">
                                                     <a href=""><span aria-hidden="true" class="icon-video"></span></a>
                                                </td>
                                            </tr-->
                                            </tbody>
                                            </table>
                                        </div>
                                </div>
                            </div>
                            </g:each>
                        </div>
                        
                        <!-- End Col -->                         
                        
                    </div>
                    <!-- End Row -->
                    
                </div>
            </section>
            
            
            <!-- Call Action Section -->
            <section class="small-section Bguinda mt-40">
                <div class="container relative">
                    
                    <div class="align-center">
                        <h3 class="banner-heading font-alt"><img src="${context}/examen/images/ipnLogo.png" alt="Preparacion IPN" /></h3>
                    </div>                    
                </div>
            </section>
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
