<div class="p-10 bg-multiLightGray col-span-4 ">
    <div class="grid grid-cols-3 mt-6">
        <div class="col-span-3 rounded-lg bg-white">
            <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">

                <form action="index.php?page=mnt-userdetail&mode={{mode}}&iduserdetail={{iduserdetail}}" method="post"
                    enctype='multipart/form-data' class="text-justify">
                    <p class="pl-10 pt-10 text-black-400 text-xl font-bold lg:text-2xl mb-2">{{mode_dsc}}
                    </p>
                    <input type="hidden" name="usercod" id="usercod" {{if readOnly}}disabled{{endif readOnly}}
                        value="{{usercod}}" class="form-input !ml-10 !w-[40rem] !text-sm" placeholder="Ingresar nombre">
                    <!--<fieldset>
                        <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="select">Seleccione usuario a
                            registrar</label>
                        <select name="usercod" id="usercod" {{if readOnly}} disabled {{endif readOnly}}
                            class="form-select !ml-10 !w-[25rem] !text-sm">
                            {{foreach users}}
                            <option value="{{usercod}}" {{selected}}>{{username}}</option>
                            {{endfor users}}
                        </select>-->
                    <label for="firstname" class="form-label !ml-10 !font-semibold !text-sm">Nombres</label>
                    <input type="text" name="firstname" id="firstname" {{if readOnly}}disabled{{endif readOnly}}
                        value="{{firstname}}" class="form-input !ml-10 !w-[40rem] !text-sm"
                        placeholder="Ingresar nombre">

                    <label for="lastname" class="form-label !ml-10 !mt-2 !font-semibold !text-sm">Apellidos</label>
                    <input type="text" name="lastname" id="lastname" {{if readOnly}}disabled{{endif readOnly}}
                        value="{{lastname}}" class="form-input !ml-10 !w-[40rem] !text-sm"
                        placeholder="Ingresar apellidos">

                    <label for="address" class="form-label !ml-10 !mt-2 !font-semibold !text-sm">Direccion</label>
                    <input type="text" name="address" id="address" {{if readOnly}}disabled{{endif readOnly}}
                        value="{{address}}" class="form-input !ml-10 !w-[40rem] !text-sm"
                        placeholder="Ingresar dirección">

                    <label for="phonenumber" class="form-label !ml-10 !mt-2 !font-semibold !text-sm">Numero de
                        telefono</label>
                    <input type="text" name="phonenumber" id="phonenumber" {{if readOnly}}disabled{{endif readOnly}}
                        value="{{phonenumber}}" class="form-input !ml-10 !w-[40rem] !text-sm"
                        placeholder="Ingresar telefono">

                    <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="select">Seleccione zona de
                        trabajo</label>
                    <select name="idworkzone" id="idworkzone" {{if readOnly}} disabled {{endif readOnly}}
                        class="form-select !ml-10 !w-[25rem] !text-sm">
                        {{foreach workzones}}
                        <option value="{{idworkzone}}" {{selected}}>{{department}},{{municipality}}</option>
                        {{endfor workzones}}
                    </select>

                    <label for="imgprofile" class="form-label !ml-10 !mt-2 !font-semibold !text-sm">Imagen de
                        perfil</label>
                    <input type="file" accept="image/png, image/jpeg"  name="imgprofile" id="imgprofile" {{if readOnly}}disabled{{endif readOnly}}
                        value="{{imgprofile}}" class="form-input !ml-10 !w-[40rem] !text-sm"
                        placeholder="Ingresar imagen">

                    <label for="imgportada" class="form-label !ml-10 !mt-2 !font-semibold !text-sm">Imagen de
                        portada</label>
                    <input type="file" name="imgportada" id="imgportada" {{if readOnly}}disabled{{endif readOnly}}
                        value="{{imgportada}}" class="form-input !ml-10 !w-[40rem] !text-sm"
                        placeholder="Ingresar imagen">
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