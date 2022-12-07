<div>
    <h1 class="multi-titleG2">Listado de servicios</h1>
    <button type="button" 
        class="mt-4 px-4 py-2 text-black-400 text-white hover:text-white bg-gradient-to-r bg-blue-500 border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500"><a href="index.php?page=mnt-service&mode=INS">Agregar</a></button>
</div>

<div class="grid grid-cols-3 mt-6">
    <div class="col-span-3 rounded-lg bg-white">
        <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
            <div class="col-span-3 rounded-lg bg-white">
                <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-multiDarkGray">
                    <div class="m-10 overflow-x-auto relative rounded-lg">
                        <table class="w-full text-sm text-left text-gray-200 dark:text-gray-400 rounded-lg">
                            <thead
                                class="text-xs text-gray-200 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400 rounded-lg scrollbar-hide">
                                <tr>
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


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
