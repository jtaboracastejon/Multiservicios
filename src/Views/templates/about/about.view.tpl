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