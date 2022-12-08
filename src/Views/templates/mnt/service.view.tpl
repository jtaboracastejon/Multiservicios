<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Formulario Servicios</p>
            <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
                <div class="overflow-x-auto relative rounded-lg">

                    <!--Copiar de aqui para arriba-->

                    
                    <form class="text-justify" action="index.php?page=Mnt-Service&mode={{mode}}&idservice={{idservice}}" method="post" enctype='multipart/form-data'>
                        
                        <fieldset>
                            <label for="servicename" class="form-label !ml-10 !font-semibold !text-sm">Nombre del Servicio</label>
                            <input type="text" name="servicename" id="servicename" class="form-input !ml-10 !w-[40rem] !text-sm"
                                placeholder="Nombre" value="{{servicename}}">

                            
                            <label for="description" class="form-label !ml-10 !mt-2 !font-semibold !text-sm">Descripcion</label>
                            <input type="text" name="description" id="description" class="form-input !ml-10 !w-[40rem] !text-sm"
                                placeholder="Descripcion" value="{{description}}">

                            <label for="imagepath" class="form-label !ml-10 !mt-2 !font-semibold !text-sm">Imagen</label>
                            <input type="file" accept="image/png, image/jpeg" name="imagepath" id="imagepath" class="form-input !ml-10 !w-[40rem] !text-sm"
                                placeholder="Input Field" value="{{imagepath}}">
                                

                            <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="status">Estado del servicio</label>
                            <select name="status" id="status" class="form-select !ml-10 !w-[25rem] !text-sm">
                                <option value="ACT" {{if act_selected}} selected {{endif act_selected}}>Activo</option>
                                <option value="INA" {{if act_selected}} selected {{endif act_selected}}>Inactivo</option>
                            </select>

                        </fieldset>

                        {{if showSaveBtn}}
                        <button type="submit" class="form-primaryButton !ml-10"  name="btnGuardar">Confirmar</button>
                        {{endif showSaveBtn}}
                        <button type="submit" class="form-secondaryButton !mb-4" id="btnCancelar">Cancelar</button>

                        <script>
                        document.getElementById("btnCancelar").addEventListener("click", function
                        (event) {
                            event.preventDefault();
                            window.location.href ="index.php?page=Mnt-Services";
                        });

                        </script>

                    </form>

                    <!--Copiar de aqui para abajo-->
                </div>
            </div>
        </div>
    </div>
    
</div>


