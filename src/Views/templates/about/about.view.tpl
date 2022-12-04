<div class="bg-no-repeat bg-cover bg-center">
    {{include common/navbar}}
</div>

<div class="mt-4 ml-10">
    <a href="#" class="form-helperLink">Inicio</a>
    <a href="#" class="mx-1">></a>
    <a href="#" class="form-helperLink">Plomeria</a>
</div>

<div class="ml-5">
    <div class="flex">
        <div class="w-2/12 mr-10 border-r-4 border-multiDarkBlue p-4 text-3xl font-bold">
            Plomeria
        </div>
        <div class="w-10/12 ml-10 mt-2 p-2 text-sm">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora quaerat pariatur accusantium ad non
            corrupti odit id sequi. Optio voluptatem deleniti nihil minus omnis error quaerat vel quis ipsa dolores?
        </div>
    </div>
</div>

<div class="grid grid-cols-12 mt-2 bg-multiDarkBlue h-[74px] w-[1453] gap-4">
    <div class="col-span-2 mb-2 my-2 ml-10">
        <fieldset>
            <label for="inputField" class="form-label !mb-0.5 !text-white">Presupuesto Min.</label>
            <input type="text" name="inputField" id="inputField" class="form-input !text-sm !px-2 !py-1 !h-7 !w-44"
                placeholder="Input Field">
        </fieldset>
    </div>

    <div class="col-span-2 my-2 mx-6">
        <fieldset>
            <label for="inputField" class="form-label !mb-0.5 !text-white">Clasificacion</label>
            <input type="text" name="inputField" id="inputField" class="form-input !text-sm !px-2 !py-1 !h-7 !w-44"
                placeholder="Input Field">
        </fieldset>
    </div>

    <div class="col-span-3 mt-7 ml-24">
        <select name="select" id="select" class="form-select !text-sm !px-2 !py-1 !h-7 !w-64">
            <option value="">Tiempo en la plataforma</option>
            <option value="">2</option>
            <option value="">3</option>
        </select>
    </div>

    <div class="col-span-5 mt-7 ml-56">
        <input type="text" placeholder="Buscar plomero en especifico" class="text-sm rounded-l-lg px-2 w-64 py-1">
        <a href="" class="bg-multiDarkYellow p-1.5 w-52 text-white rounded-r-lg text-sm">
            <i class="fa-solid fa-magnifying-glass"></i>
        </a>
    </div>
</div>

