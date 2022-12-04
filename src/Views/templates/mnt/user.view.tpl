<h2>{{mode_dsc}}</h2>
<form action="index.php?page=Mnt-User&mode={{mode}}&usercod={{usercod}}" method="post"
  class="row col-6 offset-3">
  <section class="row my-2 align-center">
    <label for="useremail" class="col-4">Email del Usuario</label>
    <input type="text" class="col-8" name="useremail" id="useremail" {{if readonly}} disable {{endif readonly}}
      value="{{useremail}}" />
  </section>
  <section class="row my-2 align-center">
    <label for="username" class="col-4">Nombre del Usuario</label>
    <input type="text" class="col-8" name="username" id="username" {{if readonly}} disable {{endif readonly}}
      value="{{username}}"/>
  </section>
  <section class="row my-2 align-center">
    <label for="userpswd" class="col-4">Contraseña del usuario</label>
    <input type="text" class="col-8" name="userpswd" id="userpswd" {{if readonly}} disable {{endif readonly}}
      value="{{userpswd}}" />
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
         window.location.href ="index.php?page=Mnt-Users";
    });

  </script>
</form>