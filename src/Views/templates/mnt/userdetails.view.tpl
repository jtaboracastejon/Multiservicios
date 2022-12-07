<div class="p-10 bg-multiLightGray col-span-4 ">
        
        <div>
            <h1 class="multi-titleG2">Mantenimiento de usuarios</h1>
            <!--<a href="index.php?page=mnt-userdetail&mode=INS"><button type="button" class="mt-4 px-4 py-2 text-black-400 text-white hover:text-white bg-gradient-to-r bg-blue-500 border-multiDarkBlue rounded-lg text-left text-sm hover:from-green-400 hover:to-blue-500">Nuevo</button></a>-->
        </div>

        <div class="grid grid-cols-3 mt-6">
            <div class="col-span-3 rounded-lg bg-white">
                <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">        
                   <div class="col-span-3 rounded-lg bg-white">
                <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-multiDarkGray">
                    <div class="m-10 overflow-x-auto relative rounded-lg">
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400 rounded-lg">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400 rounded-lg scrollbar-hide">
                            <tr>
                                <th scope="col" class="py-3 px-6 gap-4">
                                    Codigo
                                </th>
                                <th scope="col" class="py-3 px-6">
                                    First Name
                                </th>
                                <th scope="col" class="py-3 px-6">
                                    Last Name
                                </th>
                                <th scope="col" class="py-3 px-6">
                                    Username
                                </th>
                                <th scope="col" class="py-3 px-6">
                                    Address
                                </th>
                                 <th scope="col" class="py-3 px-6">
                                    Phone number
                                </th>
                                 <th scope="col" class="py-3 px-6">
                                    Department
                                </th>
                                 <th scope="col" class="py-3 px-6">
                                    Municipality
                                </th>
                                 <th scope="col" class="py-3 px-6">
                                    image profile
                                </th>
                                 <th scope="col" class="py-3 px-6">
                                    image portada
                                </th>
                                 <th scope="col" class="py-3 px-6">
                                    Acciones
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            {{foreach uDetails}}
                            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                    {{iduserdetail}}
                                </th>
                                <td class="py-4 px-6">
                                   {{firstname}}
                                </td>
                                <td class="py-4 px-6">
                                    {{lastname}}
                                </td>
                                <td class="py-4 px-6">
                                    {{username}}
                                </td>
                                 <td class="py-4 px-6">
                                    {{address}}
                                </td>
                                 <td class="py-4 px-6">
                                    {{phonenumber}}
                                </td>
                                 <td class="py-4 px-6">
                                    {{department}}
                                </td>
                                 <td class="py-4 px-6">
                                    {{municipality}}
                                </td>
                                 <td class="py-4 px-6">
                                   {{imgprofile}}
                                </td>
                                 <td class="py-4 px-6">
                                    {{imgportada}}
                                </td>
                                <td class="py-4 px-6">
                                    <a href="index.php?page=mnt-userdetail&mode=UPD&iduserdetail={{iduserdetail}}"><i class="fa-solid fa-pen-to-square p-4"></i></a>
                                </td>
                            </tr>
                            {{endfor uDetails}}
                        </tbody>
                     </table>
                    </div>
                </div>
            </div>
                </div>
            </div>
        </div>

        <div class="grid grid-cols-3 gap-4 mt-10">
            <div class="h-[80rem] rounded-lg bg-white">
                <div class="grid grid-rows-1 m-5 rounded-lg h-[20rem] bg-multiDarkGray">

                </div>
            </div>
            <div class="h-[80rem] rounded-lg bg-white">

            </div>
            <div class="h-[80rem] rounded-lg bg-white">

            </div>
        </div>

        <div class="grid grid-cols-3 mt-6">
            <div class="col-span-3 rounded-lg bg-white">
                <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">        
                    {{include about/form}}
                </div>
            </div>
        </div>

    </div>

</div>
