<!--
<div> Esto es para cerrar el dashboard-->
{{include dashboard/dashboard}}
<div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
    <div class="bg-white rounded-lg p-10">
        <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Orden #{{orderId}}</p>
    </div>
    <div class="bg-white rounded-lg p-10 mt-4">
        <div class="p-10">

            <div class="grid grid-cols-1 gap-5 sm:grid-cols-2">

                <div class="flex flex-col">
                    <h2 class="text-4xl sm:py-5">{{SITE_TITLE}}</h2>
                    <span class="text-gray-500">+504 12345678</span>
                </div>

                <div class="flex flex-col sm:justify-end sm:items-end">
                    <h2 class="text-4xl text-gray-500 sm:py-5">Orden</h2>

                    <dl class="max-w-1/2">
                        <div class="grid grid-cols-2 items-end">
                            <dt class="text-gray-500 ">
                                No Orden
                            </dt>
                            <dd class="text-right">
                                {{orderId}}
                            </dd>
                        </div>
                        <div class="grid grid-cols-2">
                            <dt class="text-gray-500">
                                Fecha de facturación
                            </dt>
                            {{with result}}
                            <dd class="text-right">
                                {{create_time}}
                            </dd>
                            {{endwith result}}
                        </div>
                        <div class="grid grid-cols-2">
                            <dt class="text-gray-500">
                                Método de pago 
                            </dt>
                            <dd class="text-right">
                                PayPal
                            </dd>
                        </div>
                    </dl>

                </div>

                <div class="md:col-span-2">
                    <h4 class="text-lg">Pago por</h4>
                    <p class="text-gray-500">{{payerName}}</p>
                    <p class="text-gray-500">{{payerEmail}}</p>
                </div>

            </div>

            <div class="flex flex-col">

                <h1 class="py-10 sm:py-20 text-3xl">{{totalOrder}} pagados en {{fechaDelPago}}</h1>

                <div class="overflow-scroll">
                    <table class="min-w-full">
                        <thead class="text-bold">
                            <tr>
                                <th scope="col" class="text-left w-2/5 sm:px-8 py-4">
                                    Descripción
                                </th>
                                <th scope="col" class="text-left w-1/5 sm:px-8 py-4">
                                    Cantidad
                                </th>
                                <th scope="col" class="text-left w-1/5 sm:px-8 py-4">
                                    Precio unitario
                                </th>
                                <th scope="col" class="text-right w-1/5 sm:px-8 py-4">
                                    Importe
                                </th>
                            </tr>
                        </thead>

                        <tbody class="divide-y divide-gray-200">
                            {{foreach items}}
                            <tr class="text-left bg-gray-50">
                                <td class="sm:px-8 py-4">
                                    {{name}}
                                </td>
                                <td class="sm:px-8 py-4">
                                    {{quantity}}
                                </td>
                                <td class="sm:px-8 py-4">
                                    {{with unit_amount}}
                                        {{currency_code}} {{value}}
                                    {{endwith unit_amount}}
                                </td>
                                <td class="sm:px-8 py-4 text-right">
                                    {{with amount}}
                                        {{currency_code}} {{value}}
                                    {{endwith amount}}
                                </td>
                            </tr>
                            {{endfor items}}
                            <tr>
                                <td colspan="2" class="">
                                    &nbsp;
                                </td>
                                <td class="sm:px-8 py-4">
                                    Subtotal
                                </td>
                                <td class="sm:px-8 py-4 text-right">
                                    $5000.00
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="">
                                    &nbsp;
                                </td>
                                <td class="sm:px-8 py-4 bg-gray-50">
                                    Amount paid
                                </td>
                                <td class="sm:px-8 py-4 text-right bg-gray-50">
                                    $5000.00
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>

            </div>

        </div>

    </div>

</div>
</div>
<!--Esto es para cerrar el dashboard-->