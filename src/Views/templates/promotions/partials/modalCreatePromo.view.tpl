<div>
    <div class="multi-bgModal"
        id="modalCreatePromo" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <div class="relative py-8 px-5 md:px-10 bg-white rounded-3xl shadow-lg border border-gray-400">
                <form action="">
                    <fieldset>
                        <label for="txtNombrePromo" class="form-label !font-semibold !mt-5">Nombre de la promoción</label>
                        <input type="text" name="txtNombrePromo" id="txtNombrePromo" class="form-input" placeholder="Promocion dia del trabajo">
                        <p class="text-multiDanger" id="nombrePromoError"></p>
                    </fieldset>
                    <div class="flex items-center justify-between">
                        <fieldset>
                            <label for="txtFechaInicio" class="form-label !font-semibold !mt-5">Fecha de inicio</label>
                            <input type="date" name="txtFechaInicio" id="txtFechaInicio" class="form-input">
                            <p class="text-multiDanger" id="fechaInicioError"></p>
                        </fieldset>
                        <fieldset>
                            <label for="txtFechaFinal" class="form-label !font-semibold !mt-5">Fecha de final</label>
                            <input type="date" name="txtFechaFinal" id="txtFechaFinal" class="form-input">
                            <p class="text-multiDanger" id="fechaFinalError"></p>
                        </fieldset>
                    </div>
                    <div class="flex items-center justify-between gap-4">
                        <fieldset>
                            <label for="txtPrecioDePromo" class="form-label !font-semibold !mt-5">Precio por día</label>
                            <input type="text" name="txtPrecioDePromo" id="txtPrecioDePromo" class="form-input" value="" disabled>
                            <input type="hidden" value="{{pricePromotionPerDay}}" id="hidPrecioDePromo">
                        </fieldset>
                        <fieldset>
                            <label for="txtCantidadDeDias" class="form-label !font-semibold !mt-5">Días</label>
                            <input type="text" name="txtCantidadDeDias" id="txtCantidadDeDias" class="form-input" value="" disabled>
                        </fieldset>
                        <fieldset>
                            <label for="txtCostoTotal" class="form-label !font-semibold !mt-5">Costo total</label>
                            <input type="text" name="txtCostoTotal" id="txtCostoTotal" class="form-input">
                        </fieldset>
                    </div>
                    <fieldset>
                        <div class="flex justify-center mt-10">
                            <button type="button" class="form-primaryButton" onclick="savePromo()">Continuar</button>
                            <button type="button" class="form-secondaryButton" onclick="modalHandler(false, 'modalCreatePromo')">Cancelar</button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>