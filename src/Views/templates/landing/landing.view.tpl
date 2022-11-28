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
<div class="bg-multiDarkBlue pt-2 mt-10">
    <div class="mx-10 mt-16">
        <h1 class="font-bold text-xl text-white">
            Conoce las areas con personal capacitado
        </h1>
    </div>
    <div>
        {{include common/scrollbar2}}
    </div>
</div>

<div>
    {{include common/barra}}
</div>
<div class="mx-10 mt-16">
    <div class="font-bold text-xl">Visto recientemente en tu zona</div>

    <div class="mt-9 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-4 gap-10 2xl:gap-20">
        <!-- Inicia Tarjeta-->
        {{foreach cards}}
        <div class="border-[2px] border-multiDarkBlue">
            <div class="z-0 grid h-56 bg-[url('{{imgportada}}')] bg-cover">
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
                            src="{{imgprofile}}" alt=".">
                        <div class="flex flex-col my-auto">
                            <p class="text-xs font-medium">{{name}}</p>
                            <p class="text-xs">{{servicename}}</p>
                        </div>
                    </div>
                    <p class="text-xs text-justify">
                        {{decription}}
                    </p>
                </div>
                <!-- Contenedor de botones-->
                <div class="col-span-5 lg:col-span-2 border-l-[1px] border-gray-400 p-2 my-auto">
                    {{if isVerified}}
                    <div class="rounded-full py-1 px-3 border border-gray-400 flex flex-row items-center">
                        <i class="fa-solid fa-circle-check text-multiDarkYellow"></i>
                        <h3 class="text-xs text-multiDarkBlue font-medium mx-auto">Verificado</h3>
                        <a href="">
                            <i class="fa-solid fa-circle-question text-zinc-400 "></i>
                        </a>
                    </div>
                    {{endif isVerified}}

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
                        <p class="text-xs font-medium">{{tiempoPlataforma}}</p>
                    </div>
                </div>
            </div>
            <a href="" class="m-4 bg-green-600 rounded-2xl py-2 flex flex-row items-center justify-center ">
                <i class="fa-solid fa-paper-plane text-white mr-4"></i>
                <span href="" class="text-white font-semibold ">Contactar</span>
            </a>
        </div>
        {{endfor cards}}
        <!-- Fin Tarjeta-->
    </div>
</div>
<div class="mt-10">
    <div class="lg:z-0  w-full flex items-center bg-cover bg-center bg-no-repeat bg-[url('../public/svgs/multi-patternYellow.svg')]">
        <div class="items-center lg:ml-52">
            <h1 class="font-extrabold text-lg lg:text-5xl lg:w-7/12 text-white">
                ¿Eres alguien con habilidades en reparaciones?
            </h1>
            <div class="rounded-full bg-multiDarkBlue mt-10 w-40">
                <a class="font-semibold text-white text-xl text-center p-2.5">
                    Únete ahora
                </a>
            </div>
        </div>
        <div class="hidden lg:block z-10 right-0 mr-20">

            <img src="../{{BASE_DIR}}/public/imgs/landing/proveedor.png" class="object-cover max-h-full relative -mt-5" alt="">
        </div>
    </div>
</div>
<div class="m-10">
    <p class="text-xl font-bold">Reseñas</p>
</div>
<div class="flex rounded-2xl m-10" style="box-shadow: -1px 10px 30px 5px rgba(0,0,0,0.2);">
    <div class=" w2/12">
        <p class="text-6xl font-bold m-10">
            "
        </p>
    </div>

    <div class="w8/12 m-10">
        <p class="text-xl">
            {{review}}
        </p>
        <p class="font-semibold text-lg text-center mt-5">
            {{name}}
        </p>
        <p class="italic text-center">
            {{address}}
        </p>
    </div>

    <div class="w2/12 flex items-end">
        <p class="text-6xl font-bold m-10 ">
            "
        </p>
    </div>
</div>
{{include joinus/joinus2}}