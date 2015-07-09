<%--
  Created by IntelliJ IDEA.
  User: darcusfenix
  Date: 8/07/15
  Time: 09:17 PM
--%>

<div class="row">
    <div class="col-md-12">
        <!-- BEGIN VALIDATION STATES-->
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift"></i>Agregar comprobante de pago
                </div>
            </div>

            <div class="portlet-body form form-horizontal">

                <div class="form-body">
                    <div class="alert alert-danger display-hide">
                        <button class="close" data-close="alert"></button>
                        You have some form errors. Please check below.
                    </div>

                    <div class="alert alert-success display-hide">
                        <button class="close" data-close="alert"></button>
                        Your form validation is successful!
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">Cantidad: <span class="required">
                            *</span>
                        </label>

                        <div class="col-md-4">
                            <div class="input-icon right">
                                <i class="fa"></i>
                                <input type="text" ng-model="voucherPaymentInstance.pay" class="form-control" name="pay"/>
                            </div>
                        </div>
                    </div>



                <div class="form-actions">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                            <button class="btn green" ng-click="saveVoucherPayment();" >Agregar</button>
                            <button class="btn default"  ng-click="cancelar();" >Cancelar</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- END VALIDATION STATES-->
    </div>
</div>
