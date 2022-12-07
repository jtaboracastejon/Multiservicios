<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Historial de transacciones</p>
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
                                    Precio Unitario
                                </th>
                                <th scope="col" class="py-3 px-6 text-center">
                                    Importe
                                </th>
                                <th scope="col" class="py-3 px-6 text-center">
                                    Fecha creada
                                </th>
                            </tr>
                        </thead>
                        <tbody>                            
                            {{foreach transactions}}
                            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                    {{aplication}}
                                </th>
                                <td class="py-4 px-6 text-center">
                                    {{type}}
                                </td>
                                <td class="py-4 px-6 text-center">
                                    {{crrcant}}
                                </td>
                                <td class="py-4 px-6 text-center">
                                    L. {{crrprice}}
                                </td>
                                </td>
                                <td class="py-4 px-6 text-center">
                                    L. {{total}}
                                </td>
                                <td class="py-4 px-6 text-center">
                                    {{created}}
                                </td>
                            </tr>
                            {{endfor transactions}}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div> <!--Esto es para cerrar el dashboard-->