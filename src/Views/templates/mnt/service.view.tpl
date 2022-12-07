<form class="text-justify" action="index.php?page=Mnt-Service&mode={{mode}}&idservice={{idservice}}" method="post">
    <p class="pl-10 pt-10 text-black-400 text-xl font-bold lg:text-2xl mb-2">Formulario Servicios</p>
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
            <p>{{imagepath}}</p>

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


