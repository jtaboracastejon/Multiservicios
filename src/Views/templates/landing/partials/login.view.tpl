<div>
    <div class="py-44 bg-black bg-opacity-80 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0"
        id="modalLogin" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <!-- contenedor, parte white -->
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded-3xl shadow-lg border border-gray-400">
                <!-- Aquí podes meter código -->
                <div>
                    <h1 class="multi-titleG2 !text-center">Iniciar Sesión</h1>
                </div>
                <form action="">
                <fieldset>
                    <label for="inputField" class="form-label !font-semibold !mt-5">Usuario</label>
                    <input type="text" name="txtEmail" id="txtEmail" class="form-input" placeholder="johdoe12">
                    <p class="text-multiDanger" id="emailError"></p>
                    <label for="inputField" class="form-label !font-semibold !mt-5" >Contraseña</label>
                    <input type="password" name="txtPswd" id="txtPswd" class="form-input" placeholder="">
                    <p class="text-multiDanger" id="pswdError"></p>
                    <a href="#" class="form-helperLink !text-right">¿Olvido su contraseña?</a>
                    <div class="flex justify-center items-center mt-5">
                        <button type="button" class="form-primaryButton" name="btnLogin" id="btnLogin"  onclick="return clickLogin()">Continuar</button>
                        <button type="button" class="form-secondaryButton" onclick="modalHandler1(false, 'modalLogin')">Cancelar</button>
                    </div>
                </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>