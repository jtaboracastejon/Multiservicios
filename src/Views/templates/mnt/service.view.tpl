<h2>{{mode_dsc}}</h2>
<form action="index.php?page=Mnt-Service&mode={{mode}}&idservice={{idservice}}" method="post"
  class="row col-6 offset-3">
  <section class="row my-2 align-center">
    <label for="servicename" class="col-4">Nombre del Servicio</label>
    <input type="text" class="col-8" name="servicename" id="servicename" {{if readonly}} disable {{endif readonly}}
      value="{{servicename}}" />
  </section>
  <section class="row my-2 align-center">
    <label for="description" class="col-4">Descripcion</label>
    <input type="text" class="col-8" name="description" id="description" {{if readonly}} disable {{endif readonly}}
      value="{{description}}" />
  </section>
  <section class="row my-2 align-center">
    <label for="imagepath" class="col-4">Imagen</label>
    <input type="text" class="col-8" name="imagepath" id="imagepath" {{if readonly}} disable {{endif readonly}}
      value="{{imagepath}}" />
  </section>
  

  <!--
  <section class="row my-2 align-center">
    <label for="categoria_id" class="col-4">categoria</label>
    <input type="text" class="col-8" name="categoria_id" id="categoria_id" {{if readonly}} disable {{endif readonly}}
      value="{{categoria_id}}" />
  </section>
  -->


  <section class="row my-2 align-center">
    <label for="status" class="col-4">Estado</label>
    <select name="status" class="col-8" id="status" {{if readonly}} disable {{endif readonly}}>
      <option value="ACT" {{if act_selected}} selected {{endif act_selected}}>Activo</option>
      <option value="INA" {{if ina_selected}} selected {{endif ina_selected}}>Inactivo</option>
    </select>
  </section>

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
         window.location.href ="index.php?page=Mnt-Services";
    });

  </script>
</form>