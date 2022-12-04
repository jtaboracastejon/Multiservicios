<form class="text-justify bg-white rounded-lg p-10" method="post" enctype="multipart/form-data"> 
    <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Proceso para verificar la cuenta</p>
    <p>Para poder ser un usuario verificado necesitamos saber que haces uso de tu nombre real y estas ne la zona que indicas.</p>
    <br>
    <p>Para ello necesitamos los siguientes documentos:</p>
    <ol class="list-disc">
        <li class="font-medium">Documento Nacional de Identificación</li>
        <li class="font-medium">Comprobante de domicilio</li>
    </ol>
    <br>
    <p>El Documento Nacional de Identificación o DNI debe ser enviado tanto su parte frontal como la trasera.</p>
    <br>
    
    <fieldset>
        <label class="form-label" for="dniFrontal">Subir DNI Frontal</label>
        <input class="form-inputFile" type="file" accept="image/png, image/jpeg, image/jpg" name="dniFrontal" id="dniFrontal">
        <p class="form-helper">PNG, JPG, JPEG</p>
    </fieldset>
    <br>
    <fieldset>
        <label class="form-label" for="dniFrontal">Subir DNI Posterior</label>
        <input class="form-inputFile" type="file" accept="image/png, image/jpeg, image/jpg" name="dniPosterior" id="dniPosterior">
        <p class="form-helper">PNG, JPG, JPEG</p>
    </fieldset>
    <br>
    <p>El comprobante de domicilio puede ser cualquier recibo publico a tu nombre en el que aparezca tu residencia, no debe ser de mas de 3 meses de antigüedad.</p>
    <fieldset>
        <label class="form-label" for="dniFrontal">Subir comprobante de domicilio</label>
        <input class="form-inputFile" type="file" accept="image/png, image/jpeg" name="comprobanteDomicilio" id="comprobanteDomicilio">
        <p class="form-helper">PNG, JPG, JPEG</p>
    </fieldset>
    <br>
    <p>Al enviar los documentos aceptas que, serán almacenados y que una persona destinada a otorgar verificaciones podrá verlos.</p>
    <br>
    <div class="inline-flex gap-4">
        <fieldset>
            <label class="form-label" for="txtDNI">DNI</label>
            <input class="form-input" name="txtDNI" id="txtDNI" maxlength="13" minlength="13">
            <p class="form-helper">Sin espacios ni guiones</p>
        </fieldset>
        <fieldset>
            <label class="form-label" for="txtDNI">Dirección</label>
            <textarea class="form-input" name="txtAddress" id="txtAddress" cols="60" rows="2"></textarea>
            <p class="form-helper">Debe ser la misma dirección del comprobante de domicilio</p>
        </fieldset>
    </div>
    <fieldset class="mt-4">
        <button type="submit" class="form-primaryButton">Enviar documentos</button>
        <button type="button" class="form-secondaryButton">Cancelar</button>
    </fieldset>

</form>