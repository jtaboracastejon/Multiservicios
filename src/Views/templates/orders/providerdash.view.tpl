<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            

                    {{if listorder}}
                    <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Lista de ordenes</p>
                    <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
                        <div class="overflow-x-auto relative rounded-lg">
                        <table class="w-full text-sm text-left text-gray-500 rounded-lg">
                            <thead class="text-xs text-gray-700 uppercase bg-gray-50 rounded-lg scrollbar-hide">
                            <tr>
                                    <th scope="col" class="py-3 px-6 gap-4">
                                        Tipo de servicio
                                    </th>
                                    <th scope="col" class="py-3 px-6 gap-4">
                                        Descripticion del problema
                                    </th>
                                    <th scope="col" class="py-3 px-6 gap-4">
                                        Estado
                                    </th>
                                    <th scope="col" class="py-3 px-6 gap-4">
                                        Acciones
                                    </th>
                                </tr>
                            </thead>
                            <tbody>                            
                            {{foreach orders}}
                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                    <td class="py-4 px-6 text-center">
                                        {{servicename}}
                                    </td>
                                    <td class="py-4 px-6 text-center">
                                        {{descriptionwork}}
                                    </td>
                                    <td class="py-4 px-6 text-center">
                                        {{orderstatus}}
                                    </td>
                                    <td class="py-4 px-6 text-center">
                                        <div class="flex item-center justify-center">
                                            {{if isPendiente}}
                                            <div class="w-5 mr-2 transform hover:text-purple-500 hover:scale-110">
                                                <button onclick="modalHandler(true, 'modalAceptOrder', null ,'{{descriptionwork}}', '{{idorder}}')">Revisar&nbsp;<i class="fas fa-check"></i></button>
                                            </div>
                                            {{endif isPendiente}}

                                            {{if isEnProceso}}
                                            <!--<div class="w-5 mr-2 transform hover:text-purple-500 hover:scale-110">
                                            <button onclick="modalHandler(true, 'modalAceptOrder', null ,'{{descriptionwork}}', '{{idorder}}')">Finalizar<i class="fas fa-check"></i></button>
                                            </div>
                                            <div class="w-5 mr-2 transform hover:text-purple-500 hover:scale-110">
                                                <button onclick="modalHandler(true, 'modalRejectOrder', null ,'{{descriptionwork}}', '{{idorder}}')">Cancelar<i class="fas fa-times"></i></button>
                                            </div> -->
                                            <div class="w-5 mr-2 transform hover:text-purple-500 hover:scale-110">
                                                <a href="index.php?page=orders_providerdash&idorder={{idorder}}">Ver detalles&nbsp;<i class="fas fa-list"></i></a>
                                            </div>
                                            {{endif isEnProceso}}
                                        </div>
                                    </td>
                                </tr>
                                {{endfor orders}}
                            </tbody>
                        </table>
                    {{endif listorder}}

                    {{ifnot listorder}}
                    <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Detalles de la orden</p>
                    <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
                        <div class="overflow-x-auto relative rounded-lg">
                        <form class="text-justify">
                            <p class="pl-10 pt-10 text-black-400 text-xl font-bold lg:text-2xl mb-2">Datos de contacto del cliente</p>
                            <fieldset>
                                <label for="txtNombre" class="form-label !ml-10 !font-semibold !text-sm">Nombre</label>
                                <input type="text" name="txtNombre" id="txtNombre" disabled class="form-input !ml-10 !w-[40rem] !text-sm"
                                    value="{{clientName}}">

                                <label for="txtDireccion" class="form-label !ml-10 !mt-2 !font-semibold !text-sm">Dirección</label>
                                <input type="text" name="txtDireccion" id="txtDireccion" disabled class="form-input !ml-10 !w-[40rem] !text-sm"
                                    value="{{clientDireccion}}">


                                <label for="txtTelefono" class="form-label !ml-10 !font-semibold !text-sm">Numero de Telefono</label>
                                <input type="text" name="txtTelefono" id="txtTelefono" disabled class="form-input !ml-10 !w-[40rem] !text-sm" 
                                    value="{{clientTelefono}}">

                                <label for="txtDescripcion" class="form-label !ml-10 !mt-2 !font-semibold !text-sm">Descripcion de la solicitud</label>
                                <textarea type="text" cols="10" rows="5" name="txtDescripcion" id="txtDescripcion" disabled class="form-input !ml-10 !w-[40rem] !mb-10 !text-sm">
                                    {{orderDetail}}
                                </textarea>
                            </fieldset>

                            <button type="button" class="form-successButton !ml-10">Finalizar Orden</button>
                            <button type="button" class="form-dangerButton !mb-4">Cancelar Orden</button>

                        </form>
                    {{endifnot listorder}}

                </div>
            </div>
        </div>
    </div>
</div><!--Esto es para cerrar el dashboard-->

{{include orders/partials/modalAceptOrder}}
{{include orders/partials/modalRejectOrder}}