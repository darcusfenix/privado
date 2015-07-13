<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 8/07/15
  Time: 09:17 PM
--%>



<div class="row margin-top-10">

	<div class="col-md-10 col-sm-12 col-md-offset-1">

		<div class="margin-top-10 text-right">
			<button class="btn btn-success margin-top-10 margin-bottom-10" onclick="window.history.back();" > <i class="fa fa-arrow-left"></i> Regresar</button>
		</div>

	    <div class="alert {{ (message.type == 1 ) ? 'alert-success': 'alert-danger' }}  margin-bottom-10" ng-show="message.show">
		    <strong> {{message.text}} </strong>
		</div>
		<div class="portlet box purple">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i>  {{userSelected.name}} {{userSelected.lastName}} está inscrito en {{studentServices.length}} {{ (studentServices.length > 1) ? 'servicios' : 'servicio' }}
				</div>
			</div>
			<div class="portlet-body">
				<div class="table-responsive">
					<table class="table table-hover table-bordered table-striped">
					<thead >
					<tr>
						<th class="text-center">
							 Nombre del servicio
						</th>
						<th class="text-center">
                            Total a pagar
						</th>
						<th class="text-center">
                            Abonado
						</th>
						<th class="text-center">
							Cantidad individual
						</th>
						<th class="text-center">
						    Estado
                        </th>
						<th class="text-center">
							Historial de pagos
						</th>
						<th class="text-center">
							Ingresar Pago por servicio
						</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<tr ng-repeat="studentService in studentServices" >
                            <td>{{ getNameService(studentService.service.id) }}</td>
							<td class="text-right"> {{ studentService.service.totalRequired | currency:" $ " }} </td>
							<td class="text-right"> {{ studentService.abonado | currency:" $ " }} </td>
							<td class="text-center">
							    <div class="input-icon text-left" ng-show="studentService.abonado <  studentService.service.totalRequired">
								    <i class="fa fa-usd"></i>
								    <input type="number" class="form-control" placeholder="Cantidad" ng-model="vouchersPaymentInstances[$index].pay" min="1.0" max="{{studentService.service.totalRequired}}">
								</div>
								<span class="text-success uppercase" ng-show="studentService.abonado >=  studentService.service.totalRequired">pagado</span>
                            </td>
                            <td class="text-center ">
                                <span class="uppercase" ng-class="(studentService.active) ? 'text-success' : 'text-danger' " >{{ studentService.active ? 'servicio disponible' : 'servicio bloquedado' }}</span>
                            </td>
							<td class="text-center">
								<a href="#/voucherPayment/student/{{userSelected.id}}/service/{{studentService.service.id}}/record/" class="btn blue-hoki uppercase" ng-show="studentService.abonado > 0">Ver</a>
								<span class="text-warning uppercase" ng-show="studentService.abonado === 0"> No hay pagos resistrados </span>
							</td>
							<td class="text-center">
							    <button ng-disabled="vouchersPaymentInstances[$index].pay <= 0" class="btn btn-primary uppercase" ng-click="saveVoucherPayment(vouchersPaymentInstances[$index], studentService); " ng-show="studentService.abonado <  studentService.service.totalRequired"> Ingresar </button>
							    <span class="text-success uppercase" ng-show="studentService.abonado >=  studentService.service.totalRequired">pagado</span>
							</td>
                        </tr>
					</tr>
					</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
