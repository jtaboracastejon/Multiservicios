<h2>Listado de Usuarios</h2>
<section class="WWList">
<table style="">
    <thead>
        <tr>
        <th>Correo del Usuario</th>
        <th>Nombre del Usuario</th>
        <th>Estado del Usuario</th>
        <th>Tipo de Usuario</th>
        <th></th>
        <!--
        <th><a href="index.php?page=mnt-user&mode=INS">
        <ion-icon name="add-circle-sharp" size="large" style="color:green">Agregar</ion-icon>
        </a></th>
        -->
        </tr>
    </thead>
    <tbody style="text-align:center;">
        {{foreach users}}
        <tr>
        <td><a href="index.php?page=mnt-user&mode=DSP&usercod={{usercod}}" >{{useremail}}</a></td>
        <td>{{username}}</td>
        <td>{{userest}}</td>
        <td>{{usertipo}}</td>
        <td>

            <a href="index.php?page=mnt-user&mode=UPD&usercod={{usercod}}">
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

            <a href="index.php?page=mnt-user&mode=DEL&usercod={{usercod}}">
               <ion-icon name="trash-sharp" size="large" style="color:red; padding-left:10px;" >
                Eliminar
               </ion-icon>
            </a>
        </td>
        </tr>
        {{endfor users}}
    </tbody>
</table>
</section>
