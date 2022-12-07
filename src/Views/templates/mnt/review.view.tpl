<h2>{{mode_dsc}}</h2>
<form action="index.php?page=Mnt-Review&mode={{mode}}&idreviewpage={{idreviewpage}}" method="post"
  class="row col-6 offset-3">
  <section class="row my-2 align-center">
    <label for="iduserdetail" class="col-4">Id_user_detail</label>
    <input type="text" class="col-8" name="iduserdetail" id="iduserdetail" {{if readonly}} disable {{endif readonly}}
      value="{{iduserdetail}}" />
  </section>
  <section class="row my-2 align-center">
    <label for="title" class="col-4">Title</label>
    <input type="text" class="col-8" name="title" id="title" {{if readonly}} disable {{endif readonly}}
      value="{{title}}" />
  </section>
  <section class="row my-2 align-center">
    <label for="review" class="col-4">Review</label>
    <input type="text" class="col-8" name="review" id="review" {{if readonly}} disable {{endif readonly}}
      value="{{review}}" />
  </section>
  

<!--
  <section class="row my-2 align-center">
    <label for="status" class="col-4">Estado</label>
    <select name="status" class="col-8" id="status" {{if readonly}} disable {{endif readonly}}>
      <option value="ACT" {{if act_selected}} selected {{endif act_selected}}>Activo</option>
      <option value="INA" {{if ina_selected}} selected {{endif ina_selected}}>Inactivo</option>
    </select>
  </section>

  -->

  <br /><br />
  }
  <section class="row flex-end my-2">
    {{if showSaveBtn}}
    <button class="mx-2 primary" type="submit" name="btnGuardar">Guardar</button>
    {{endif showSaveBtn}}
    <button id="btnCancelar">Cancelar</button>
  </section>

  <script>
    document.getElementById("btnCancelar").addEventListener("click", function
      (event) {
        event.preventDefault();
         window.location.href ="index.php?page=Mnt-Reviews";
    });

  </script>
</form>