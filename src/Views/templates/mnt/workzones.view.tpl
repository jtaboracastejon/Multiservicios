<!--
<div> Esto es para cerrar el dashboard-->
{{include dashboard/dashboard}}
<div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
    <div class="bg-white rounded-lg p-10">
        <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Mantenimiento de zona laborales</p>
        <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
            <div class="overflow-x-auto relative rounded-lg">
            <a href="index.php?page=mnt-workzone&mode=INS"><button type="button" class="mt-4 px-4 py-2 text-black-400 text-white hover:text-white bg-gradient-to-r bg-blue-500 border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500">Nuevo</button></a>
               
                <table class="w-full text-sm text-left text-gray-500 rounded-lg">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-50 rounded-lg scrollbar-hide">
                        <tr>
                                <th scope="col" class="py-3 px-6 gap-4">
                                    Codigo
                                </th>
                                <th scope="col" class="py-3 px-6">
                                    Departmento
                                </th>
                                <th scope="col" class="py-3 px-6">
                                    Municipio
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
                            {{foreach workzones}}
                            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                    {{idworkzone}}
                                </th>
                                <td class="py-4 px-6">
                                   {{department}}
                                </td>
                                <td class="py-4 px-6">
                                    {{municipality}}
                                </td>
                                <td class="py-4 px-6">
                                    {{status}}
                                </td>
                                <td class="py-4 px-6">
                                    <a href="index.php?page=mnt-workzone&mode=UPD&idworkzone={{idworkzone}}"><i class="fa-solid fa-pen-to-square p-4"></i></a>
                                    <a href="index.php?page=mnt-workzone&mode=DEL&idworkzone={{idworkzone}}"><i class="fa-solid fa-trash-alt p-4"></i></a>
                                </td>
                            </tr>
                            {{endfor workzones}}
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
