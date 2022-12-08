<form class="text-justify" action="index.php?page=Mnt-Review&mode={{mode}}&idreviewpage={{idreviewpage}}" method="post">
    <p class="pl-10 pt-10 text-black-400 text-xl font-bold lg:text-2xl mb-2">Formulario Reseñas</p>
    <fieldset>
        <label for="iduserdetail" class="form-label !ml-10 !font-semibold !text-sm">Id_user_detail</label>
        <input type="text" name="iduserdetail" id="iduserdetail" class="form-input !ml-10 !w-[40rem] !text-sm"
            placeholder="ID" value="{{iduserdetail}}" {{if readonly}} disable {{endif readonly}}>
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


