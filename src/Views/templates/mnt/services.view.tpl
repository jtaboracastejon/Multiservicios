<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Form</p>
            <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
                <div class="overflow-x-auto relative rounded-lg">
                    <table class="w-full text-sm text-left text-gray-500 rounded-lg">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 rounded-lg scrollbar-hide">
                           <tr>
                            <!--Copiar de aqui para arriba-->

                            
                                    <th scope="col" class="py-3 px-6 gap-4">
                                        ID
                                    </th>
                                    <th scope="col" class="py-3 px-6 gap-4">
                                        Nombre del Servicio
                                    </th>
                                    <th scope="col" class="py-3 px-6">
                                        Descripción
                                    </th>
                                    <th scope="col" class="py-3 px-6">
                                        Ruta de Imagen
                                    </th>
                                    <th scope="col" class="py-3 px-6">
                                        Estado
                                    </th>
                                    <th scope="col" class="py-3 px-6">
                                        Actions
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                             {{foreach services}}
                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                    <th scope="row"
                                        class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        {{idservice}}
                                    </th>
                                    <td class="py-4 px-6">
                                        {{servicename}}
                                    </td>
                                    <td class="py-4 px-6">
                                        {{description}}
                                    </td>
                                    <td class="py-4 px-6">
                                        {{imagepath}}
                                    </td>
                                    <td class="py-4 px-6">
                                        {{status}}
                                    </td>
                                    <td class="py-4 px-6">
                                        <a href="index.php?page=mnt-service&mode=UPD&idservice={{idservice}}"><i class="fa-solid fa-pen-to-square p-4"></i></a>
                                        <a href="index.php?page=mnt-service&mode=DEL&idservice={{idservice}}"><i class="fa-solid fa-trash"></i></a>
                                    </td>
                                </tr>
                              {{endfor services}}

                            <!--Copiar de aqui para abajo-->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
