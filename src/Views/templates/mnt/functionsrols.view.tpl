<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Mantenimiento de Funciones Roles</p>
            <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
                <div class="overflow-x-auto relative rounded-lg">
                    <a href="index.php?page=mnt-functionrol&mode=INS"><button type="button"
                        class="mt-4 px-4 py-2 text-black-400 text-white hover:text-white bg-gradient-to-r bg-blue-500 border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500">Nuevo</button></a>

                    <table class="w-full text-sm text-left text-gray-500 rounded-lg">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 rounded-lg scrollbar-hide">
                           <tr>
                            <!--Copiar de aqui para arriba-->

                                    <th scope="col" class="py-3 px-6 gap-4">
                                        Roles COD
                                    </th>
                                    <th scope="col" class="py-3 px-6 gap-4">
                                        FUNCTION COD
                                    </th>
                                    <th scope="col" class="py-3 px-6">
                                        Estado de la funcion rol
                                    </th>
                                    <th scope="col" class="py-3 px-6">
                                    Fecha
                                    </th>
                                    <th scope="col" class="py-3 px-6">
                                        Actions
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                             {{foreach functionsrols}}
                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                    <th scope="row"
                                        class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        {{rolescod}}
                                    </th>
                                    <td class="py-4 px-6">
                                        {{fncod}}
                                    </td>
                                    <td class="py-4 px-6">
                                        {{fnrolest}}
                                    </td>
                                    <td class="py-4 px-6">
                                        {{fnexp}}
                                    </td>
                                    <td class="py-4 px-6">
                                        <a href="index.php?page=mnt-functionrol&mode=UPD&rolescod={{rolescod}}"><i class="fa-solid fa-pen-to-square p-4"></i></a>
                                        <a href="index.php?page=mnt-functionrol&mode=DEL&rolescod={{rolescod}}"><i class="fa-solid fa-trash"></i></a>
                                    </td>
                                </tr>
                              {{endfor functionsrols}}

                            <!--Copiar de aqui para abajo-->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
