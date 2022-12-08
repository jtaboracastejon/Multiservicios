<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
                <div class="overflow-x-auto relative rounded-lg">

                <form action="index.php?page=mnt-provider&mode={{mode}}&idprovider={{idprovider}}" method="post"
                    class="text-justify">
                    <p class="pl-10 pt-10 text-black-400 text-xl font-bold lg:text-2xl mb-2">{{mode_dsc}}
                    </p>
                    <fieldset>
                        <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="select">Seleccionar usuario</label>
                        <select name="iduserdetail" id="iduserdetail" {{if readOnly}} disabled {{endif readOnly}}
                            class="form-select !ml-10 !w-[25rem] !text-sm">
                            {{foreach getallU}}
                            <option value="{{iduserdetail}}" {{selected}}>{{firstname}} {{lastname}}</option>
                            {{endfor getallU}}
                        </select>

                         <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="select">Seleccionar servicio</label>
                        <select name="idservice" id="idservice" {{if readOnly}} disabled {{endif readOnly}}
                            class="form-select !ml-10 !w-[25rem] !text-sm">
                            {{foreach getallS}}
                            <option value="{{idservice}}" {{selected}}>{{servicename}}</option>
                            {{endfor getallS}}
                        </select>

                         <label for="decription" class="form-label !ml-10 !mt-2 !font-semibold !text-sm">Descripcion</label>
                        <textarea cols="30" rows="10" type="text" name="decription" id="decription" {{if readOnly}}disabled{{endif readOnly}}
                          class="form-input !ml-10 !w-[40rem] !text-sm"
                            placeholder="Ingresar descripcion">{{decription}}</textarea>

                         <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="select">Seleccionar estado</label>
                        <select name="status" id="status" {{if readOnly}} disabled {{endif readOnly}}
                            class="form-select !ml-10 !w-[25rem] !text-sm">
                           <option value="ACT" {{if dis_selected}}selected{{endif dis_selected}}>Activo</option>
                            <option value="INA" {{if nodis_selected}}selected{{endif nodis_selected}}>Inactivo</option>
                        </select>
                    </fieldset>
                    {{if showSaveBtn}}
                    <button type="submit" name="btnGuardar" class="form-primaryButton !ml-10">Guardar</button>
                    {{endif showSaveBtn}}
                    <button id="btnCancelar" class="form-secondaryButton !mb-4">Cancelar</button>

                </form>
            </div>
            </div>
        </div>
    </div>
</div>


