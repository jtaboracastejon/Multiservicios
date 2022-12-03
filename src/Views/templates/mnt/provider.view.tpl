<h1>{{mode_dsc}}</h1>
<form action="index.php?page=mnt-provider&mode={{mode}}&idprovider={{idprovider}}" method="post" class="row">
    <label for="iduserdetail">User </label>
        <select name="iduserdetail" id="iduserdetail" {{if readOnly}} disabled {{endif readOnly}}  class="form-control">
            {{foreach getAllUser}}
            <option value="{{iduserdetail}}"  {{selected}}>{{firstname}}</option>
            {{endfor getAllUser}}>
        </select>
    <fieldset class="form-group col-md-8">
      <label for="idservice">Id servivio</label>
        <select name="idservice" id="idservice" {{if readOnly}} disabled {{endif readOnly}}  class="form-control">
            {{foreach getALL}}
            <option value="{{idservice}}"  {{selected}}>{{servicename}}</option>
            {{endfor getALL}}>
        </select>
    </fieldset>
     <fieldset class="form-group col-md-8">
        <label for="decription">decription</label>
        <input type="text" class="form-control" name="decription" id="decription" {{if readOnly}}disabled{{endif readOnly}} value="{{decription}}">
    </fieldset>
     <fieldset class="form-group col-md-8">
          <label for="status">Status</label>
        <select name="status" id="status" {{if readOnly}} disabled {{endif readOnly}}  class="form-control">
            <option value="ACT" {{if act_selected}}selected{{endif act_selected}}>Activo</option>
            <option value="INA" {{if ina_selected}}selected{{endif ina_selected}}>Inactivo</option>
        </select>
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