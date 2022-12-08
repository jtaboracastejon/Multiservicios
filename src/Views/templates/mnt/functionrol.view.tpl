<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Formulario Funciones Roles</p>
            <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
                <div class="overflow-x-auto relative rounded-lg">

                    <!--Copiar de aqui para arriba-->

                    
                    <form class="text-justify" action="index.php?page=Mnt-FunctionRol&mode={{mode}}&rolescod={{rolescod}}" method="post" enctype='multipart/form-data'>
                        
                        <fieldset>
                            <label for="rolescod" class="form-label !ml-10 !font-semibold !text-sm">Roles Cod</label>
                            <input type="text" name="rolescod" id="rolescod" class="form-input !ml-10 !w-[40rem] !text-sm"
                                placeholder="Controllers" value="{{rolescod}}">

                            <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="selected">Seleccionar Controller</label>
                            <select name="fncod" id="fncod" {{if readOnly}} disabled {{endif readOnly}}
                            class="form-select !ml-10 !w-[25rem] !text-sm">
                            {{foreach getallF}}
                            <option value="{{fncod}}" {{selected}}>{{fncod}}</option>
                            {{endfor getallF}}
                            </select>
                            
                            <!--
                            <label for="fncod" class="form-label !ml-10 !mt-2 !font-semibold !text-sm">FN  COD</label>
                            <input type="text" name="fncod" id="fncod" class="form-input !ml-10 !w-[40rem] !text-sm"
                                placeholder="FN COD" value="{{fncod}}">
                            -->

                            <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="fnrolest">Estado de la Funcion Rol/label>
                            <select name="fnrolest" id="fnrolest" class="form-select !ml-10 !w-[25rem] !text-sm">
                                <option value="ACT" {{if act_selected}} selected {{endif act_selected}}>Activo</option>
                                <option value="INA" {{if act_selected}} selected {{endif act_selected}}>Inactivo</option>
                            </select>

                          <label for="fnexp" class="form-label !ml-10 !font-semibold !text-sm">Fecha X</label>
                        <input type="date" name="fnexp" class="form-input !ml-10 !w-[9rem] !text-sm">

                        </fieldset>

                        {{if showSaveBtn}}
                        <button type="submit" class="form-primaryButton !ml-10"  name="btnGuardar">Confirmar</button>
                        {{endif showSaveBtn}}
                        <button type="submit" class="form-secondaryButton !mb-4" id="btnCancelar">Cancelar</button>

                        <script>
                        document.getElementById("btnCancelar").addEventListener("click", function
                        (event) {
                            event.preventDefault();
                            window.location.href ="index.php?page=Mnt-FunctionsRols";
                        });

                        </script>

                    </form>

                    <!--Copiar de aqui para abajo-->
                </div>
            </div>
        </div>
    </div>
    
</div>


