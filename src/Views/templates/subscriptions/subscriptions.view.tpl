<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="grid grid-cols-3 p-10 gap-4">
            {{foreach plans}}
            <div class="bg-white rounded-lg p-10">
                <span class="uppercase">
                    {{aplication}} <i class="fa-solid {{iconOrImg}}"></i>
                </span>
                <div class="text-center">
                    <p class="text-9xl font-semibold">{{monthCount}}</p>
                    <p class="text-xl font-semibold">{{monthLetters}}</p>
                </div>
                <p class="text-xl font-medium text-multiDarkBlue">BENEFICIOS</p>
                <ol class="list-disc">
                    <li class="mt-2">Acceso a foro para consultas con otros proveedores</li>
                    <li class="mt-2">Acceso a instructivos de las marcas mas usadas en el país</li>
                    <li class="mt-2">Descuentos exclusivos en ferreterías</li>
                    <li class="mt-2">Insignia <span class="bg-multiDarkBlue text-white rounded-full p-1 text-xs font-medium">PRO</span> en tu perfil</li>
                    <li class="mt-2">Material para capacitaciones</li>
                    <li class="mt-2">Certificaciones de las marcas</li>
                </ol>
                <div class="rounded-t-xl text-center mt-10 mb-14">
                    <p class="text-xl font-medium">Precio</p>
                    <p class="text-3xl font-semibold">L. {{price}}</p>
                    <p class="text-lg font-semibold">L. {{pricePerMonth}}/Mes</p>
                </div>
                <div class="mx-auto text-center">

                    <a class="bg-multiSuccess rounded-full p-5 text-white font-semibold" href="index.php?page=subscriptions_subscriptions&idprice={{idprice}}">Comprar</a>
                </div>
                
            </div>
            {{endfor plans}}
        </div>
    </div>
</div> <!--Esto es para cerrar el dashboard-->
{{include promotions/partials/modalCreatePromo}}