<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
                <div class="overflow-x-auto relative rounded-lg">

                <form action="index.php?page=mnt-workzone&mode={{mode}}&idworkzone={{idworkzone}}" method="post"
                    class="text-justify">
                    <p class="pl-10 pt-10 text-black-400 text-xl font-bold lg:text-2xl mb-2">{{mode_dsc}}
                    </p>
                    <fieldset>
                        <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="select">Seleccionar departamento</label>
                        <select name="iddepto" id="iddepto" {{if readOnly}} disabled {{endif readOnly}}
                            class="form-select !ml-10 !w-[25rem] !text-sm">
                            {{foreach getAllD}}
                            <option value="{{iddepto}}" {{selected}}>{{department}}</option>
                            {{endfor getAllD}}
                        </select>

                         <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="select">Seleccionar municipio</label>
                        <select name="idmunicipality" id="idmunicipality" {{if readOnly}} disabled {{endif readOnly}}
                            class="form-select !ml-10 !w-[25rem] !text-sm">
                            {{foreach getAllM}}
                            <option value="{{idmunicipality}}" {{selected}}>{{municipality}}</option>
                            {{endfor getAllM}}
                        </select>

                         <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="select">Seleccionar estado</label>
                        <select name="status" id="status" {{if readOnly}} disabled {{endif readOnly}}
                            class="form-select !ml-10 !w-[25rem] !text-sm">
                           <option value="DIS" {{if dis_selected}}selected{{endif dis_selected}}>Disponible</option>
                            <option value="NODIS" {{if nodis_selected}}selected{{endif nodis_selected}}>No disponible</option>
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

