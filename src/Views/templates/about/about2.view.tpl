<div class="bg-slate-100 content-center">
    {{include common/navbar}}
</div>
<div class="bg-slate-200">
    <div class="text-slate-200"> hola</div>
    <div class="container mx-auto w-11/12 md:w-2/3 max-w-lg mt-80">
        <!-- contenedor, parte white -->
        <div class="relative py-8 px-5 md:px-10 bg-white rounded-xl border ">
            <!-- Aquí podes meter código -->
            <div>
                <h1 class="multi-titleG2 !text-xl !text-center">Recuperar Contraseña</h1>
            </div>
            <fieldset>
                <p class="text-justify mt-2 ">
                    ¿Has perdido tu contraseña?
                    No te preocupes, nosotros te ayudaremos a recuperarla de manera sencilla.
                </p>

            </fieldset>

            <div class="grid grid-rows-1 ">
                <label for="inputField" class="form-label !font-medium !mt-5">Correo
                    Electronico</label>
                <input type="text" name="inputField" id="inputField" class="form-input " placeholder="Input Field">
            </div>
            <p class="text-justify mt-6">
                Asegurate de proporcionarnos la direccion con la que fue creada tu cuenta.
            </p>

            <div class="flex justify-center items-center mt-5">
                <button type="button" class="form-primaryButton" onclick="">Continuar</button>
                <button class="form-secondaryButton" onclick="modalHandler()">Cancelar</button>
            </div>
        </div>
    </div>
    <div class="mt-80 text-slate-200">hola</div>
</div>