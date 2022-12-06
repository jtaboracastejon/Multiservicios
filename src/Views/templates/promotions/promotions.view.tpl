<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Promociones</p>
            <a class="form-successButton cursor-pointer" onclick="modalHandler(true, 'modalCreatePromo')">Nueva promoción</a>
            <div class="grid grid-rows-1 m-5 rounded-lg h-[20rem] bg-white">
                <div class="overflow-x-auto relative rounded-lg">
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400 rounded-lg">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400 rounded-lg scrollbar-hide">
                            <tr>
                                <th scope="col" class="py-3 px-6 gap-4">
                                    Nombre de la Promoción 
                                </th>
                                <th scope="col" class="py-3 px-6">
                                    Fecha de inicio
                                </th>
                                <th scope="col" class="py-3 px-6">
                                    Fecha final
                                </th>
                                <th scope="col" class="py-3 px-6">
                                    Gastado
                                </th>
                                <th scope="col" class="py-3 px-6">
                                    Estado
                                </th>
                                <th scope="col" class="py-3 px-6">
                                    Acciones
                                </th>

                            </tr>
                        </thead>
                        <tbody>
                            
                            {{foreach promotions}}
                            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                    {{promotionname}}
                                </th>
                                <td class="py-4 px-6">
                                    {{startdate}}
                                </td>
                                <td class="py-4 px-6">
                                    {{enddate}}
                                </td>
                                <td class="py-4 px-6">
                                    L. {{billed}}
                                </td>
                                <td class="py-4 px-6">
                                    {{status}}
                                </td>
                                <td class="py-4 px-6">
                                    <i class="fa-solid fa-pen-to-square p-4"></i>
                                    <i class="fa-solid fa-trash"></i>
                                </td>
                            </tr>
                            {{endfor promotions}}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div> <!--Esto es para cerrar el dashboard-->
{{include promotions/partials/modalCreatePromo}}