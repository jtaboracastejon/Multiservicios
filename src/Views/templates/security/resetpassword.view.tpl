
  {{if showFomrEmail}}
  <form class="grid" method="post" action="index.php?page=sec_resetpassword">
    <div class="bg-slate-200">
    <div class="text-slate-200"></div>
    <div class="container mx-auto w-11/12 md:w-2/3 max-w-lg mt-32">
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
                <label for="txtEmail" class="form-label !font-medium !mt-5">Correo
                    Electronico</label>
                <input type="email" name="txtEmail" id="txtEmail" class="form-input " placeholder="Ingrese el correo" value="{{txtEmail}}">
            </div>
            <p class="text-justify mt-6">
                Asegurate de proporcionarnos la direccion con la que fue creada tu cuenta.
            </p>

            <div class="flex justify-center items-center mt-5">
                <button type="submit" class="form-primaryButton">Continuar</button>
                <button class="form-secondaryButton" onclick="modalHandler()">Cancelar</button>
            </div>
        </div>
    </div>
    <div class="mt-80 text-slate-200"></div>
</div>
  </form>
  {{endif showFomrEmail}}


  {{if showFormPassword}}
  <form class="grid" method="post" action="index.php?page=sec_resetpassword&token={{token}}">
    <div class="bg-slate-200">
    <div class="text-slate-200"></div>
    <div class="container mx-auto w-11/12 md:w-2/3 max-w-lg mt-32">
            <!-- contenedor, parte white -->
                    <div class="relative py-8 px-5 md:px-10 bg-white rounded-xl border ">

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
                    <label for="txtPassword" class="form-label !font-medium !mt-5">Nueva Contraseña</label>
                    <input type="password" name="txtPassword" id="txtPassword" class="form-input" placeholder="Ingresar nueva contraseña" value="{{txtPassword}}">
                    <label for="txtPassword2" class="form-label !font-medium !mt-5">Confirmar Contraseña</label>
                    <input type="password" name="txtPassword2" id="txtPassword2" class="form-input" placeholder="Repita la contraseña" value="{{txtPassword2}}">
                </div>
                <div class="flex justify-center items-center mt-10 mb-10">
                    <button type="submit" class="form-primaryButton">Continuar</button>
                    <button class="form-secondaryButton" onclick="modalHandler()">Cancelar</button>
                </div>
            </div>
        </div>
    <div class="mt-80 text-slate-200"></div>
</div>
  </form>
  {{endif showFormPassword}}