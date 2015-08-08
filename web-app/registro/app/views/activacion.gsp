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

            <div class="col-md-12">
                <h1 class="hs-line-11 font-alt mb-20 mb-xs-0">Preparación IPN</h1>

                <div class="hs-line-4 font-alt ">
                    Registro curso segunda vuelta
                </div>
            </div>
        </div>

    </div>
</section>
<section class="page-section">
    <div class="container relative">

        <div class="row">
            <!-- Text -->
            <div class="blog-item-body">

                <h1 class="mt-0 morado font-alt">Paso 3. Cita de inscripci&oacute;n</h1>

                <div class="lead">
                    <p>
                        Tu cita es el <strong>{{enrollmentInformation.date |date:'fullDate'}}</strong> a las <strong>{{enrollmentInformation.date |date:'hh:mm a' }}</strong> en las instalaciones ubicadas cerca del metro Polit&eacute;cnico. Este d&iacute;a tendr&aacute;s que <strong>liquidar</strong> el costo total del curso, el cual es de <strong>$1,500</strong>. Tu asistencia es fundamental.
                    </p>
                </div>

            </div>
            <!-- End Text -->
        </div>

        <div class="row">
            <h1 class="mt310 azul font-alt text-center">Preparación IPN necesita confirmar tu asistencia.</h1>

            <div class="align-center mt50 mb-40 mb-xxs-30">
                <ul class="nav nav-tabs tpl-minimal-tabs">

                    <li class="active">
                        <div class="mb-10">
                            <a href="#/classConfirmation/{{token}}"
                               class="btn btn-mod Bverde btn-circle  btn-large">Sí, asistiré</a>
                        </div>
                    </li>

                    <li class="active blanco Bguinda">
                        <div class="mb-10">
                            <a href="#/cantAssistOptions/{{token}}"
                               class="btn btn-mod Brojo btn-circle  btn-large">NO puedo asistir porque...</a>
                        </div>
                    </li>

                </ul>
            </div>
        </div>
        <div class="row">
            <span style="color: white; font-size: 22px;">Nota: Los correos que se ten envían puede tardar dependiendo tu conexión a internet. También es muy importante que revises tu entrada de spam. EN algunos casos pueden estar los correos ahí.</span>
        </div>
    </div>
</section>