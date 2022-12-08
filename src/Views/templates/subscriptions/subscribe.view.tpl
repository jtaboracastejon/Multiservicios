<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            {{with plan}}
            <span class="inline-flex items-center">
                <i class="fa-solid {{iconOrImg}}"></i>
                <p class="text-black-400 text-xl font-bold lg:text-2xl">{{aplication}}</p>
            </span>
            <h1 class="text-lg">Consigue beneficios inmediatos</h1>
            <div class="grid grid-cols-2 mt-4">
                <div class="border-r-2 border-multiDarkBlue">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum, quia! Similique repellendus tempora ut
                    corporis libero, a accusantium adipisci qui iste. Culpa ipsam nisi fugit est aut deserunt, quod non.</p>
            
                    <ol class="list-disc">
                        <li class="mt-2">Acceso a foro para consultas con otros proveedores</li>
                        <li class="mt-2">Acceso a instructivos de las marcas mas usadas en el país</li>
                        <li class="mt-2">Descuentos exclusivos en ferreterías</li>
                        <li class="mt-2">Insignia <span
                                class="bg-multiDarkBlue text-white rounded-full p-1 text-xs font-medium">PRO</span> en tu
                            perfil</li>
                        <li class="mt-2">Material para capacitaciones</li>
                        <li class="mt-2">Certificaciones de las marcas</li>
                    </ol>
                </div>

                <div>
                    <div class="text-center">
                        <h1>Empieza tu plan:</h1>
                        <p class="text-9xl font-semibold">{{monthCount}}</p>
                        <p class="text-xl font-semibold">{{monthLetters}}</p>
                    </div>
                </div>
            </div>
            {{endwith plan}}
            <div class="flex justify-evenly items-center gap-12 mt-10">
                <div class="flex flex-col">
                    <p class="text-center">Si empiezas tu plan hoy</p>
                    <p class="text-xl font-semibold text-center">{{startDateInLettters}}</p>
                    <p class="text-lg font-medium text-center text-slate-400" id="startDate">{{startDate}}</p>
                </div>
                <div class="flex flex-col">
                    <p class="text-center">Tu plan expira el</p>
                    <p class="text-xl font-semibold text-center">{{endDateInLettters}}</p>
                    <p class="text-lg font-medium text-center text-slate-400" id="endDate">{{endDate}}</p>
                </div>
            </div>
            {{with plan}}
            <div class="rounded-t-xl text-center mt-10 grid grid-cols-2">
                <span class="inline-flex items-center gap-4">
                    <p class="text-xl font-medium">Total a pagar:</p>
                    <p class="text-3xl font-semibold">L. <span id="price">{{price}}</span></p>
                    <p class="text-lg font-regular">L. {{pricePerMonth}}/Mes</p>
                </span>
                <button class="hover:bg-multiSuccess hover:text-white text-black p-2 rounded-lg w-full border-2 border-multiSuccess" onclick="modalHandler(true, 'paymentNotyModal')"><i class="fa-brands fa-paypal"></i> Pagar con Paypal</button>
            </div>
            <input type="hidden" id="days" value="{{billedsdays}}">
            {{endwith plan}}
        </div>
    </div>
</div><!--Esto es para cerrar el dashboard-->
{{include common/waiting4PaypalModal}}
{{include common/paymentNotyModal}}