<h2>Listado de Servicios</h2>
<section class="WWList">
<table style="">
    <thead>
        <tr>
        <th>Usuario</th>
        <th>Servicio ID </th>
        <th>Descripcion</th>
        <th>Estado</th>
        <th>Date</th>
        <th><a href="index.php?page=mnt-provider&mode=INS">
        <ion-icon name="add-circle-sharp" size="large" style="color:green">Agregar</ion-icon>
        </a></th>
        </tr>
    </thead>
    <tbody style="text-align:center;">
        {{foreach providers}}
        <tr>
        <td><a href="index.php?page=mnt-provider&mode=DSP&idprovider={{idprovider}}" >{{firstname}}</a></td>
        <td>{{servicename}}</td>
        <td>{{decription}}</td>
        <td>{{status}}</td>
        <td>{{datecreate}}</td>
        <td>
            
            <a href="index.php?page=mnt-provider&mode=UPD&idprovider={{idprovider}}">
              <ion-icon name="create-sharp" size="large" style="color:rgb(201, 201, 34);padding-right:10px;" >
                Editar
              </ion-icon>
            </a>
            
            <!--
            <a href="index.php?page=Mnt-Service&mode=UPD&quoteId={{idservice}}">
                        <i class="fas fa-edit"></i>
                    Editar
            </a>
            -->

            <a href="index.php?page=mnt-provider&mode=DEL&idprovider={{idprovider}}">
               <ion-icon name="trash-sharp" size="large" style="color:red; padding-left:10px;" >
                Eliminar
               </ion-icon>
            </a>
        </td>
        </tr>
        {{endfor providers}}
    </tbody>
</table>
</section>