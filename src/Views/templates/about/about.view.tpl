<div class="bg-no-repeat bg-cover bg-center bg-[url('../public/imgs/landing/plumber.jpg')]">
    {{include common/navbar}}
</div>


<div class="m-5 p-5">
    <div class="flex">
        <div class="w-2/12 mr-10 border-r-4 border-multiDarkBlue p-4 text-3xl font-bold">
            Plomeria
        </div>
        <div class="w-10/12 ml-10 p-2 text-xl">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora quaerat pariatur accusantium ad non
            corrupti odit id sequi. Optio voluptatem deleniti nihil minus omnis error quaerat vel quis ipsa dolores?
        </div>
    </div>
</div>

<div class="flex bg-multiDarkBlue p-4">
    <div class="grid grid-cols-5 gap-[12rem] ml-10">
        <div class="">
            <fieldset>
                <label for="inputField" class="form-label !text-white">Presupuesto Min.</label>
                <input type="text" name="inputField" id="inputField" class="form-input" placeholder="Input Field">
            </fieldset>
        </div>
        <div class="">
            <fieldset>
                <label for="inputField" class="form-label !text-white">Clasificacion</label>
                <input type="text" name="inputField" id="inputField" class="form-input" placeholder="Input Field">
            </fieldset>
        </div>
        <div class="">
            <fieldset>
                <select name="select" id="select" class="form-select m-6">
                    <option value="">Tiempo en la plataforma</option>
                    <option value="">2</option>
                    <option value="">3</option>
                </select>
            </fieldset>
        </div>
        <div class="mt-6 w-full col-span-2">
            <input type="text" placeholder="Buscar plomero en especifico" class="text-xl rounded-l-xl px-5 w-96 py-2">
            <a href="" class="bg-multiDarkYellow px-5 py-2.5 text-white rounded-r-xl text-xl">
                <i class="fa-solid fa-magnifying-glass"></i>
            </a>
        </div>
    </div>