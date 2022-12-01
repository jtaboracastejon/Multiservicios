
<form action="index.php?page=sec_prueba" method="post">
   <fieldset>
    <div>
      <input value="PRV" type="radio" id="Cbusuarios" name="Cbusuarios" checked>
      <label for="scales">Proveedor</label>
    </div>

    <div>
      <input value="CLI" type="radio" id="Cbusuarios" name="Cbusuarios">
      <label for="horns">usuario</label>
    </div>
</fieldset>
<div>
    <input type="email" name="txtEmail" id="txtEmail" placeholder="Correo electronico" required>
    <input name="btnEnviar" type="submit" value="Enviar">
    {{if errorEmailE}}
        <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorEmailE}}</div>
        {{endif errorEmailE}}
</div>
</form>

