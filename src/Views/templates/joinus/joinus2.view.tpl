<div>
    <div class="py-44 bg-black bg-opacity-80 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0"
        id="modal" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <!-- contenedor, parte white -->
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded-3xl shadow-lg border border-gray-400">
                <!-- Aquí podes meter código -->
                <div class="flex items-center">
                    <p class="form-helper !m-0">
                        Datos Personales.
                    </p>
                    <a href="#"
                        class="form-helperLink !border-l-2 !px-2 !mr-4 !border-multiDarkBlue !ml-4">Proveedor</a>
                </div>
                <fieldset>
                    <label for="inputField" class="form-label !font-medium !mt-5">Correo
                        Electronico/Usuario</label>
                    <input type="text" name="inputField" id="inputField" class="form-input" placeholder="Input Field">
                </fieldset>
                <fieldset>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="grid grid-rows-1">
                            <label for="inputField" class="form-label !font-medium !mt-5">Correo
                                Electronico/Usuario</label>
                            <input type="text" name="inputField" id="inputField" class="form-input "
                                placeholder="Input Field">
                        </div>
                        <div>
                            <label for="inputField" class="form-label !font-medium !mt-5">Correo
                                Electronico/Usuario</label>
                            <input type="text" name="inputField" id="inputField" class="form-input"
                                placeholder="Input Field">
                        </div>
                    </div>
                    <div>
                        <p class="form-helper">Utiliza ocho caracteres como mínimo con una combinación de
                            letras, números y símbolos
                        </p>
                    </div>
                    <div class="grid grid-cols-3 gap-4">
                        <div class="grid grid-rows-1">
                            <label for="inputField" class="form-label !font-medium !mt-5">Departamento</label>
                            <select name="select" id="select" class="form-select">
                                <option value="">Copan</option>
                                <option value="">2</option>
                                <option value="">3</option>
                            </select>
                        </div>
                        <div class="grid col-span-2">
                            <label for="inputField" class="form-label !font-medium !mt-5">Municipio</label>
                            <select name="select" id="select" class="form-select">
                                <option value="">Santa Rosa de Copan</option>
                                <option value="">2</option>
                                <option value="">3</option>
                            </select>
                        </div>
                    </div>
                    <button type="button" class="form-primaryButton !ml-36 !mt-3">Continuar</button>
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