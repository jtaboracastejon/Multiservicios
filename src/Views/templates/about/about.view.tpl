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
<div class="mx-10 mt-16">
    <div class="font-bold text-xl">Visto recientemente en tu zona</div>

    <div class="mt-9 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-x-10 2xl:gap-x-20">
        <div class="border-[2px] border-multiDarkBlue">
            <img class="w-full h-56 2xl:h-72 object-cover" src="public/imgs/carpinteria.png" alt="imagen carpei">
            <div class="grid grid-cols-5">
                <div class="grid col-span-5 lg:col-span-3 m-3">
                    <div class="flex flex-row ">
                        <img class="w-12 h-12 m-2 justify-start rounded-full object-cover" src="public/imgs/carpinteria.png"
                            alt=".">
                        <div class="flex flex-col my-auto">
                            <p class="text-xs font-medium">Javier Tabora</p>
                            <p class="text-xs">Carpintero</p>
                        </div>
                    </div>
                    <p class="text-xs text-justify">1 Joven emprendedor con su nuevo negocio, en el cual nos ofrece una
                        gran variedad
                        de trabajos en la madera, con bellos acabados y delineados únicos que solamente el ofrece.
                        Llame al 9090-4040 para mas información.
                    </p>
                </div>
                <!-- Contenedor de botones-->
                <div class="col-span-5 lg:col-span-2 border-l-[1px] border-gray-400 p-2 my-auto">
                    <div class="rounded-full py-1 px-3 border border-gray-400 flex flex-row items-center">
                        <i class="fa-solid fa-circle-check text-multiYellow "></i>
                        <h3 class="text-xs text-multiDarkBlue font-medium mx-auto">Verificado</h3>
                        <a href="">
                            <i class="fa-solid fa-circle-question text-zinc-400 "></i>
                        </a>
                    </div>
                    <!-- Botón Pro -->
                    <div class="mt-4 rounded-full bg-multiDarkBlue py-1 px-4 flex flex-row items-center">
                        <i class="fa-solid fa-screwdriver-wrench text-multiYellow text-xs"></i>
                        <h3 class="text-xs text-white font-medium mx-auto">Pro</h3>
                        <a href="">
                            <i class="fa-solid fa-circle-question text-zinc-400"></i>
                        </a>
                    </div>
                    <h4 class="text-[9px]">Tiempo en la plataforma</h4>
                    <h5 class="text-[8px] font-bold">4 Meses</h5>
                </div>
            </div>
            <div class="m-4">
                <a href="" class="bg-green-500 px-80">Hola</a>
            </div>
        </div>


        <div class="border-[2px] border-multiDarkBlue">
            <img class="w-full " src="public/imgs/carpinteria.png" alt="4.5 Calificacion">
            <div class="flex flex-row space-x-0.5 bg-black">

                <div class="bg-zinc-100 w-8/12">
                    <div class="flex flex-row">
                        <img class="w-7 h-7 m-2 justify-start rounded-full" src="public/imgs/carpinteria.png" alt=".">
                        <div class="flex flex-col mt-1.5">
                            <p class="text-xs font-medium">Javier Tabora</p>
                            <p class="text-xs">Carpintero</p>
                        </div>
                    </div>
                    <p class="text-xs m-1 text-justify">Joven emprendedor con su nuevo negocio, en el cual
                        nos ofrece
                        una
                        gran variedad
                        de trabajos en la madera, con bellos acabados y delineados unicos que solamente el ofrece.
                        Llame al 9090-4040 para mas informacion.
                    </p>
                </div>
                <div class=" bg-zinc-100 w-4/12">
                    <h2 class="mt-10 mb-1 text-xs rounded-full bg-zinc-400 text-center">Verificado</h4>
                        <h3 class="mt-2 mb-1 text-xs rounded-full bg-blue-700 text-white text-center">Pro</3>
                            <h4 class="text-[9px] text-center">Tiempo en la plataforma</h4>
                            <h5 class="text-[8px] text-center font-bold">4 Meses</h5>
                </div>
            </div>

        </div>

        <div class="border-[2px] border-multiDarkBlue">
            <img class="w-full h-72" src="public/imgs/carpinteria.png" alt="imagen carpei">
            <div class=" flex flex-row py-3">

                <div class="w-8/12 m-3">
                    <div class="flex flex-row">
                        <img class="w-7 h-7 m-2 justify-start rounded-full bg-cover" src="public/imgs/carpinteria.png"
                            alt=".">
                        <div class="flex flex-col mt-1.5">
                            <p class="text-xs font-medium">Javier Tabora</p>
                            <p class="text-xs">Carpintero</p>
                        </div>
                    </div>
                    <p class="text-xs text-justify">1 Joven emprendedor con su nuevo negocio, en el cual nos ofrece una
                        gran variedad
                        de trabajos en la madera, con bellos acabados y delineados unicos que solamente el ofrece.
                        Llame al 9090-4040 para mas informacion.
                    </p>
                </div>
                <div class="w-4/12 border-l-[1px] border-gray-400">
                    <h2 class="mt-10 mb-1 text-xs rounded-full bg-zinc-400 text-center">Verificado</h4>
                        <h3 class="mt-2 mb-1 text-xs rounded-full bg-blue-700 text-white text-center">Pro</3>
                            <h4 class="text-[9px] text-center">Tiempo en la plataforma</h4>
                            <h5 class="text-[8px] text-center font-bold">4 Meses</h5>
                </div>
            </div>

        </div>
    </div>
</div>