<h1>{{mode_dsc}}</h1>
<h3>Agregando Review Providee</h3>
<form action="index.php?page=reviews-review&mode={{mode}}&idqualities={{idqualities}}" method="post" class="row">
   <fieldset class="form-group col-md-8">
        <label for="idordenfac">idordenfac</label>
        <input type="text" class="form-control" name="idordenfac" id="idordenfac" {{if readOnly}}disabled{{endif readOnly}} value="{{idordenfac}}">
    </fieldset>
      <fieldset class="form-group col-md-8">
        <label for="titulo">Titulo </label>
        <input type="text" class="form-control" name="titulo" id="titulo" {{if readOnly}}disabled{{endif readOnly}} value="{{titulo}}">
    </fieldset><br>
    <h3>Agregando qualities</h3>
     <fieldset class="form-group col-md-4">
        <label for="idreview">ID REVIEW</label>
        <select name="idreview" id="idreview" {{if readOnly}} disabled {{endif readOnly}}  class="form-control">
            {{foreach reviews}}
            <option value="{{idreview}}"  {{selected}}>{{idreview}}</option>
            {{endfor reviews}}>
        </select>
    </fieldset>
      <fieldset class="form-group col-md-8">
        <label for="rating">Rating </label>
        <input type="text" class="form-control" name="rating" id="rating" {{if readOnly}}disabled{{endif readOnly}} value="{{rating}}">
    </fieldset>
     <fieldset class="form-group col-md-8">
        <label for="time">Time </label>
        <input type="text" class="form-control" name="time" id="time" {{if readOnly}}disabled{{endif readOnly}} value="{{time}}">
    </fieldset>
     <fieldset class="form-group col-md-8">
        <label for="knowledge">Knowledge </label>
        <input type="text" class="form-control" name="knowledge" id="knowledge" {{if readOnly}}disabled{{endif readOnly}} value="{{knowledge}}">
    </fieldset>
     <fieldset class="form-group col-md-8">
        <label for="attitude">Attitude </label>
        <input type="text" class="form-control" name="attitude" id="attitude" {{if readOnly}}disabled{{endif readOnly}} value="{{attitude}}">
    </fieldset>
     <fieldset class="form-group col-md-8">
        <label for="communication">Communication </label>
        <input type="text" class="form-control" name="communication" id="communication" {{if readOnly}}disabled{{endif readOnly}} value="{{communication}}">
    </fieldset>
     <fieldset class="form-group col-md-8">
        <label for="puntuality">Puntuality </label>
        <input type="text" class="form-control" name="puntuality" id="puntuality" {{if readOnly}}disabled{{endif readOnly}} value="{{puntuality}}">
    </fieldset>
     <fieldset class="form-group col-md-8">
        <label for="responsibility">Responsibility </label>
        <input type="text" class="form-control" name="responsibility" id="responsibility" {{if readOnly}}disabled{{endif readOnly}} value="{{responsibility}}">
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
