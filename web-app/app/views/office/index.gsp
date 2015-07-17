<div class="row text-right">
    <a class="btn blue btn-small btn-circle" href="#/office/create">
            Registrar Sucursal
        <i class="m-icon-swapright m-icon-white"></i>
    </a>
</div>

<div class="row margin-top-10">
    <div class="col-md-10 col-md-offset-1">

        <!-- BEGIN EXAMPLE TABLE PORTLET-->

       <div class="portlet box green-haze">
            <div class="portlet-title">
                <div class="caption">
                    Gestión de sucursales
                </div>
            </div>
       </div>

            <div class="tiles">
                <a ng-repeat="office in officeList"  href="#/office/show/{{office.id}}" class="tile double bg-blue-madison">
                    <!--<img alt="" src="../../assets/admin/pages/media/profile/photo1.jpg">-->
                    <h4>{{office.name}}</h4>
                    <p>{{office.description}}</p>
                    <div class="tile-object">
                        <div class="name">Responsable</div>
                        <div class="number"># Grupos: {{office.classroom.length}}</div>
                    </div>
                </a>
            </div>
    </div>
</div>
