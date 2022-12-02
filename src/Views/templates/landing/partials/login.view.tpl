<div>
    <div class="py-44 bg-black bg-opacity-80 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0"
        id="modal" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <!-- contenedor, parte white -->
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded-3xl shadow-lg border border-gray-400">
                <!-- Aquí podes meter código -->
                <div>
                    <h1 class="multi-titleG2 !text-center">Iniciar Sesión</h1>
                </div>
                <fieldset>
                    <label for="inputField" class="form-label !font-semibold !mt-5">Correo Electronico/Usuario</label>
                    <input type="text" name="inputField" id="inputField" class="form-input" placeholder="Input Field">
                    <p class="text-multiDanger" id="emailError">a</p>
                    <label for="inputField" class="form-label !font-semibold !mt-5">Contraseña</label>
                    <input type="text" name="inputField" id="inputField" class="form-input" placeholder="Input Field">
                    <p class="text-multiDanger" id="pswdError">a</p>
                    <a href="#" class="form-helperLink !text-right">¿Olvido su contraseña?</a>
                    <div class="flex justify-center items-center mt-5">
                        <button type="button" class="form-primaryButton" onclick="">Continuar</button>
                        <button class="form-secondaryButton" onclick="modalHandler()">Cancelar</button>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>

    <script>
        let modal = document.getElementById("modal");
        function modalHandler(val = false) {
            if (val) {
                fadeIn(modal);
            } else {
                fadeOut(modal);
            }
        }
        function fadeOut(el) {
            el.style.opacity = 1;
            (function fade() {
                if ((el.style.opacity -= 0.1) < 0) {
                    el.style.display = "none";
                } else {
                    requestAnimationFrame(fade);
                }
            })();
        }
        function fadeIn(el, display) {
            el.style.opacity = 0;
            el.style.display = display || "flex";
            (function fade() {
                let val = parseFloat(el.style.opacity);
                if (!((val += 0.2) > 1)) {
                    el.style.opacity = val;
                    requestAnimationFrame(fade);
                }
            })();
        }
    </script>

</div>