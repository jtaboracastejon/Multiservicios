<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            <div class="flex justify-between items-center">
                <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Facturas pendientes ({{currentInvoices}})</p>
                <a href="index.php?page=transactions_transactions" class="form-secondaryButton cursor-pointer">Ver historial de transacciones</a>
            </div>
            <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
                <div class="overflow-x-auto relative rounded-lg">
                    <table class="w-full text-sm text-left text-gray-500 rounded-lg">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 rounded-lg scrollbar-hide">
                            <tr>
                                <th scope="col" class="py-3 px-6 gap-4">
                                    Campaña de cobro
                                </th>
                                <th scope="col" class="py-3 px-6 gap-4">
                                    Tipo de cargo 
                                </th>
                                <th scope="col" class="py-3 px-6 text-center">
                                    Cantidad
                                </th>
                                <th scope="col" class="py-3 px-6 text-center">
                                    Precio
                                </th>
                                <th scope="col" class="py-3 px-6 text-center">
                                    Total
                                </th>
                                <th scope="col" class="py-3 px-6 text-center">
                                    Estado
                                </th>
                                <th scope="col" class="py-3 px-6 text-center">
                                    Fecha creada
                                </th>
                                <th scope="col" class="py-3 px-6 text-center">
                                    Acciones
                                </th>
                            </tr>
                        </thead>
                        <tbody>                            
                            {{foreach invoices}}
                            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                    {{aplication}}
                                </th>
                                <td class="py-4 px-6">
                                    {{type}}
                                </td>
                                <td class="py-4 px-6">
                                    {{crrcant}}
                                </td>
                                <td class="py-4 px-6">
                                    L. {{crrprice}}
                                </td>
                                <td class="py-4 px-6">
                                    L. {{total}}
                                </td>
                                <td class="py-4 px-6 text-center">
                                    <p class="text-multiWarning p-2 rounded-lg text-center">Pendiente</p>
                                </td>
                                <td class="py-4 px-6">
                                    {{created}}
                                </td>
                                <td class="py-4 px-6 text-center">
                                    <a href="index.php?page=cart_cart&idCart={{idcart}}" class="hover:bg-multiSuccess hover:text-white text-black p-2 rounded-lg w-full border-2 border-multiSuccess"><i class="fa-brands fa-paypal"></i> Pagar con Paypal</a>
                                </td>
                            </tr>
                            {{endfor invoices}}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div> <!--Esto es para cerrar el dashboard-->
{{include promotions/partials/modalCreatePromo}}