
<form action="index.php?page=sec_userdetails" method="post">
    <h1>Formulario para detalles de usuario</h1> <br>
    <div class="form-group">
        <label for="txtfirstName">Nombres</label>
        <input type="text" class="form-control" id="txtfirstName" name="txtfirstName" value="{{txtfirstName}}">
         {{if errorfirstName}}
        <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorfirstName}}</div>
        {{endif errorfirstName}}
    </div>
    <div class="form-group">
        <label for="txtlastName">Apellidos</label>
        <input type="text" class="form-control" id="txtlastName" name="txtlastName" value="{{txtlastName}}">
    </div>
    <div class="form-group">
        <label for="txtAddress">Direccion</label>
        <input type="text" class="form-control" id="txtAddress" name="txtAddress" value="{{txtAddress}}">
    </div>
    <div class="form-group">
        <label for="txtPhone">Phone numbre</label>
        <input type="text" class="form-control" id="txtPhone" name="txtPhone" value="{{txtPhone}}">
    </div>
    <div class="form-group">
        <label for="txtProfile">Image profile</label>
        <input type="text" class="form-control" id="txtProfile" name="txtProfile" value="{{txtProfile}}">
    </div>
    <div class="fImagen de portada-group">
        <label for="txtPortada">Imagen de portada</label>
        <input type="text" class="form-control" id="txtPortada" name="txtPortada" value="{{txtPortada}}">
    </div>
    <div class="form-group">
       <button type="submit">Enviar</button>
    </div>
</form>