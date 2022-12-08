<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
        <div class="bg-white rounded-lg p-10">
            <p class="text-black-400 text-xl font-bold lg:text-2xl mb-2">Formulario Reseñas</p>
            <div class="grid grid-rows-1 m-5 rounded-lg h-auto bg-white">
                <div class="overflow-x-auto relative rounded-lg">



<form class="text-justify" action="index.php?page=Mnt-Review&mode={{mode}}&idreviewpage={{idreviewpage}}" method="post">
    <fieldset>
        <label class="form-label !ml-10 !mt-2 !font-semibold !text-sm" for="select">Seleccionar usuario</label>
              <select name="iduserdetail" id="iduserdetail" {{if readOnly}} disabled {{endif readOnly}}
                class="form-select !ml-10 !w-[25rem] !text-sm">
                    {{foreach getallU}}
                    <option value="{{iduserdetail}}" {{selected}}>{{firstname}} </option>
                    {{endfor getallU}}
              </select>
        
        
        
        <label for="title" class="form-label !ml-10 !mt-2 !font-semibold !text-sm">Titulo</label>
        <input type="text" name="title" id="title" class="form-input !ml-10 !w-[40rem] !text-sm"
            placeholder="Titulo" value="{{title}}" {{if readonly}} disable {{endif readonly}}>
        <label for="review" class="form-label !ml-10 !mt-2 !font-semibold !text-sm">Reseña</label>
        <input type="text" name="review" id="review" class="form-input !ml-10 !w-[40rem] !text-sm"
            placeholder="Reseña" value="{{review}}" {{if readonly}} disable {{endif readonly}}>
    </fieldset>

    {{if showSaveBtn}}
    <button type="submit" class="form-primaryButton !ml-10"  name="btnGuardar">Confirmar</button>
    {{endif showSaveBtn}}
    <button type="submit" class="form-secondaryButton !mb-4" id="btnCancelar">Cancelar</button>

    <script>
    document.getElementById("btnCancelar").addEventListener("click", function
      (event) {
        event.preventDefault();
         window.location.href ="index.php?page=Mnt-Reviews";
    });
    </script>

</form>

         </div>
            </div>
        </div>
    </div>
</div>


