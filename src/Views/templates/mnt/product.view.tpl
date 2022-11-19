<h1>{{mode_dsc}}</h1>
<form action="index.php?page=mnt-product&mode={{mode}}&productId={{productId}}" method="post" class="row">
    <fieldset class="form-group col-md-4">
        <label for="barcode">Código de Barras</label>
        <input type="text" class="form-control" name="barcode" id="barcode" {{if readOnly}}disabled{{endif readOnly}} value="{{barcode}}">
    </fieldset>
    <fieldset class="form-group col-md-8">
        <label for="description">Descripción</label>
        <input type="text" class="form-control" name="description" id="description" {{if readOnly}}disabled{{endif readOnly}} value="{{description}}">
    </fieldset>
    <fieldset class="form-group col-md-4">
        <label for="brandId">Marca</label>
        <select name="brandId" id="brandId" {{if readOnly}} disabled {{endif readOnly}}  class="form-control">
            {{foreach arrBrands}}
            <option value="{{value}}" {{selected}}>{{text}}</option>
            {{endfor arrBrands}}
        </select>
    </fieldset>
    <fieldset class="form-group col-md-4">
        <label for="categoryId">Categoría</label>
        <select name="categoryId" id="categoryId" {{if readOnly}} disabled {{endif readOnly}}  class="form-control">
            {{foreach arrCategories}}
            <option value="{{value}}"  {{selected}}>{{text}}</option>
            {{endfor arrCategories}}>
        </select>
    </fieldset>
    <fieldset class="form-group col-md-4">
        <label for="status">Estado</label>
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