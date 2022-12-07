<h1>{{mode_dsc}}</h1>
<form action="index.php?page=mnt-workzone&mode={{mode}}&idworkzone={{idworkzone}}" method="post" class="row">
    <fieldset class="form-group col-md-4">
        <label for="iddepto">Departamento</label>
        <select name="iddepto" id="iddepto" {{if readOnly}} disabled {{endif readOnly}}  class="form-control">
            {{foreach getAllD}}
            <option value="{{iddepto}}"  {{selected}}>{{department}}</option>
            {{endfor getAllD}}>
        </select>
    </fieldset>
     <fieldset class="form-group col-md-4">
        <label for="idmunicipality">Municipio</label>
        <select name="idmunicipality" id="idmunicipality" {{if readOnly}} disabled {{endif readOnly}}  class="form-control">
            {{foreach getAllM}}
            <option value="{{idmunicipality}}"  {{selected}}>{{municipality}}</option>
            {{endfor getAllM}}>
        </select>
    </fieldset>
    <fieldset class="form-group col-md-4">
        <label for="status">Estado</label>
        <select name="status" id="status" {{if readOnly}} disabled {{endif readOnly}}  class="form-control">
            <option value="DIS" {{if dis_selected}}selected{{endif dis_selected}}>Disponible</option>
            <option value="NODIS" {{if nodis_selected}}selected{{endif nodis_selected}}>No disponible</option>
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