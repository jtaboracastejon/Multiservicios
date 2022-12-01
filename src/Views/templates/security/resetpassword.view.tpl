<section class="fullCenter">
  {{if showFomrEmail}}
  <form class="grid" method="post" action="index.php?page=sec_resetpassword">
    <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <h1 class="col-12">Olvidé mi Contraseña</h1>
    </section>
    <section class="depth-1 py-5 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <div class="row">
        <label for="">Ingrese su dirección de correo electrónico para que podamos enviarle un correo electrónico para restablecer su contraseña.</label>
        <label class="col-12 col-m-4 flex align-center" for="txtEmail">Correo Electrónico</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}" />
        </div>
        {{if errorEmail}}
        <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorEmail}}</div>
        {{endif errorEmail}}
      </div>
      <div class="row right flex-end px-4">
        <button class="primary" id="btnForgot" type="submit">Enviar</button>
      </div>
    </section>
  </form>
  {{endif showFomrEmail}}
  {{if showFormPassword}}
  <form class="grid" method="post" action="index.php?page=sec_resetpassword&token={{token}}">
    <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <h1 class="col-12">Restablecer Contraseña</h1>
    </section>
    <section class="depth-1 py-5 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <div class="row">
        <label for="">Ingrese su nueva contraseña.</label>
        <label class="col-12 col-m-4 flex align-center" for="txtPassword">Contraseña</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="password" id="txtPassword" name="txtPassword" value="{{txtPassword}}" />
        </div>
        {{if errorPassword}}
        <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorPassword}}</div>
        {{endif errorPassword}}
        <label class="col-12 col-m-4 flex align-center" for="txtPassword2">Confirmar Contraseña</label>
        <div class="col-12 col-m-8">
          <input class="width-full" type="password" id="txtPassword2" name="txtPassword2" value="{{txtPassword2}}" />
        </div>
        {{if errorPassword2}}
        <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorPassword2}}</div>
        {{endif errorPassword2}}
      </div>
      <div class="row right flex-end px-4">
        <button class="primary" id="btnForgot" type="submit">Enviar</button>
      </div>
    </section>
  </form>
  {{endif showFormPassword}}
</section>