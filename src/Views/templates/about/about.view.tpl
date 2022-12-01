<div class="">
    {{include common/navbar}}
</div>
<div class="grid grid-cols-5">
    <div class="h-[80rem] bg-white">
        <p class="pl-10 pt-10 text-black-400 text-xl font-bold lg:text-2xl">Multiservicios</p>
        <p class="pl-10 border-b-4 border-white font-normal text-black-400 text-xs">Sysadmin Panel</p>

            <div class="ml-10 rounded-lg mb-2 bg-zinc-100 w-8/12 bg-gradient-to-r text-black-400 hover:text-white hover:from-green-400 hover:to-blue-500 ">
                <div class="flex flex-row">
                    <img class="w-7 h-7 m-2 justify-start rounded-full" src="https://picsum.photos/500/500" alt=".">
                    <div class="flex flex-col mt-1.5">
                        <p class="text-xs font-medium">Javier Tabora </p>
                        <p class="text-xs">Carpintero</p>
                    </div>
                </div>
            </div>

        <p class="pl-10 pt-4 border-t-4 border-multiDarkBlue text-black-400 font-semibold text-sm"></p>
        <p type="button"
            class="ml-10 mr-10 mb-5 px-4 py-3 text-black-400 hover:text-white bg-gradient-to-r border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500 ">
            Zonas de operacion
        </p>
        <p type="button"
            class="ml-10 mr-10 mb-5 px-4 py-3 text-black-400 hover:text-white bg-gradient-to-r border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500 ">
            Reseñas del Sitio
        </p>
        <p type="button"
            class="ml-10 mr-10 mb-5 px-4 py-3 text-black-400 hover:text-white bg-gradient-to-r border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500 ">
            Proveedores
        </p>
        <p type="button"
            class="ml-10 mr-10 mb-5 px-4 py-3 text-black-400 hover:text-white bg-gradient-to-r border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500 ">
            Oscar
        </p>
        <p type="button"
            class="ml-10 mr-10 mb-5 px-4 py-3 text-black-400 hover:text-white bg-gradient-to-r border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500 ">
            Raul
        </p>
        <p type="button"
            class="ml-10 mr-10 mb-5 px-4 py-3 text-black-400 hover:text-white bg-gradient-to-r border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500 ">
            Elvis
        </p>
        <p type="button"
            class="ml-10 mr-10 mb-5 px-4 py-3 text-black-400 hover:text-white bg-gradient-to-r border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500 ">
            Francis
        </p>


        
    </div>

    <div class="p-10 bg-multiLightGray col-span-4 ">
        
        <div>
            <h1 class="multi-titleG2">Lorem ipsum dolor</h1>
            <button type="button" class="mt-4 px-4 py-2 text-black-400 text-white hover:text-white bg-gradient-to-r bg-blue-500 border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500">Primario</button>
        </div>

        <div class="grid grid-cols-3 gap-4 mt-10">
            <div class="h-[80rem] rounded-lg bg-white">
                <div class="grid grid-rows-1 m-5 rounded-lg h-[20rem] bg-multiDarkGray">

                </div>
            </div>
            <div class="h-[80rem] rounded-lg bg-white">

            </div>
            <div class="h-[80rem] rounded-lg bg-white">

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


    </fieldset>
</div>
<div class="p-10">
    <div>
        <label for="" class="form-label">Titulo 1</label>
        <h1 class="multi-titleG1">Lorem ipsum dolor</h1>
    </div>
    <div>
        <label for="" class="form-label">Titulo 2</label>
        <h1 class="multi-titleG2">Lorem ipsum dolor</h1>
    </div>
</div>