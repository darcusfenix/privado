<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/style-responsive.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/vertical-rhythm.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
</head>

<div class="page" id="top">

    <!-- Head Section -->
    <section class="small-section bg-gray-lighter">
        <div class="relative container align-left">

            <div class="row">

                <div class="col-md-8">
                    <h1 class="hs-line-11 font-alt mb-20 mb-xs-0">Preparaci&oacute;n IPN</h1>

                    <div class="hs-line-4 font-alt ">
                        Registro curso segunda vuelta
                    </div>
                </div>

            </div>

        </div>
    </section>


    <!-- Section -->
    <section class="page-section">
        <div class="container relative">

            <div class="row" ng-hide="mailMessage">
                <!-- Text -->
                <div class="blog-item-body">

                    <h1 class="mt-0 naranja font-alt">Paso 4. Direcci&oacute;n y croquis de las instalaciones</h1>

                    <div class="lead">
                        <p class="Bblanco">
                            {{enrollmentInformation.name}}
                            <br>
                            El equipo de Preparación IPN te envía un cordial saludo  !
                        </p>


                        <p class="Bblanco">

                            Tu cita es el <strong>{{enrollmentInformation.date|date:'fullDate'}} a las {{enrollmentInformation.date|date:'hh:mm a'}}</strong>  Pedimos <strong>puntualidad</strong>, procura llegar con anticipación. Explicaremos temas importantes para ingresar al IPN.

                        Te recordamos que en esta cita deberás liquidar el costo total del curso ($1,500).

                        Tu asistencia es el último paso para tu inscripción definitiva.
                        </p>
                    </div>
                </div>

                <section class="page-section">
                    <div class="container relative">
                        <div class="row">
                            <div class="col-md-5 col-lg-4 mb-sm-40">
                                <div class="text">
                                    <h3 class="font-alt mb-30 mb-xxs-10">Direcci&oacute;n</h3>

                                    <p>
                                        Asiste a Avenida Wilfrido Massieu #310. Col. Planetario Lindavista, Del. Gustavo A. Madero, D.F.
                                    </p>

                                    <p>
                                        Tel&eacute;fonos
                                    <ul>
                                        <li>26-80-16-66</li>
                                        <li>65-66-23-31</li>
                                        <li>5545117069 (celular)</li>
                                    </ul>
                                </p>
                                </div>
                            </div>

                            <div class="col-md-7 col-lg-offset-1">
                                <div class="work-full-media mt-0 white-shadow">
                                    <ul class="clearlist work-full-slider">
                                        <li>
                                            <a href="img/maps.png" class="lightbox-gallery-2 mfp-image"><img
                                                    src="img/maps.png" alt=""></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <p>
                    Da clic en el bot&oacute;n de <strong>Finalizar</strong> para enviarte la informaci&oacute;n por correo
                </p>
                <a href="#" class="btn col-lg-offset-5 btn-mod btn-large btn-round Bazul"
                   ng-click="sendSketchInformation($event)">Finalizar</a>
            </div>

            <div class="row" ng-show="mailMessage">
                <h1 style="color:#000000;">{{mailMessage}}</h1>
            </div>
        </div>
    </section>
    <hr class="mt-0 mb-0"/>
</div>