<div class="mt-9 ml-9 mr-9 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-4 gap-10 2xl:gap-20">
    <!-- Inicia Tarjeta-->
    <div class="border-[2px] border-multiDarkBlue">
        <div class="z-0 grid h-56 bg-[url('https://picsum.photos/500/500')] bg-cover">
            <div class="z-10">
                <div class="rounded-r-md w-32 shadow-md border-l-transparent bg-black bg-opacity-90 mt-5 p-1">
                    <span class="text-white font-medium text-sm">Patrocinado</span>
                </div>
            </div>
            <div class="z-10 grid place-items-end">
                <div class="p-2 rounded-tl-lg bg-white text-center">
                    <div class="flex items-center justify-center">
                        <i class="fa-solid fa-star text-multiDarkYellow mr-3"></i>
                        <span class="font-semibold text-lg">4.5</span>
                    </div>
                    <span class="text-xs text-gray-500">Calificación</span>
                </div>
            </div>
        </div>
        <div class="grid grid-cols-5">
            <div class="grid col-span-5 lg:col-span-3 m-3">
                <div class="flex flex-row ">
                    <img class="w-12 h-12 m-2 justify-start rounded-full object-cover"
                        src="https://picsum.photos/500/500" alt=".">
                    <div class="flex flex-col my-auto">
                        <p class="text-xs font-medium">Javier Tabora</p>
                        <p class="text-xs">Carpintero</p>
                    </div>
                </div>
                <p class="text-xs text-justify">1 Joven emprendedor con su nuevo negocio, en el cual nos ofrece una
                    gran variedad de trabajos en la madera, con bellos acabados y delineados únicos que solamente el
                    ofrece.
                    Llame al 9090-4040 para mas información.
                </p>
            </div>
            <!-- Contenedor de botones-->
            <div class="col-span-5 lg:col-span-2 border-l-[1px] border-gray-400 p-2 my-auto">
                <div class="rounded-full py-1 px-3 border border-gray-400 flex flex-row items-center">
                    <i class="fa-solid fa-circle-check text-multiDarkYellow"></i>
                    <h3 class="text-xs text-multiDarkBlue font-medium mx-auto">Verificado</h3>
                    <a href="">
                        <i class="fa-solid fa-circle-question text-zinc-400 "></i>
                    </a>
                </div>
                <!-- Botón Pro -->
                <div class="mt-4 rounded-full bg-multiDarkBlue py-1 px-4 flex flex-row items-center">
                    <i class="fa-solid fa-screwdriver-wrench text-xs text-multiDarkYellow"></i>
                    <span class="text-xs text-white font-medium mx-auto">Pro</span>
                    <a href="">
                        <i class="fa-solid fa-circle-question text-zinc-400"></i>
                    </a>
                </div>
                <div class="text-center mt-4">
                    <p class="text-xs font-medium text-gray-400">Tiempo en la plataforma</p>
                    <p class="text-xs font-medium">4 Meses</p>
                </div>
            </div>
        </div>
        <a href="" class="m-4 bg-green-600 rounded-2xl py-2 flex flex-row items-center justify-center ">
            <i class="fa-solid fa-paper-plane text-white mr-4"></i>
            <span href="" class="text-white font-semibold ">Contactar</span>
        </a>
    </div>
    <!-- Fin Tarjeta-->

    <!-- Inicia Tarjeta-->
    <div class="border-[2px] border-multiDarkBlue">
        <div class="z-0 grid h-56 bg-[url('https://picsum.photos/500/500')] bg-cover">
            <div class="z-10">
                <div class="rounded-r-md w-32 shadow-md border-l-transparent bg-black bg-opacity-90 mt-5 p-1">
                    <span class="text-white font-medium text-sm">Patrocinado</span>
                </div>
            </div>
            <div class="z-10 grid place-items-end">
                <div class="p-2 rounded-tl-lg bg-white text-center">
                    <div class="flex items-center justify-center">
                        <i class="fa-solid fa-star text-multiDarkYellow mr-3"></i>
                        <span class="font-semibold text-lg">4.5</span>
                    </div>
                    <span class="text-xs text-gray-500">Calificación</span>
                </div>
            </div>
        </div>
        <div class="grid grid-cols-5">
            <div class="grid col-span-5 lg:col-span-3 m-3">
                <div class="flex flex-row ">
                    <img class="w-12 h-12 m-2 justify-start rounded-full object-cover"
                        src="https://picsum.photos/500/500" alt=".">
                    <div class="flex flex-col my-auto">
                        <p class="text-xs font-medium">Javier Tabora</p>
                        <p class="text-xs">Carpintero</p>
                    </div>
                </div>
                <p class="text-xs text-justify">1 Joven emprendedor con su nuevo negocio, en el cual nos ofrece una
                    gran variedad de trabajos en la madera, con bellos acabados y delineados únicos que solamente el
                    ofrece.
                    Llame al 9090-4040 para mas información.
                </p>
            </div>
            <!-- Contenedor de botones-->
            <div class="col-span-5 lg:col-span-2 border-l-[1px] border-gray-400 p-2 my-auto">
                <div class="rounded-full py-1 px-3 border border-gray-400 flex flex-row items-center">
                    <i class="fa-solid fa-circle-check text-multiDarkYellow"></i>
                    <h3 class="text-xs text-multiDarkBlue font-medium mx-auto">Verificado</h3>
                    <a href="">
                        <i class="fa-solid fa-circle-question text-zinc-400 "></i>
                    </a>
                </div>
                <!-- Botón Pro -->
                <div class="mt-4 rounded-full bg-multiDarkBlue py-1 px-4 flex flex-row items-center">
                    <i class="fa-solid fa-screwdriver-wrench text-xs text-multiDarkYellow"></i>
                    <span class="text-xs text-white font-medium mx-auto">Pro</span>
                    <a href="">
                        <i class="fa-solid fa-circle-question text-zinc-400"></i>
                    </a>
                </div>
                <div class="text-center mt-4">
                    <p class="text-xs font-medium text-gray-400">Tiempo en la plataforma</p>
                    <p class="text-xs font-medium">4 Meses</p>
                </div>
            </div>
        </div>
        <a href="" class="m-4 bg-green-600 rounded-2xl py-2 flex flex-row items-center justify-center ">
            <i class="fa-solid fa-paper-plane text-white mr-4"></i>
            <span href="" class="text-white font-semibold ">Contactar</span>
        </a>
    </div>
    <!-- Fin Tarjeta-->

    <!-- Inicia Tarjeta-->
    <div class="border-[2px] border-multiDarkBlue">
        <div class="z-0 grid h-56 bg-[url('https://picsum.photos/500/500')] bg-cover">
            <div class="z-10">
                <div class="rounded-r-md w-32 shadow-md border-l-transparent bg-black bg-opacity-90 mt-5 p-1">
                    <span class="text-white font-medium text-sm">Patrocinado</span>
                </div>
            </div>
            <div class="z-10 grid place-items-end">
                <div class="p-2 rounded-tl-lg bg-white text-center">
                    <div class="flex items-center justify-center">
                        <i class="fa-solid fa-star text-multiDarkYellow mr-3"></i>
                        <span class="font-semibold text-lg">4.5</span>
                    </div>
                    <span class="text-xs text-gray-500">Calificación</span>
                </div>
            </div>
        </div>
        <div class="grid grid-cols-5">
            <div class="grid col-span-5 lg:col-span-3 m-3">
                <div class="flex flex-row ">
                    <img class="w-12 h-12 m-2 justify-start rounded-full object-cover"
                        src="https://picsum.photos/500/500" alt=".">
                    <div class="flex flex-col my-auto">
                        <p class="text-xs font-medium">Javier Tabora</p>
                        <p class="text-xs">Carpintero</p>
                    </div>
                </div>
                <p class="text-xs text-justify">1 Joven emprendedor con su nuevo negocio, en el cual nos ofrece una
                    gran variedad de trabajos en la madera, con bellos acabados y delineados únicos que solamente el
                    ofrece.
                    Llame al 9090-4040 para mas información.
                </p>
            </div>
            <!-- Contenedor de botones-->
            <div class="col-span-5 lg:col-span-2 border-l-[1px] border-gray-400 p-2 my-auto">
                <div class="rounded-full py-1 px-3 border border-gray-400 flex flex-row items-center">
                    <i class="fa-solid fa-circle-check text-multiDarkYellow"></i>
                    <h3 class="text-xs text-multiDarkBlue font-medium mx-auto">Verificado</h3>
                    <a href="">
                        <i class="fa-solid fa-circle-question text-zinc-400 "></i>
                    </a>
                </div>
                <!-- Botón Pro -->
                <div class="mt-4 rounded-full bg-multiDarkBlue py-1 px-4 flex flex-row items-center">
                    <i class="fa-solid fa-screwdriver-wrench text-xs text-multiDarkYellow"></i>
                    <span class="text-xs text-white font-medium mx-auto">Pro</span>
                    <a href="">
                        <i class="fa-solid fa-circle-question text-zinc-400"></i>
                    </a>
                </div>
                <div class="text-center mt-4">
                    <p class="text-xs font-medium text-gray-400">Tiempo en la plataforma</p>
                    <p class="text-xs font-medium">4 Meses</p>
                </div>
            </div>
        </div>
        <a href="" class="m-4 bg-green-600 rounded-2xl py-2 flex flex-row items-center justify-center ">
            <i class="fa-solid fa-paper-plane text-white mr-4"></i>
            <span href="" class="text-white font-semibold ">Contactar</span>
        </a>
    </div>
    <!-- Fin Tarjeta-->

    <!-- Inicia Tarjeta-->
    <div class="border-[2px] border-multiDarkBlue">
        <div class="z-0 grid h-56 bg-[url('https://picsum.photos/500/500')] bg-cover">
            <div class="z-10">
                <div class="rounded-r-md w-32 shadow-md border-l-transparent bg-black bg-opacity-90 mt-5 p-1">
                    <span class="text-white font-medium text-sm">Patrocinado</span>
                </div>
            </div>
            <div class="z-10 grid place-items-end">
                <div class="p-2 rounded-tl-lg bg-white text-center">
                    <div class="flex items-center justify-center">
                        <i class="fa-solid fa-star text-multiDarkYellow mr-3"></i>
                        <span class="font-semibold text-lg">4.5</span>
                    </div>
                    <span class="text-xs text-gray-500">Calificación</span>
                </div>
            </div>
        </div>
        <div class="grid grid-cols-5">
            <div class="grid col-span-5 lg:col-span-3 m-3">
                <div class="flex flex-row ">
                    <img class="w-12 h-12 m-2 justify-start rounded-full object-cover"
                        src="https://picsum.photos/500/500" alt=".">
                    <div class="flex flex-col my-auto">
                        <p class="text-xs font-medium">Javier Tabora</p>
                        <p class="text-xs">Carpintero</p>
                    </div>
                </div>
                <p class="text-xs text-justify">1 Joven emprendedor con su nuevo negocio, en el cual nos ofrece una
                    gran variedad de trabajos en la madera, con bellos acabados y delineados únicos que solamente el
                    ofrece.
                    Llame al 9090-4040 para mas información.
                </p>
            </div>
            <!-- Contenedor de botones-->
            <div class="col-span-5 lg:col-span-2 border-l-[1px] border-gray-400 p-2 my-auto">
                <div class="rounded-full py-1 px-3 border border-gray-400 flex flex-row items-center">
                    <i class="fa-solid fa-circle-check text-multiDarkYellow"></i>
                    <h3 class="text-xs text-multiDarkBlue font-medium mx-auto">Verificado</h3>
                    <a href="">
                        <i class="fa-solid fa-circle-question text-zinc-400 "></i>
                    </a>
                </div>
                <!-- Botón Pro -->
                <div class="mt-4 rounded-full bg-multiDarkBlue py-1 px-4 flex flex-row items-center">
                    <i class="fa-solid fa-screwdriver-wrench text-xs text-multiDarkYellow"></i>
                    <span class="text-xs text-white font-medium mx-auto">Pro</span>
                    <a href="">
                        <i class="fa-solid fa-circle-question text-zinc-400"></i>
                    </a>
                </div>
                <div class="text-center mt-4">
                    <p class="text-xs font-medium text-gray-400">Tiempo en la plataforma</p>
                    <p class="text-xs font-medium">4 Meses</p>
                </div>
            </div>
        </div>
        <a href="" class="m-4 bg-green-600 rounded-2xl py-2 flex flex-row items-center justify-center ">
            <i class="fa-solid fa-paper-plane text-white mr-4"></i>
            <span href="" class="text-white font-semibold ">Contactar</span>
        </a>
    </div>
    <!-- Fin Tarjeta-->

    <!-- Inicia Tarjeta-->
    <div class="border-[2px] border-multiDarkBlue">
        <div class="z-0 grid h-56 bg-[url('https://picsum.photos/500/500')] bg-cover">
            <div class="z-10">
                <div class="rounded-r-md w-32 shadow-md border-l-transparent bg-black bg-opacity-90 mt-5 p-1">
                    <span class="text-white font-medium text-sm">Patrocinado</span>
                </div>
            </div>
            <div class="z-10 grid place-items-end">
                <div class="p-2 rounded-tl-lg bg-white text-center">
                    <div class="flex items-center justify-center">
                        <i class="fa-solid fa-star text-multiDarkYellow mr-3"></i>
                        <span class="font-semibold text-lg">4.5</span>
                    </div>
                    <span class="text-xs text-gray-500">Calificación</span>
                </div>
            </div>
        </div>
        <div class="grid grid-cols-5">
            <div class="grid col-span-5 lg:col-span-3 m-3">
                <div class="flex flex-row ">
                    <img class="w-12 h-12 m-2 justify-start rounded-full object-cover"
                        src="https://picsum.photos/500/500" alt=".">
                    <div class="flex flex-col my-auto">
                        <p class="text-xs font-medium">Javier Tabora</p>
                        <p class="text-xs">Carpintero</p>
                    </div>
                </div>
                <p class="text-xs text-justify">1 Joven emprendedor con su nuevo negocio, en el cual nos ofrece una
                    gran variedad de trabajos en la madera, con bellos acabados y delineados únicos que solamente el
                    ofrece.
                    Llame al 9090-4040 para mas información.
                </p>
            </div>
            <!-- Contenedor de botones-->
            <div class="col-span-5 lg:col-span-2 border-l-[1px] border-gray-400 p-2 my-auto">
                <div class="rounded-full py-1 px-3 border border-gray-400 flex flex-row items-center">
                    <i class="fa-solid fa-circle-check text-multiDarkYellow"></i>
                    <h3 class="text-xs text-multiDarkBlue font-medium mx-auto">Verificado</h3>
                    <a href="">
                        <i class="fa-solid fa-circle-question text-zinc-400 "></i>
                    </a>
                </div>
                <!-- Botón Pro -->
                <div class="mt-4 rounded-full bg-multiDarkBlue py-1 px-4 flex flex-row items-center">
                    <i class="fa-solid fa-screwdriver-wrench text-xs text-multiDarkYellow"></i>
                    <span class="text-xs text-white font-medium mx-auto">Pro</span>
                    <a href="">
                        <i class="fa-solid fa-circle-question text-zinc-400"></i>
                    </a>
                </div>
                <div class="text-center mt-4">
                    <p class="text-xs font-medium text-gray-400">Tiempo en la plataforma</p>
                    <p class="text-xs font-medium">4 Meses</p>
                </div>
            </div>
        </div>
        <a href="" class="m-4 bg-green-600 rounded-2xl py-2 flex flex-row items-center justify-center ">
            <i class="fa-solid fa-paper-plane text-white mr-4"></i>
            <span href="" class="text-white font-semibold ">Contactar</span>
        </a>
    </div>
    <!-- Fin Tarjeta-->

    <!-- Inicia Tarjeta-->
    <div class="border-[2px] border-multiDarkBlue">
        <div class="z-0 grid h-56 bg-[url('https://picsum.photos/500/500')] bg-cover">
            <div class="z-10">
                <div class="rounded-r-md w-32 shadow-md border-l-transparent bg-black bg-opacity-90 mt-5 p-1">
                    <span class="text-white font-medium text-sm">Patrocinado</span>
                </div>
            </div>
            <div class="z-10 grid place-items-end">
                <div class="p-2 rounded-tl-lg bg-white text-center">
                    <div class="flex items-center justify-center">
                        <i class="fa-solid fa-star text-multiDarkYellow mr-3"></i>
                        <span class="font-semibold text-lg">4.5</span>
                    </div>
                    <span class="text-xs text-gray-500">Calificación</span>
                </div>
            </div>
        </div>
        <div class="grid grid-cols-5">
            <div class="grid col-span-5 lg:col-span-3 m-3">
                <div class="flex flex-row ">
                    <img class="w-12 h-12 m-2 justify-start rounded-full object-cover"
                        src="https://picsum.photos/500/500" alt=".">
                    <div class="flex flex-col my-auto">
                        <p class="text-xs font-medium">Javier Tabora</p>
                        <p class="text-xs">Carpintero</p>
                    </div>
                </div>
                <p class="text-xs text-justify">1 Joven emprendedor con su nuevo negocio, en el cual nos ofrece una
                    gran variedad de trabajos en la madera, con bellos acabados y delineados únicos que solamente el
                    ofrece.
                    Llame al 9090-4040 para mas información.
                </p>
            </div>
            <!-- Contenedor de botones-->
            <div class="col-span-5 lg:col-span-2 border-l-[1px] border-gray-400 p-2 my-auto">
                <div class="rounded-full py-1 px-3 border border-gray-400 flex flex-row items-center">
                    <i class="fa-solid fa-circle-check text-multiDarkYellow"></i>
                    <h3 class="text-xs text-multiDarkBlue font-medium mx-auto">Verificado</h3>
                    <a href="">
                        <i class="fa-solid fa-circle-question text-zinc-400 "></i>
                    </a>
                </div>
                <!-- Botón Pro -->
                <div class="mt-4 rounded-full bg-multiDarkBlue py-1 px-4 flex flex-row items-center">
                    <i class="fa-solid fa-screwdriver-wrench text-xs text-multiDarkYellow"></i>
                    <span class="text-xs text-white font-medium mx-auto">Pro</span>
                    <a href="">
                        <i class="fa-solid fa-circle-question text-zinc-400"></i>
                    </a>
                </div>
                <div class="text-center mt-4">
                    <p class="text-xs font-medium text-gray-400">Tiempo en la plataforma</p>
                    <p class="text-xs font-medium">4 Meses</p>
                </div>
            </div>
        </div>
        <a href="" class="m-4 bg-green-600 rounded-2xl py-2 flex flex-row items-center justify-center ">
            <i class="fa-solid fa-paper-plane text-white mr-4"></i>
            <span href="" class="text-white font-semibold ">Contactar</span>
        </a>
    </div>
    <!-- Fin Tarjeta-->

</div>