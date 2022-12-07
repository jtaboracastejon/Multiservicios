<div class="mx-10 mt-16">
    <div class="w-full flex flex-col lg:flex-row">
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
                        {{foreach imgsWork}}
                        <input class="carousel-open js-targetInput" type="radio" id="" name="carousel" aria-hidden="true" hidden="" checked="">
                        <div class="carousel-item absolute opacity-0 rounded-t-lg">
                            <img src="{{imgpath}}" class="object-cover object-center h-full w-full rounded-t-2xl" alt="">
                        </div>
                        <label for="" class="prev multi-slidePrev js-targetPrevLabel"><i class="fa-solid fa-circle-arrow-left"></i></label>
                        <label for="" class="next multi-slideNext js-targetNextLabel"><i class="fa-solid fa-circle-arrow-right"></i></label>
                        {{endfor imgsWork}}
                        <!-- Add additional indicators for each slide-->
                        <ol class="carousel-indicators" id="js-targetCarouselIndicators">
                        </ol>

                    </div>
                </div>
            </div>
        </div>
        <div class="basis-1/3 p-20">
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
                    <p class="text-lg font-medium">{{name}}</p>
                    <p class="text-sm text-multiDarkBlue">{{municipality}}, {{department}}</p>
                </div>
                <p class="text-xs text-justify">{{decription}}
                </p>
                
                <button type="button" onclick="modalHandler(true, 'modalContactProvider')" class="m-4 bg-green-600 rounded-2xl py-2 flex flex-row items-center justify-center ">
                    <i class="fa-solid fa-paper-plane text-white mr-4"></i>
                    <span href="" class="text-white font-semibold ">Contactar</span>
                </button>
            </div>
            
        </div>
        </div>
    </div>
    <div class="mt-10">
        <p class="font-bold">Insignias</p>
        <div class="flex gap-6 mt-3">
            {{if isVerified}}
            <div class="rounded-full py-1 px-3 border border-gray-400 flex flex-row items-center">
                <i class="fa-solid fa-circle-check text-multiDarkYellow"></i>
                <h3 class="text-xs text-multiDarkBlue font-medium mx-auto px-3">Verificado</h3>
                <a href="">
                    <i class="fa-solid fa-circle-question text-zinc-400 "></i>
                </a>
            </div>
            {{endif isVerified}}
            <!-- Botón Pro -->
            <div class="rounded-full bg-multiDarkBlue py-1 px-3 flex flex-row items-center">
                <i class="fa-solid fa-screwdriver-wrench text-xs text-multiDarkYellow"></i>
                <span class="text-medium text-white font-medium mx-auto px-3">Pro</span>
                <a href="">
                    <i class="fa-solid fa-circle-question text-zinc-400"></i>
                </a>
            </div>
            <div class="rounded-full py-1 px-3 border flex items-center">
                <div class="flex-col mr-3">
                    <p class="text-lg font-medium text-center">{{dateCant}}</p>
                    <p class="text-xs font-medium text-center">{{dateDesc}}</p>
                </div>
                <p class="text-xs font-medium text-gray-400">En la<br>Plataforma</p>
            </div>
        </div>
    </div>
    <div class="flex mt-10 border-b-2 border-multiDarkBlue">
        <div class="basis-2/3">
            <div class="flex items-center mb-5">
                <p class="text-sm font-medium text-gray-500 dark:text-gray-400">376 Calificaciones</p>
            </div>
            <div class="gap-8 sm:grid sm:grid-cols-2">
                <div>
                    <dl>
                        <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Tiempo</dt>
                        <dd class="flex items-center mb-3">
                            <div class="w-full bg-gray-200 rounded h-2.5 dark:bg-gray-700 mr-2">
                                <div class="bg-blue-600 h-2.5 rounded dark:bg-blue-500" style="width: 88%"></div>
                            </div>
                            <span class="text-sm font-medium text-gray-500 dark:text-gray-400">8.8</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Conocimiento</dt>
                        <dd class="flex items-center mb-3">
                            <div class="w-full bg-gray-200 rounded h-2.5 dark:bg-gray-700 mr-2">
                                <div class="bg-blue-600 h-2.5 rounded dark:bg-blue-500" style="width: 89%"></div>
                            </div>
                            <span class="text-sm font-medium text-gray-500 dark:text-gray-400">8.9</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Actitud</dt>
                        <dd class="flex items-center mb-3">
                            <div class="w-full bg-gray-200 rounded h-2.5 dark:bg-gray-700 mr-2">
                                <div class="bg-blue-600 h-2.5 rounded dark:bg-blue-500" style="width: 88%"></div>
                            </div>
                            <span class="text-sm font-medium text-gray-500 dark:text-gray-400">8.8</span>
                        </dd>
                    </dl>

                </div>
                <div>
                    <dl>
                        <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Comunicación</dt>
                        <dd class="flex items-center mb-3">
                            <div class="w-full bg-gray-200 rounded h-2.5 dark:bg-gray-700 mr-2">
                                <div class="bg-blue-600 h-2.5 rounded dark:bg-blue-500" style="width: 59%"></div>
                            </div>
                            <span class="text-sm font-medium text-gray-500 dark:text-gray-400">5.9</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Puntualidad</dt>
                        <dd class="flex items-center mb-3">
                            <div class="w-full bg-gray-200 rounded h-2.5 dark:bg-gray-700 mr-2">
                                <div class="bg-blue-600 h-2.5 rounded dark:bg-blue-500" style="width: 89%"></div>
                            </div>
                            <span class="text-sm font-medium text-gray-500 dark:text-gray-400">8.9</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Responsabilidad</dt>
                        <dd class="flex items-center mb-3">
                            <div class="w-full bg-gray-200 rounded h-2.5 dark:bg-gray-700 mr-2">
                                <div class="bg-blue-600 h-2.5 rounded dark:bg-blue-500" style="width: 70%"></div>
                            </div>
                            <span class="text-sm font-medium text-gray-500 dark:text-gray-400">7.0</span>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-10">
        <p class="font-bold">Reseñas</p>
        <div class="grid grid-cols-3 gap-4">
            <!-- Review Card-->
            <div class="border-r border-multiDarkBlue m-10 pr-10">
                <div class="flex items-center">
                    <p class="text-medium mr-4">Javier Tabora</p>
                    <p class="bg-slate-200 text-multiDarkBlue text-sm font-semibold items-center p-1.5 rounded">8.7</p>
                </div>
                <i class="text-medium text-multiDarkGray">Santa Rosa de Copán</i>
                <p class="text-base text-sm multi-maxChars">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Non suscipit qui eligendi provident a dolorem totam tempore iusto doloremque, at ullam voluptates assumenda ea. Rem quasi vero tempore cupiditate voluptate.</p>
            </div>
            <!-- End Review Card-->
            <div class="border-r border-multiDarkBlue m-10 pr-10">
                <div class="flex items-center">
                    <p class="text-medium mr-4">Javier Tabora</p>
                    <p class="bg-slate-200 text-multiDarkBlue text-sm font-semibold items-center p-1.5 rounded">8.7</p>
                </div>
                <i class="text-medium text-multiDarkGray">Santa Rosa de Copán</i>
                <p class="text-base text-sm multi-maxChars">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Non suscipit qui eligendi provident a dolorem totam tempore iusto doloremque, at ullam voluptates assumenda ea. Rem quasi vero tempore cupiditate voluptate.</p>
            </div>
            <div class="border-r border-multiDarkBlue m-10 pr-10">
                <div class="flex items-center">
                    <p class="text-medium mr-4">Javier Tabora</p>
                    <p class="bg-slate-200 text-multiDarkBlue text-sm font-semibold items-center p-1.5 rounded">8.7</p>
                </div>
                <i class="text-medium text-multiDarkGray">Santa Rosa de Copán</i>
                <p class="text-base text-sm multi-maxChars">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Non suscipit qui eligendi provident a dolorem totam tempore iusto doloremque, at ullam voluptates assumenda ea. Rem quasi vero tempore cupiditate voluptate.</p>
            </div>
            <div class="border-r border-multiDarkBlue m-10 pr-10">
                <div class="flex items-center">
                    <p class="text-medium mr-4">Javier Tabora</p>
                    <p class="bg-slate-200 text-multiDarkBlue text-sm font-semibold items-center p-1.5 rounded">8.7</p>
                </div>
                <i class="text-medium text-multiDarkGray">Santa Rosa de Copán</i>
                <p class="text-base text-sm multi-maxChars">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Non suscipit qui eligendi provident a dolorem totam tempore iusto doloremque, at ullam voluptates assumenda ea. Rem quasi vero tempore cupiditate voluptate.</p>
            </div>
            <div class="border-r border-multiDarkBlue m-10 pr-10">
                <div class="flex items-center">
                    <p class="text-medium mr-4">Javier Tabora</p>
                    <p class="bg-slate-200 text-multiDarkBlue text-sm font-semibold items-center p-1.5 rounded">8.7</p>
                </div>
                <i class="text-medium text-multiDarkGray">Santa Rosa de Copán</i>
                <p class="text-base text-sm multi-maxChars">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Non suscipit qui eligendi provident a dolorem totam tempore iusto doloremque, at ullam voluptates assumenda ea. Rem quasi vero tempore cupiditate voluptate.</p>
            </div>
            <div class="border-r border-multiDarkBlue m-10 pr-10">
                <div class="flex items-center">
                    <p class="text-medium mr-4">Javier Tabora</p>
                    <p class="bg-slate-200 text-multiDarkBlue text-sm font-semibold items-center p-1.5 rounded">8.7</p>
                </div>
                <i class="text-medium text-multiDarkGray">Santa Rosa de Copán</i>
                <p class="text-base text-sm multi-maxChars">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Non suscipit qui eligendi provident a dolorem totam tempore iusto doloremque, at ullam voluptates assumenda ea. Rem quasi vero tempore cupiditate voluptate.</p>
            </div>
        </div>
    </div>
</div>
{{include provider/partials/modalContactProvider}}
<script>
    const targets = document.querySelectorAll(".js-targetInput");    
    var styleControls = document.getElementById("js-targetStyleControls");
    var styleIndicators = document.getElementById("js-targetStyleIndicators");
    var carouselIndicators = document.getElementById("js-targetCarouselIndicators");
    var i = 0;
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
        carouselIndicators.innerHTML += '<li class="inline-block mr-3"> <label for="carousel-' + key + '" class="carousel-bullet cursor-pointer block text-white"><img src="'+ encoded[key]['imgpath'] +'" class="h-10 hover:shadow-md"/></li>';
    });

</script>

