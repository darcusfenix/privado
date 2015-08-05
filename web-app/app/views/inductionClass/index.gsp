<%--
  Created by IntelliJ IDEA.
  User: fernandotapia
  Date: 7/18/15
  Time: 4:28 PM
--%>

<div class="row text-right">
    <a class="btn blue btn-small btn-circle" href="#/inductionClass/create">
        Registrar Clase de inducción
        <i class="m-icon-swapright m-icon-white"></i>
    </a>
</div>

<div class="row margin-top-10">
    <div class="col-md-10 col-md-offset-1">

        <!-- BEGIN EXAMPLE TABLE PORTLET-->

        <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    Gestión de clases de inducción
                </div>
            </div>
        </div>

        <div class="tiles text-center">
            <a style="width: 32% !important;" ng-repeat="inductionClass in inductionClassList"
               href="#/inductionClass/show/{{inductionClass.id}}"
               class="tile double bg-blue-madison">
                <!--<img alt="" src="../../assets/admin/pages/media/profile/photo1.jpg">-->
                <h4>{{inductionClass.name}}</h4>

                <p>Fecha: {{inductionClass.date | date:'MM/dd/yyyy'}}</p>

                <p>Hora: {{inductionClass.date | date:'h:mm a'}}</p>

                <div class="tile-object">
                    <div class="name">{{inductionClass.nameStateClassroom}}</div>

                    <div class="number"># Cupo: {{inductionClass.places}}</div>
                </div>
            </a>
        </div>
    </div>
</div>
