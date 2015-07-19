<%--
  Created by IntelliJ IDEA.
  User: fernandotapia
  Date: 7/18/15
  Time: 12:47 PM
--%>

<div class="row">
  <div class="col-md-10 col-md-offset-1">
    <!-- BEGIN VALIDATION STATES-->
    <div class="portlet box green">
      <div class="portlet-title">
        <div class="caption">
          Crear sucursal
        </div>
      </div>
    </div>

    <div class="portlet-body form">
      <form name="createOffice" class="form-horizontal" ng-submit="saveOffice(createOffice.$valid, $event)" novalidate>
        <div class="form-body">

          <div class="form-group" ng-class="{'has-error': createOffice.name.$error.required||validator.name.hasError}">
            <label class="control-label col-md-3"><span class="required">
              *</span> Nombre de la sucursal:
            </label>

            <div class="col-md-4">
              <div class="input-icon right">
                <i class="fa"></i>
                <input type="text" ng-model="officeInstance.name"  class="form-control" name="name" required placeholder="Nombre"/>
              </div>
            </div>
            <p class="help-block"
               ng-show="createOffice.name.$error.required||validator.name.hasError">
              {{validator.name.message}}
            </p>
          </div>

          <div class="form-group" ng-class="{'has-error': createOffice.description.$error.required||validator.description.hasError}">
            <label class="control-label col-md-3"><span class="required">
              *</span> Descripción de la officina:
            </label>

            <div class="col-md-4">
              <div class="input-icon right">
                <i class="fa"></i>
                <textarea ng-model="officeInstance.description" class="form-control" name="description" required placeholder="Descripción"> </textarea>
              </div>
            </div>
            <p class="help-block"
               ng-show="createOffice.description.$error.required||validator.description.hasError">
              {{validator.description.message}}
            </p>
          </div>

          <div class="form-actions">
            <div class="row">
              <div class="text-center">
                <button type="submit" class="btn green" ng-disabled="createOffice.$invalid">Registrar</button>
                <button type="button" class="btn default" ng-click="cancelar();">Cancelar</button>
              </div>
            </div>
          </div>

        </div>
      </form>
    </div>
  </div>
</div>
