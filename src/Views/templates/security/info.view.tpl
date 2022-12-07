<section class="fullCenter">
  <form class="grid" method="post" action="index.php?page=sec_register">
    <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <h1 class="col-12">Datos personales</h1>
    </section>
    <section class="depth-1 py-5 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtNombre">Nombres</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="text" id="txtNombre" name="txtNombre" value="{{txtNombre}}" />
        </div>
      </div>
      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtApellidos">Apellidos</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="text" id="txtApellidos" name="txtApellidos" value="{{txtApellidos}}" />
        </div>
      </div>
      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtTelefono">Numero de telefono</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="text" id="txtTelefono" name="txtTelefono" value="{{txtPswd}}" />
        </div>
      </div>
       <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtDireccion">Direccion</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="text" id="txtDireccion" name="txtDireccion" value="{{txtDireccion}}" />
        </div>
      </div>
       <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtZona">Zona laboral</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="password" id="txtZona" name="txtZona" value="{{txtZona}}" />
        </div>
      </div>
      <div class="row right flex-end px-4">
        <button class="primary" id="btnSignin" type="submit">Crear Cuenta</button>
      </div>
    </section>
  </form>
</section>
