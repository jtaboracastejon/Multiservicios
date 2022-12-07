<div class="bg-slate-100 content-center">
    {{include common/navbar}}
</div>
<div class="bg-slate-200">
<div class="text-slate-200"> hola</div>
    <div class="m-40 ">
        <!-- contenedor, parte white -->
        <div class="grid bg-white rounded-xl mt-80 place-content-center ml-80 mr-80 max-w-xl max-h-98 translate-x-80">
            <!-- Aquí podes meter código -->
            <div>
                <h1 class="mt-5 text-center font-bold text-2xl">Restablecer Contraseña</h1>
            </div>
            <fieldset>
                <p class="text-center mt-4">
                    Ingrese su nueva contraseña.
                </p>
            </fieldset>
            <div class="grid container row-span-1 place-content-center mt-6 max-w-40">
                <label for="inputField" class="form-label !font-medium !mt-5">Nueva Contraseña</label>
                <input type="text" name="inputField" id="inputField" class="form-input" placeholder="Input Field">
                <label for="inputField" class="form-label !font-medium !mt-5">Confirmar Contraseña</label>
                <input type="text" name="inputField" id="inputField" class="form-input" placeholder="Input Field">
            </div>
            <div class="flex justify-center items-center mt-10 mb-10">
                <button type="button" class="form-primaryButton" onclick="">Continuar</button>
                <button class="form-secondaryButton" onclick="modalHandler()">Cancelar</button>
            </div>
        </div>
    </div>
<div class="mt-80 text-slate-200">hola</div>
