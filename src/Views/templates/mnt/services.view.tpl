<h2>Listado de Servicios</h2>
<section class="WWList">
<table style="">
    <thead>
        <tr>
        <th>Nombre Servicio</th>
        <th>Descripción</th>
        <th>Image</th>
        <th>Estado</th>
        <th><a href="index.php?page=mnt-service&mode=INS">
        <ion-icon name="add-circle-sharp" size="large" style="color:green">Agregar</ion-icon>
        </a></th>
        </tr>
    </thead>
    <tbody style="text-align:center;">
        {{foreach services}}
        <tr>
        <td><a href="index.php?page=mnt-service&mode=DSP&idservice={{idservice}}" >{{servicename}}</a></td>
        <td>{{description}}</td>
        <td>{{imagepath}}</td>
        <td>{{status}}</td>
        <td>
            
            <a href="index.php?page=mnt-service&mode=UPD&idservice={{idservice}}">
              <ion-icon name="create-sharp" size="large" style="color:rgb(201, 201, 34);padding-right:10px;" >
                Editar
              </ion-icon>
            </a>
            <a href="index.php?page=mnt-service&mode=DEL&idservice={{idservice}}">
               <ion-icon name="trash-sharp" size="large" style="color:red; padding-left:10px;" >
                Eliminar
               </ion-icon>
            </a>
        </td>
        </tr>
        {{endfor services}}
    </tbody>
</table>
</section>
