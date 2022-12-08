<div>
    <h1 class="multi-titleG2">Listado de Reseñas</h1>
    <button type="button"
        class="mt-4 px-4 py-2 text-black-400 text-white hover:text-white bg-gradient-to-r bg-blue-500 border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500"><a href="index.php?page=mnt-review&mode=INS">Agregar</a></button>
</div>
<div class="grid grid-cols-3 mt-6">
    <div class="col-span-3 rounded-lg bg-white">
        <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
            <div class="col-span-3 rounded-lg bg-white">
                <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-multiDarkGray">
                    <div class="m-10 overflow-x-auto relative rounded-lg">
                        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400 rounded-lg">
                            <thead
                                class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400 rounded-lg scrollbar-hide">
                                <tr>
                                    <th scope="col" class="py-3 px-6 gap-4">
                                        ID 
                                    </th>
                                    <th scope="col" class="py-3 px-6 gap-4">
                                        ID USER DETAIL
                                    </th>
                                    <th scope="col" class="py-3 px-6">
                                        Titulo
                                    </th>
                                    <th scope="col" class="py-3 px-6">
                                        Reseña
                                    </th>


                                </tr>
                            </thead>
                            <tbody>
                                {{foreach reviews}}
                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                    <th scope="row"
                                        class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        {{idreviewpage}}
                                    </th>
                                    <td class="py-4 px-6">
                                        {{iduserdetail}}
                                    </td>
                                    <td class="py-4 px-6">
                                        {{title}}
                                    </td>
                                    <td class="py-4 px-6">
                                        {{review}}
                                    </td>
                                    <td class="py-4 px-6">
                                        <i class="fa-solid fa-pen-to-square p-4"></i>
                                        <i class="fa-solid fa-trash"></i>
                                    </td>
                                    <td class="py-4 px-6">
                                        <a href="index.php?page=mnt-review&mode=UPD&idreviewpage={{idreviewpage}}"><i class="fa-solid fa-pen-to-square p-4"> Editar</i></a>
                                        <a href="index.php?page=mnt-review&mode=DEL&idreviewpage={{idreviewpage}}"><i class="fa-solid fa-trash">Eliminar</i></a>
                                    </td>
                                </tr>
                                {{endfor reviews}}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>