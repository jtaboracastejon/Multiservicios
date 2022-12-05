<h1>{{mode_dsc}}</h1>
<form action="index.php?page=Mnt-Promotion&mode={{mode}}&promotionId={{promotionId}}" method="post">
    <fieldset class="form-group">
        <label for="">Usuario</label>
        <input type="text" name="" value="{{fullname}}" readonly>
        <input type="text" name="providercod" value="{{providercod}}">
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
            window.location.href = "index.php?page=Mnt-Promotions";
        })
    </script>
</form>