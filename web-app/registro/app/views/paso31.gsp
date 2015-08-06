<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/style-responsive.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/vertical-rhythm.min.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
</head>

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

<hr class="mt-0 mb-0"/>

<section class="page-section">
    <div class="container relative">
        <div class="row">
            <div class="blog-item-body">
                <h1 class="mt-0 azulF  text-center font-alt">Selecciona otro horario</h1>

                <div class="lead">
                    <p>
                        A continuaci&oacute;n se muestran los horarios disponibles para que puedas asistir a tu clase de inducci&oacute;n. Selecciona uno y da clic en el bot&oacute;n Continuar.
                    </p>

                    <div class="text-danger text-center Bblanco" ng-show="messageTime">
                        {{messageTime}}
                    </div>

                    <div class="row">
                        <div class="col-sm-2 mb-40"></div>

                        <div class="col-sm-8 mb-40">
                            <form method="post" action="#" id="form-1" role="form" class="form">
                                <div class="mb-20 mb-md-10">
                                    <select class="input-md form-control" ng-model="appointmentDateSelect">
                                        <option value="-1">Seleccione</option>
                                        <option value="10:00">10:00 hrs.</option>
                                        <option value="10:30">10:30 hrs.</option>
                                        <option value="11:00">11:00 hrs.</option>
                                        <option value="11:30">11:30 hrs.</option>
                                        <option value="12:00">12:00 hrs.</option>
                                        <option value="12:30">12:30 hrs.</option>
                                        <option value="13:00">13:00 hrs.</option>
                                        <option value="13:30">13:30 hrs.</option>
                                        <option value="14:00">14:00 hrs.</option>
                                        <option value="14:30">14:30 hrs.</option>
                                        <option value="15:00">15:00 hrs.</option>
                                        <option value="15:30">15:30 hrs.</option>
                                        <option value="16:00">16:00 hrs.</option>
                                        <option value="16:30">16:30 hrs.</option>
                                        <option value="17:00">17:00 hrs.</option>
                                        <option value="17:30">17:30 hrs.</option>
                                        <option value="18:00">18:00 hrs.</option>
                                        <option value="18:30">18:30 hrs.</option>
                                        <option value="19:00">19:00 hrs.</option>
                                        <option value="19:30">19:30 hrs.</option>
                                        <option value="20:00">20:00 hrs.</option>
                                        <option value="20:30">20:30 hrs.</option>
                                        <option value="21:00">21:00 hrs.</option>
                                    </select>
                                </div>
                            </form>
                        </div>

                        <div class="col-sm-2 mb-40"></div>
                    </div>
                    <!-- TODO change button action -->
                    <a href="#/croquis.html" class="btn col-lg-offset-5 btn-mod btn-large btn-round Bazul"
                       ng-click="generateAppointment($event)">Continuar</a>
                </div>
            </div>
        </div>
    </div>
</section>