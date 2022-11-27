<div class="bg-no-repeat bg-cover bg-center bg-[url('../public/imgs/landing/plumber.jpg')]">
    {{include common/navbar}}
    <div class="h-[45rem] grid md:grid-cols-2 md:gap-2 content-center p-10">
        <div class="drop-shadow-2xl">
            <h1 class="font-black text-white text-5xl">Encuentra la persona para resolver tus problemas</h1>
            <div class="mt-4 w-full">
                <input type="text" placeholder="Hora de arreglarlo..." class="text-xl rounded-l-full px-5 py-2 w-9/12">
                <a href="" class="bg-multiDarkBlue px-5 py-3 text-white rounded-r-full text-xl">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="grid gap-6 mb-6 md:grid-cols-2 p-10">
    <!-- Input texto o números -->
    <fieldset>
        <label for="inputField" class="form-label">Input Label</label>
        <input type="text" name="inputField" id="inputField" class="form-input" placeholder="Input Field">
        <p class="form-helper">Al hacer clic en continuar usted acepta que su correo sera almacenado y compartido dentro
            de nuestra empresa dentro de los <a href="#" class="form-helperLink">Términos y condiciones</a>.</p>
    </fieldset>

    <!-- Input para archivos -->
    <fieldset>

        <label class="form-label" for="inputFile">Subir DNI</label>
        <input class="form-inputFile" id="inputFile" name="inputFile" type="file">
        <p class="form-helper">PNG, JPG, JPEG</p>

    </fieldset>

    <fieldset>
        <label class="form-label" for="select">Seleccione un numero</label>
        <select name="select" id="select" class="form-select">
            <option value="">1</option>
            <option value="">2</option>
            <option value="">3</option>
        </select>
    </fieldset>
    <fieldset>
        <label for="txtDateX" class="form-label">Fecha X</label>
        <input type="date" name="txtDateX" class="form-input">
    </fieldset>
    <fieldset>
        <label class="form-label" for="select">Checkboxes & Radio Buttons</label>
        <div class="flex gap-10">
            <div>
                <div class="flex items-center mb-4">
                    <input id="default-checkbox" type="checkbox" value="" class="form-checkbox">
                    <label for="default-checkbox" class="form-checkboxRadioLabel">Casilla 1</label>
                </div>
                <div class="flex items-center">
                    <input checked id="checked-checkbox" type="checkbox" value="" class="form-checkbox">
                    <label for="checked-checkbox" class="form-checkboxRadioLabel">Casilla 2</label>
                </div>
            </div>
            <!-- Inicio radio buttons -->
            <div>
                <div class="flex items-center mb-4">
                    <input id="btnRadio1" type="radio" value="" name="default-radio" class="form-radioButton">
                    <label for="btnRadio1" class="form-checkboxRadioLabel">Radio 1</label>
                </div>
                <div class="flex items-center">
                    <input checked id="btnRadio2" type="radio" value="" name="default-radio" class="form-radioButton">
                    <label for="btnRadio2" class="form-checkboxRadioLabel">Radio 2</label>
                </div>
            </div>
            <!-- Fin radio buttons -->
            <div>
                <div class="flex">
                    <input type="checkbox" id="btnBgChk" class="peer hidden" />
                    <label for="btnBgChk" class="form-checkboxRadioBG">
                        Coloreame</label>
                </div>
            </div>
            <div>
                <div class="flex">
                    <input type="radio" id="btnBgRb1" name="btnBgRbUSO" class="peer hidden" />
                    <label for="btnBgRb1" class="form-checkboxRadioBG">Radio con Bg 1</label>
                </div>
                <div class="flex">
                    <input type="radio" id="btnBgRb2" name="btnBgRbUSO" class="peer hidden" />
                    <label for="btnBgRb2" class="form-checkboxRadioBG">Radio con Bg 2</label>
                </div>
            </div>
        </div>
    </fieldset>
    <fieldset>
        <label for="" class="form-label">Botones</label>
        <button type="button" class="form-primaryButton">Primario</button>
        <button type="button" class="form-secondaryButton">Secundario</button>
        <button type="button" class="form-dangerButton">Peligro</button>
        <button type="button" class="form-warningButton">Precaución</button>
        <button type="button" class="form-successButton">Éxito</button>
    </fieldset>
    <fieldset>


        <label class="inline-flex relative items-center cursor-pointer">
            <input type="checkbox" value="" class="sr-only peer">
            <div class="peer multi-switch">
            </div>
            <span class="ml-3 text-sm font-medium text-gray-900">Cámbiame</span>
        </label>


{{include joinus/login}}