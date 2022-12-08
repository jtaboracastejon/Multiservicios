<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Mantenimiento de Funciones</p>
            <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
                <div class="overflow-x-auto relative rounded-lg">
                    <a href="index.php?page=mnt-function1&mode=INS"><button type="button"
                        class="mt-4 px-4 py-2 text-black-400 text-white hover:text-white bg-gradient-to-r bg-blue-500 border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500">Nuevo</button></a>

                    <table class="w-full text-sm text-left text-gray-500 rounded-lg">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 rounded-lg scrollbar-hide">
                           <tr>
                            <!--Copiar de aqui para arriba-->

                                    <th scope="col" class="py-3 px-6 gap-4">
                                        Function COD
                                    </th>
                                    <th scope="col" class="py-3 px-6 gap-4">
                                        FUNCTION DSC
                                    </th>
                                    <th scope="col" class="py-3 px-6">
                                        Estado de la funcion
                                    </th>
                                    <th scope="col" class="py-3 px-6">
                                        Tipo de la Funcion
                                    </th>
                                    <th scope="col" class="py-3 px-6">
                                        Actions
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                             {{foreach functions}}
                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                    <th scope="row"
                                        class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        {{fncod}}
                                    </th>
                                    <td class="py-4 px-6">
                                        {{fndsc}}
                                    </td>
                                    <td class="py-4 px-6">
                                        {{fnest}}
                                    </td>
                                    <td class="py-4 px-6">
                                        {{fntyp}}
                                    </td>
                                    <td class="py-4 px-6">
                                        <a href="index.php?page=mnt-function1&mode=UPD&fncod={{fncod}}"><i class="fa-solid fa-pen-to-square p-4"></i></a>
                                        <a href="index.php?page=mnt-function1&mode=DEL&fncod={{fncod}}"><i class="fa-solid fa-trash"></i></a>
                                    </td>
                                </tr>
                              {{endfor functions}}

                            <!--Copiar de aqui para abajo-->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
