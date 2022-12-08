<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Formulario Reseñas</p>
            <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
                <div class="overflow-x-auto relative rounded-lg">


<form class="text-justify" action="index.php?page=Mnt-User&mode={{mode}}&usercod={{usercod}}" method="post">
    <p class="pl-10 pt-10 text-black-400 text-xl font-bold lg:text-2xl mb-2">Formulario que se pidio</p>
    <fieldset>
 
        <label for="username" class="form-label !ml-10 !font-semibold !text-sm">Nombre del Usuario</label>
        <input type="text" name="username" id="username" class="form-input !ml-10 !w-[40rem] !text-sm"
            placeholder="Nombre" value="{{username}}">
        <label for="useremail" class="form-label !ml-10 !font-semibold !text-sm">Email del Usuario</label>
        <input type="text" name="useremail" id="useremail" class="form-input !ml-10 !w-[40rem] !text-sm"
            placeholder="correo@gmail.com" value="{{useremail}}">
        <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="userest">Estado del usuario</label>
        <select name="userest" id="userest" class="form-select !ml-10 !w-[25rem] !text-sm">
            <option value="ACT" {{if act_selected}} selected {{endif act_selected}}>Activo</option>
            <option value="INA" {{if act_selected}} selected {{endif act_selected}}>Inactivo</option>
        </select>

        <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="usertipo">Tipo de Usuario</label>
        <select name="usertipo" id="usertipo" class="form-select !ml-10 !w-[25rem] !text-sm" {{if readonly}} disable {{endif readonly}}>
            <option value="CLI" {{if act_selected}} selected {{endif act_selected}}>Cliente</option>
            <option value="PRV" {{if act_selected}} selected {{endif act_selected}}>Proveedor</option>
            <option value="ADM" {{if act_selected}} selected {{endif act_selected}}>Administrador</option>
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
         window.location.href ="index.php?page=Mnt-Users";
    });

    </script>

</form>


 </div>
            </div>
        </div>
    </div>
</div>

