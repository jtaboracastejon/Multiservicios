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

    <div>
        <label class="form-label" for="select">Checkboxes</label>
        <div class="flex items-center mb-4">
            <input id="default-checkbox" type="checkbox" value="" class="form-checkbox">
            <label for="default-checkbox" class="form-checkboxLabel">Rol 1</label>
        </div>
        <div class="flex items-center">
            <input checked id="checked-checkbox" type="checkbox" value="" class="form-checkbox">
            <label for="checked-checkbox" class="form-checkboxLabel">Rol 2</label>
        </div>
    </div>
</div>