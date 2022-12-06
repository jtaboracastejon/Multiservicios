<h2>{{mode_dsc}}</h2>
<form action="index.php?page=Mnt-Provider&mode={{mode}}&idprovider={{idprovider}}" method="post"
  class="row col-6 offset-3">

  <fieldset class="form-group col-md-4">
        <label for="iduserdetail">Usuarios</label>
        <select name="iduserdetail" id="iduserdetail" {{if readOnly}} disabled {{endif readOnly}}  class="form-control">
            {{foreach getallU}}
            <option value="{{iduserdetail}}"  {{selected}}>{{firstname}}</option>
            {{endfor getallU}}>
        </select>
    </fieldset>
  <!--
  <section class="row my-2 align-center">
    <label for="iduserdetail" class="col-4">Detalle ID Usuario</label>
    <input type="text" class="col-8" name="iduserdetail" id="iduserdetail" {{if readonly}} disable {{endif readonly}}
      value="{{iduserdetail}}" />
  </section>
  -->


    <fieldset class="form-group col-md-4">
        <label for="idservice">Servicios</label>
        <select name="idservice" id="idservice" {{if readOnly}} disabled {{endif readOnly}}  class="form-control">
            {{foreach getallS}}
            <option value="{{idservice}}"  {{selected}}>{{servicename}}</option>
            {{endfor getallS}}>
        </select>
    </fieldset>

    <!--
    <section class="row my-2 align-center">
    <label for="idservice" class="col-4">Servicio ID </label>
    <input type="text" class="col-8" name="idservice" id="idservice" {{if readonly}} disable {{endif readonly}}
      value="{{idservice}}" />
  </section>
  -->

  <section class="row my-2 align-center">
    <label for="decription" class="col-4">Descripcion</label>
    <input type="text" class="col-8" name="decription" id="decription" {{if readonly}} disable {{endif readonly}}
      value="{{decription}}" />
  </section>

    
  <section class="row my-2 align-center">
    <label for="status" class="col-4">Estado</label>
    <select name="status" class="col-8" id="status" {{if readonly}} disable {{endif readonly}}>
      <option value="ACT" {{if act_selected}} selected {{endif act_selected}}>Activo</option>
      <option value="INA" {{if ina_selected}} selected {{endif ina_selected}}>Inactivo</option>
    </select>
  </section>

  <section class="row my-2 align-center">
    <label for="datecreate" class="col-4">Date</label>
    <input type="date" class="col-8" name="datecreate" id="datecreate" {{if readonly}} disable {{endif readonly}}
      value="{{datecreate}}" />
  </section>
  

  <!--
  <section class="row my-2 align-center">
    <label for="categoria_id" class="col-4">categoria</label>
    <input type="text" class="col-8" name="categoria_id" id="categoria_id" {{if readonly}} disable {{endif readonly}}
      value="{{categoria_id}}" />
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
         window.location.href ="index.php?page=Mnt-Providers";
    });

  </script>
</form>