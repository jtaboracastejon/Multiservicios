<div>
    <div class="py-44 bg-black bg-opacity-80 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0"
        id="modal" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <!-- contenedor, parte white -->
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded-3xl shadow-lg border border-gray-400">
                <!-- Aquí podes meter código -->
                <div>
                    <h1 class="multi-titleG2 !text-center">Unete a nosotros</h1>
                </div>
                <fieldset>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="grid grid-rows-1">
                            <div class="flex items-center mb-4 mt-10 border-2 rounded-lg ">
                                <input id="default-checkbox" type="checkbox" value="" class="form-checkbox">
                                <label for="default-checkbox" class="form-checkboxRadioLabel">Cliente</label>
                            </div>

                        </div>
                        <div class="flex items-center mb-4 mt-10 border-2 rounded-lg ">
                            <input checked id="checked-checkbox" type="checkbox" value="" class="form-checkbox">
                            <label for="checked-checkbox" class="form-checkboxRadioLabel">Casilla 2</label>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <label for="inputField" class="form-label !font-semibold !mt-5">Correo
                        Electronico/Usuario</label>
                    <input type="text" name="inputField" id="inputField" class="form-input" placeholder="Input Field">
                    <button type="button" class="form-primaryButton !ml-36 !mt-3">Continuar</button>
                    <p class="form-helper !text-center">Al hacer clic en continuar usted acepta que su correo sera almacenado y
                        compartido dentro
                        de nuestra empresa dentro de los <a href="#" class="form-helperLink">Términos y condiciones</a>.
                    </p>
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