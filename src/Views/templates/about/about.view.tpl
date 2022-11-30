<div class="">
    {{include common/navbar}}
</div>
<div class="grid grid-cols-5">
    <div class="h-[80rem] bg-multiDarkBlue">
        <p class="pl-10 pt-10 text-white text-xl font-bold lg:text-2xl">Multiservicios</p>
        <p class="pl-10 border-b-4 border-white font-normal text-white text-xs">Sysadmin Panel</p>
        <p class="pl-10 pt-10 text-white font-semibold text-sm">Zonas de Operacion</p>
        <p class="pl-10 pt-10 text-white font-semibold text-sm">Reseñas del Sitio</p>
        <p class="pl-10 pt-10 text-white font-semibold text-sm">Proveedores</p>
    </div>

    <div class="bg-multiDarkGray col-span-4 ">
        <p></p>
        <div class="m-10 overflow-x-auto relative">
            <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                    <tr>
                        <th scope="col" class="py-3 px-6">
                            Product name
                        </th>
                        <th scope="col" class="py-3 px-6">
                            Color
                        </th>
                        <th scope="col" class="py-3 px-6">
                            Category
                        </th>
                        <th scope="col" class="py-3 px-6">
                            Price
                        </th>
                        <th scope="col" class="py-3 px-6">
                            Actions
                        </th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                        <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            Apple MacBook Pro 17"
                        </th>
                        <td class="py-4 px-6">
                            Sliver
                        </td>
                        <td class="py-4 px-6">
                            Laptop
                        </td>
                        <td class="py-4 px-6">
                            $2999
                        </td>
                        <td class="py-4 px-6">
                            <i class="fa-solid fa-pen-to-square p-4"></i>
                            <i class="fa-solid fa-trash"></i>
                        </td>
                    </tr>
                    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                        <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            Microsoft Surface Pro
                        </th>
                        <td class="py-4 px-6">
                            White
                        </td>
                        <td class="py-4 px-6">
                            Laptop PC
                        </td>
                        <td class="py-4 px-6">
                            $1999
                        </td>
                        <td class="py-4 px-6">
                            <i class="fa-solid fa-pen-to-square p-4"></i>
                            <i class="fa-solid fa-trash"></i>
                        </td>
                    </tr>
                    <tr class="bg-white dark:bg-gray-800">
                        <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            Magic Mouse 2
                        </th>
                        <td class="py-4 px-6">
                            Black
                        </td>
                        <td class="py-4 px-6">
                            Accessories
                        </td>
                        <td class="py-4 px-6">
                            $99
                        </td>
                        <td class="py-4 px-6">
                            <i class="fa-solid fa-pen-to-square p-4"></i>
                            <i class="fa-solid fa-trash"></i>
                        </td>
                    </tr>
                  
                </tbody>
            </table>
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