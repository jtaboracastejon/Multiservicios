<section class="fullCenter">
  <form class="grid" method="post" action="index.php?page=sec_register">
    <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <h1 class="col-12">Crea tu cuenta</h1>
      <input type="text" name="txtEmail" value="{{txtEmail}}">
    </section>
    <section class="depth-1 py-5 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtUser">Nombre de usuario</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="text" id="txtUser" name="txtUser" value="{{txtUser}}" />
        </div>
         {{if errorUser}}
        <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorUser}}</div>
        {{endif errorUser}}
      </div>
      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtPswd">Contraseña</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}" />
        </div>
        {{if errorPswd}}
        <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorPswd}}</div>
        {{endif errorPswd}}
      </div>
      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtPswd2">Confirmar contraseña</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="password" id="txtPswd2" name="txtPswd2" value="{{txtPswd2}}" />
        </div>
        {{if errorPswd2}}
        <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorPswd2}}</div>
        {{endif errorPswd2}}
      </div>
      <div class="row">
        <label for="Departamentos">Departamentos</label>
        <select name="Departamentos" id="departamentos">
        {{foreach dbDeptos}}
          <option value="{{idworkzone}}">{{depto}}</option>
        {{endfor dbDeptos}}
        </select>
      </div>
      <div class="row">
        <label for="Municipios">Municipios</label>
        <select name="municipio" id="municipio">
          {{foreach dbMunicipios}}
          <option value="{{iddepto}}">{{municipality}}</option>
          {{endfor dbMunicipios}}
        </select>
      </div>
      <div class="row right flex-end px-4">
          <button class="primary" id="btnSignin" type="submit">Siguiente</button>
      </div>
    </section>
  </form>
</section>