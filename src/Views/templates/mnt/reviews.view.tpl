<h2>Listado de Reseñas</h2>
<section class="WWList">
<table style="">
    <thead>
        <tr>
        <th>ID USER DETAIL</th>
        <th>Title</th>
        <th>Review</th>
        <th><a href="index.php?page=mnt-review&mode=INS">
        <ion-icon name="add-circle-sharp" size="large" style="color:green">Agregar</ion-icon>
        </a></th>
        </tr>
    </thead>
    <tbody style="text-align:center;">
        {{foreach reviews}}
        <tr>
        <td><a href="index.php?page=mnt-review&mode=DSP&idreviewpage={{idreviewpage}}" >{{iduserdetail}}</a></td>
        <td>{{title}}</td>
        <td>{{review}}</td>
        <td>
            <a href="index.php?page=mnt-review&mode=UPD&idreviewpage={{idreviewpage}}">
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

            <a href="index.php?page=mnt-review&mode=DEL&idreviewpage={{idreviewpage}}">
               <ion-icon name="trash-sharp" size="large" style="color:red; padding-left:10px;" >
                Eliminar
               </ion-icon>
            </a>
        </td>
        </tr>
        {{endfor reviews}}
    </tbody>
</table>
</section>
