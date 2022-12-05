<h1>{{mode_dsc}}</h1>
<form action="index.php?page=Mnt-Suscription&mode={{mode}}&suscriptionId={{suscriptionId}}" method="post">
    <fieldset class="form-group">
        <label for="">Usuario</label>
        <select name="cmbUser" id="">
            {{foreach users}}
            <option value="{{usercod}}">{{username}}</option>
            {{endfor users}}
        </select>
    </fieldset>
    <fieldset class="row">
        {{if showSaveBtn}}
            <button type="submit" name="btnGuardar">
                Guardar
            </button>
        {{endif showSaveBtn}}
        
        <button id="btnCancelar">
            Cancelar
        </button>
    </fieldset>
    <script>
        document.getElementById("btnCancelar").addEventListener("click",function(event){
            event.preventDefault();
            window.location.href = "index.php?page=Mnt-Quotes";
        })
    </script>
</form>