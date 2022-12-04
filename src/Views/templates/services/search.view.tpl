{{include common/navbar}}
<form action="index.php?page=services_search&service={{service}}&query={{query}}" method="post">
    <select name="cmbdepto" id="cmbdepto">
        <option value="1">Atlantidad</option>
        <option value="2">Colon</option>
    </select>
    <select name="cmbmunicipio" id="cmbmunicipio">
        <option value="1">La ceiba</option>
        <option value="2">Tela</option>
        <option value="3">Jutiapa</option>
    </select>
    <input type="submit" value="Aplicar" name="btnChangeZone" id="btnChangeZone">
</form>

<br>
<br>
<br>

<form action="index.php?page=services_search&service={{service}}&query={{query}}&result={{pagenum}}" method="post">
    <label for="txtBuscarQuery">Buscador de servicios o proveedores</label>
    <input type="text" name="txtSearch" id="txtSearch" value="{{query}}" placeholder="Buscar servicios o proveedores" />
    <input type="submit" value="Buscar" name="btnSearch"/>
</form>

<br>
<br>
<br>

{{if isService}}
<h1>{{servicename}}</h1>
<h2>{{description}}</h2>
{{endif isService}}

<h1>Resultados de la busqueda</h1>
{{ifnot noResults}}
    <section>
        {{foreach providers}}
            <div>
                <h2>{{name}}</h2>
                <p>{{decription}}</p>
            </div>
        {{endfor providers}}
    </section>
    <p>--Pagina {{pagenum}} de {{last}}--</p>
    {{ifnot isOnly}}
        {{if isFirst}}
        <a href="{{urlNext}}">Siguiente</a>
        <p>first</p>
        {{endif isFirst}}

        {{if isMiddle}}
        <a href="{{urlPrev}}">Anterior</a>
        <a href="{{urlNext}}">Siguiente</a>
        {{endif isMiddle}}

        {{if isLast}}
            <a href="{{urlPrev}}">Anterior</a>
            <p>Last</p>
        {{endif isLast}}
    {{endifnot isOnly}}
{{endifnot noResults}}
    
{{if noResults}}
    <p>No se encontraron resultados</p>
{{endif noResults}}
    
<script >
     var cmbChangeZone = document.getElementById('cmbChangeZone');

    if (cmbChangeZone) {
        cmbChangeZone.addEventListener('change', function() {
            console.log(this.value);
            $.ajax({
                url: 'index.php?page=services_search&service={{service}}',
                type: 'POST',
                data: {
                    idworkzone: this.value,
                    step: 'A'
                },
                success: function(data) {
                    console.log(data);
                    window.location.reload();
                }
            });
            
        });
    };
    //document.getElementById('btnChangeZone').addEventListener("click", function(){
    //    var depto = document.getElementById('cmbdepto').value;
    //    var municipio = document.getElementById('cmbmunicipio').value;
    //    var url = "index.php?page=services_search&service={{service}}&query={{query}}&result={{pagenum}}&depto="+depto+"&municipio="+municipio;
    //    console.log(url);
    //});
</script>