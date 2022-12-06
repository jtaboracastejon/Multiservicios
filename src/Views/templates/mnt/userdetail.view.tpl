<h1>{{mode_dsc}}</h1>
<form action="index.php?page=mnt-userdetail&mode={{mode}}&iduserdetail={{iduserdetail}}" method="post" class="row">
      <fieldset class="form-group col-md-4">
        <label for="usercod">Usuario a registrar</label>
        <select name="usercod" id="usercod" {{if readOnly}} disabled {{endif readOnly}}  class="form-control">
            {{foreach users}}
            <option value="{{usercod}}" {{selected}}>{{username}}</option>
            {{endfor users}}
        </select>
    </fieldset>
    <fieldset class="form-group col-md-8">
        <label for="firstname">Firstname</label>
        <input type="text" class="form-control" name="firstname" id="firstname" {{if readOnly}}disabled{{endif readOnly}} value="{{firstname}}">
    </fieldset>
    <fieldset class="form-group col-md-4">
        <label for="lastname">Lastname</label>
        <input type="text" class="form-control" name="lastname" id="lastname" {{if readOnly}}disabled{{endif readOnly}} value="{{lastname}}">
    </fieldset>
    <fieldset class="form-group col-md-4">
        <label for="address">address</label>
        <input type="text" class="form-control" name="address" id="address" {{if readOnly}}disabled{{endif readOnly}} value="{{address}}">
    </fieldset>
    <fieldset class="form-group col-md-4">
        <label for="phonenumber">phonenumber</label>
        <input type="text" class="form-control" name="phonenumber" id="phonenumber" {{if readOnly}}disabled{{endif readOnly}} value="{{phonenumber}}">
    </fieldset>
     <fieldset class="form-group col-md-4">
        <label for="idworkzone">idworkzone</label>
        <select name="idworkzone" id="idworkzone" {{if readOnly}} disabled {{endif readOnly}}  class="form-control">
            {{foreach workzones}}
            <option value="{{idworkzone}}" {{selected}}>{{department}},{{municipality}}</option>
            {{endfor workzones}}
        </select>
    </fieldset>
    <fieldset class="form-group col-md-4">
        <label for="imgprofile">imgprofile</label>
        <input type="text" class="form-control" name="imgprofile" id="imgprofile" {{if readOnly}}disabled{{endif readOnly}} value="{{imgprofile}}">
    </fieldset>
     <fieldset class="form-group col-md-4">
        <label for="imgportada">imgportada</label>
        <input type="text" class="form-control" name="imgportada" id="imgportada" {{if readOnly}}disabled{{endif readOnly}} value="{{imgportada}}">
    </fieldset>
    <fieldset class="row">
        {{if showSaveBtn}}
            <button type="submit" name="btnGuardar">
                Guardar
            </button>
        {{endif showSaveBtn}}
        
        <button id="btnCancelar" class="btn btn-secondary">
            Cancelar
        </button>
    </fieldset>
</form>