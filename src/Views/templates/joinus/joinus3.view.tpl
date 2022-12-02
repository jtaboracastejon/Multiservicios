<div>
    <div class="py-44 bg-black bg-opacity-80 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0"
        id="modal" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded-3xl shadow-lg border border-gray-400">
                
                <div class="flex justify-between">
                    <h1 class="multi-titleG2 !text-xl !text-center">¡Estas un paso mas cerca!</h1>
                    <button class="" onclick="modalHandler()"><i class="fa-regular fa-circle-xmark"></i></button>
                </div>
                <fieldset>
                    <p class="text-justify">
                        jdoe, antes de que puedas empezar con nosotros, necesitamos verificar tu correo electronico por
                        motivos de seguridad.
                    </p>
                    <p class="text-justify">
                        Se ha enviado un correo con un código de verificación a: jhondoe@realmail.com
                    </p>
                </fieldset>
                <div class="grid grid-cols-1 justify-items-center">
                    <input type="text" name="inputField" id="inputField" class="form-input !w-6/12"
                        placeholder="Código de Seguridad">
                    <button type="button" class="form-primaryButton !align-middle !mt-3 !w-6/12">Continuar</button>
                    
                </div>
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

</div><div>
    <div class="py-44 bg-black bg-opacity-80 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0"
        id="modal" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded-3xl shadow-lg border border-gray-400">
                
                <div class="flex justify-between">
                    <h1 class="multi-titleG2 !text-xl !text-center">¡Estas un paso mas cerca!</h1>
                    <button class="" onclick="modalHandler()"><i class="fa-regular fa-circle-xmark"></i></button>
                </div>
                <fieldset>
                    <p class="text-justify">
                        jdoe, antes de que puedas empezar con nosotros, necesitamos verificar tu correo electronico por
                        motivos de seguridad.
                    </p>
                    <p class="text-justify">
                        Se ha enviado un correo con un código de verificación a: jhondoe@realmail.com
                    </p>
                </fieldset>
                <div class="grid grid-cols-1 justify-items-center">
                    <input type="text" name="inputField" id="inputField" class="form-input !w-6/12"
                        placeholder="Código de Seguridad">
                    <button type="button" class="form-primaryButton !align-middle !mt-3 !w-6/12">Continuar</button>
                    
                </div>
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