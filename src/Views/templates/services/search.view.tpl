<div class="mt-4 ml-10">
    <a href="index.php?page=landing_landing" class="form-helperLink">Inicio</a>
    <a href="#" class="mx-1">></a>
    <a href="index.php?page=Services-Services" class="form-helperLink">Servicios</a>
    <a href="#" class="mx-1">></a>
    <a href="#" class="form-helperLink">{{servicename}}</a>
</div>
<div class="ml-5">
    <div class="flex">
        <div class="w-2/12 mr-10 border-r-4 border-multiDarkBlue p-4 text-3xl font-bold">
            {{servicename}}
        </div>
        <div class="w-10/12 ml-10 mt-2 p-2 text-sm">
            {{description}}
        </div>
    </div>
</div>
<div class="grid grid-cols-12 mt-2 bg-multiDarkBlue h-[74px] w-[1453] gap-4">

</div>

<div class="mt-9 ml-9 mr-9 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-4 gap-10 2xl:gap-20">

    {{if noResults}}
        <p>No se encontraron resultados</p>
    {{endif noResults}}

    {{ifnot noResults}}
    <!-- Inicia Tarjeta-->
        {{foreach providers}}
            {{if isPromotion}}
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
                                <p class="text-xs font-medium">{{name}}</p>
                                <p class="text-xs">Carpintero</p>
                            </div>
                        </div>
                        <p class="text-xs text-justify">{{decription}}
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
                <a href="index.php?page=provider-provider&idprovider={{idprovider}}" class="m-4 bg-green-600 rounded-2xl py-2 flex flex-row items-center justify-center ">
                    <i class="fa-solid fa-paper-plane text-white mr-4"></i>
                    <span href="" class="text-white font-semibold ">Contactar</span>
                </a>
            </div>
            {{endif isPromotion}}
        {{endfor providers}}
    <!-- Fin Tarjeta-->
    <!-- Inicia Tarjeta-->
        {{foreach providers}}
            {{ifnot isPromotion}}
            <div class="border-[2px] border-multiDarkBlue">
                <div class="z-0 grid h-56 bg-[url('https://picsum.photos/500/500')] bg-cover">

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
                                <p class="text-xs font-medium">{{name}}</p>
                                <p class="text-xs">Carpintero</p>
                            </div>
                        </div>
                        <p class="text-xs text-justify">{{decription}}
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
                <a href="index.php?page=provider-provider&idprovider={{idprovider}}" class="m-4 bg-green-600 rounded-2xl py-2 flex flex-row items-center justify-center ">
                    <i class="fa-solid fa-paper-plane text-white mr-4"></i>
                    <span href="" class="text-white font-semibold ">Contactar</span>
                </a>
            </div>
            {{endifnot isPromotion}}
        {{endfor providers}}
    <!-- Fin Tarjeta-->
    {{endifnot noResults}}
</div>

<script >
    var cmbChangeZone = document.getElementById('cmbChangeZone');

    if (cmbChangeZone) {
        cmbChangeZone.addEventListener('change', function() {
            console.log(this.value);
            $.ajax({
                url: 'index.php?page=services_search&service={{service}}',
                type: 'POST',
                data: {
                    idworkzone: this.value,
                    step: 'A'
                },
                success: function(data) {
                    console.log(data);
                    window.location.reload();
                }
            });
            
        });
    };

    var btnBuscar = document.getElementById('btnBuscar');
    var query = document.getElementById('query');

    if (btnBuscar || query) {
        btnBuscar.addEventListener('click', function() {
            console.log(this.value);
            $.ajax({
                url: 'index.php?page=services_search&service={{service}}',
                type: 'POST',
                data: {
                    query: query.value,
                    step: 'B'
                },
                success: function(data) {
                    if(data == 'success') {
                        window.location.href = 'index.php?page=services_search&service={{service}}&query=' + query.value;
                    }
                    else{
                        window.location.href = 'index.php?page=services_search&service={{service}}';
                    }
                }
            });
            
        });

        query.addEventListener('keyup', function(event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                btnBuscar.click();
            }
        });
    };
    //document.getElementById('btnChangeZone').addEventListener("click", function(){
    //    var depto = document.getElementById('cmbdepto').value;
    //    var municipio = document.getElementById('cmbmunicipio').value;
    //    var url = "index.php?page=services_search&service={{service}}&query={{query}}&result={{pagenum}}&depto="+depto+"&municipio="+municipio;
    //    console.log(url);
    //});
</script>