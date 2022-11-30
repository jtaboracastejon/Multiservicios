<div class="bg-no-repeat bg-cover bg-center">
    {{include common/navbarS}}
</div>


<div class="mx-10 mt-16">
    <div class="w-full flex flex-row">
        <div class="basis-2/3">
            <style>
                .carousel-open:checked+.carousel-item {
                    position: static;
                    opacity: 100;
                }

                .carousel-item {
                    -webkit-transition: opacity 0.6s ease-out;
                    transition: opacity 0.6s ease-out;
                }
                .carousel-indicators {
                        list-style: none;
                        margin: 0;
                        padding: 0;
                        position: absolute;
                        bottom: 2%;
                        left: 0;
                        right: 0;
                        text-align: center;
                        z-index: 10;
                    }
            </style>
            <style id="js-targetStyleControls">
            </style>
            <style id="js-targetStyleIndicators">
            </style>
            <div class="bg-white font-sans leading-normal tracking-normal">
                <div class="carousel relative shadow-2xl bg-white">
                    <div class="carousel-inner relative overflow-hidden w-full">
                        <!--Slide 1-->
                        {{foreach imagenes}}
                        <input class="carousel-open js-targetInput" type="radio" id="" name="carousel" aria-hidden="true" hidden="" checked="">
                        <div class="carousel-item absolute opacity-0">
                            <img src="{{img}}" class="object-cover object-center h-full w-full" alt="">
                        </div>
                        <label for="" class="prev multi-slidePrev js-targetPrevLabel"><i class="fa-solid fa-circle-arrow-left"></i></label>
                        <label for="" class="next multi-slideNext js-targetNextLabel"><i class="fa-solid fa-circle-arrow-right"></i></label>
                        {{endfor imagenes}}
                        <!-- Add additional indicators for each slide-->
                        <ol class="carousel-indicators" id="js-targetCarouselIndicators">
                        </ol>

                    </div>
                </div>
            </div>
        </div>
        <div class="basis-1/3 pl-10">
            <div class="border-[2px] border-multiDarkBlue h-full">
            <div class="z-0 grid h-2/4 bg-[url('../public/imgs/carpinteria.png')] bg-cover">
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
            <div class="grid m-3">
                <div class="flex flex-col my-auto">
                    <p class="text-lg font-medium">Javier Tabora</p>
                    <p class="text-sm text-multiDarkBlue">Santa Rosa de Copan</p>
                </div>
                <p class="text-xs text-justify">1 Joven emprendedor con su nuevo negocio, en el cual nos ofrece una
                    gran variedad de trabajos en la madera, con bellos acabados y delineados únicos que solamente el
                    ofrece.
                    Llame al 9090-4040 para mas información.
                </p>
                
                <a href="" class="m-4 bg-green-600 rounded-2xl py-2 flex flex-row items-center justify-center ">
                    <i class="fa-solid fa-paper-plane text-white mr-4"></i>
                    <span href="" class="text-white font-semibold ">Contactar</span>
                </a>
            </div>
            
        </div>
        </div>
    </div>
    <div class="mt-9 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-4 gap-10 2xl:gap-20">
        <!-- Inicia Tarjeta-->
        <div class="border-[2px] border-multiDarkBlue">
            <div class="z-0 grid h-56 bg-[url('../public/imgs/carpinteria.png')] bg-cover">
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
                            src="public/imgs/carpinteria.png" alt=".">
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
</div>
<script>
    const targets = document.querySelectorAll(".js-targetInput");    
    var styleControls = document.getElementById("js-targetStyleControls");
    var styleIndicators = document.getElementById("js-targetStyleIndicators");
    var carouselIndicators = document.getElementById("js-targetCarouselIndicators");
    var i = 1;
    targets.forEach(target => {
        target.id = "carousel-" + i;
        i++;       
    });
    const targetsPrevLabel = document.querySelectorAll(".js-targetPrevLabel");
    i = 1;    
    var targetsCount = targetsPrevLabel.length;
    targetsPrevLabel.forEach(target => {
        if(i == 1){
            target.htmlFor = "carousel-" + targetsCount;
            target.checked = true;
        }else{
            target.htmlFor = "carousel-" + (i-1);
        }
        target.classList.add("control-"+i);
        i++;
    });
    const targetsNextLabel = document.querySelectorAll(".js-targetNextLabel");
    i = 1;
    targetsNextLabel.forEach(target => {
        if(i == targetsCount){
            target.htmlFor = "carousel-" + 1;
            styleControls.innerHTML += "#carousel-" + i + ":checked~.control-" + i + "{display: block;}";
            styleIndicators.innerHTML += "#carousel-" + i + ":checked~.control-" + i + "~.carousel-indicators li:nth-child(" + i + ") .carousel-bullet { height: 3.5rem; }";
        }else{
            target.htmlFor = "carousel-" + (i+1);
            styleControls.innerHTML += "#carousel-" + i + ":checked~.control-" + i + ",";
            styleIndicators.innerHTML += "#carousel-" + i + ":checked~.control-" + i + "~.carousel-indicators li:nth-child(" + i + ") .carousel-bullet,";
        }        
        target.classList.add("control-"+i);
        i++;
    });
    const encoded = ({{encoded}});
    Object.keys(encoded).forEach(function(key) {
        carouselIndicators.innerHTML += '<li class="inline-block mr-3"> <label for="carousel-' + key + '" class="carousel-bullet cursor-pointer block text-white"><img src="'+ encoded[key]['img'] +'" class="h-10 hover:shadow-md"/></li>';
    });

</script>

