<section class="small-section bg-gray-lighter">
    <div class="relative container align-left">

        <div class="row">

            <div class="col-md-12">
                <h1 class="hs-line-11 font-alt mb-20 mb-xs-0">Preparación IPN</h1>

                <div class="hs-line-4 font-alt ">
                    Registro para examen de 2da ronda.
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
                        La cita para tu clase de inducción para el <strong>{{enrollmentInformation.group}}</strong> es el d&iacute;a <strong>{{enrollmentInformation.date |date:'fullDate'}}</strong> a las <strong>{{enrollmentInformation.date |date:'shortTime' }}</strong> en las instalaciones ubicadas cerca del metro Polit&eacute;cnico
                    </p>
                </div>

                <p>
                    Ser&aacute; tu primer clase y es importante que asistas debido a que:
                <ul>
                    <li>Conoceras las instalaciones</li>
                    <li>Conoceras a tu profesor</li>
                    <li>Se te agregara al curso en linea</li>
                </ul>
            </p>
                <p>
                    Recuerda que este d&iacute;a tendras que <strong>liquidar el costo total del curso</strong>.
                </p>
            </div>
            <!-- End Text -->
        </div>

        <div class="row">
            <h1 class="mt310 azulF font-alt text-center">&#191;Puedes asistir a tu cita de inscripci&oacute;n?</h1>

            <div class="align-center mt50 mb-40 mb-xxs-30">
                <ul class="nav nav-tabs tpl-minimal-tabs">

                    <li class="active">
                        <div class="mb-10">
                            <a href="#/classConfirmation/{{token}}"
                               class="btn btn-mod Bverde btn-circle  btn-large">SI puedo asistir</a>
                        </div>
                    </li>

                    <li class="active blanco Bguinda">
                        <div class="mb-10">
                            <a href="#/cantAssistOptions/{{token}}"
                               class="btn btn-mod Brojo btn-circle  btn-large">NO puedo asistir</a>
                        </div>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</section>