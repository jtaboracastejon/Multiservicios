<h1>Listado de Productos</h1>
<section class="WWList">
    <table>
        <thead>
            <tr>
                <th>Código</th>
                <th>Firstname</th>
                <th>Lastname</th>
                <th>Username</th>
                <th>Addres</th>
                <th>PhoneNumber</th>
                <th>Department</th>
                 <th>Municipalities</th>
                  <th>imaPerfil</th>
                   <th>imaPortada</th>
                <th><a href="index.php?page=mnt-userdetail&mode=INS" class="btn w32 depth-1">+</a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach uDetails}}
            <tr>
                <td>{{iduserdetail}}</td>
                <td>{{firstname}}</td>
                <td>{{lastname}}</td>
                <td>{{username}}</td> 
                <td>{{address}}</td> 
                <td>{{phonenumber}}</td>
                <td>{{department}}</td>
                <td>{{municipality}}</td>
                <td>{{imgprofile}}</td>
                <td>{{imgportada}}</td>
                <td>
                    <a href="index.php?page=mnt-userdetail&mode=UPD&iduserdetail={{iduserdetail}}">
                        <i class="fas fa-edit"></i>
                    </a>
                    <a href="index.php?page=mnt-userdetail&mode=DEL&iduserdetail={{iduserdetail}}">
                        <i class="fas fa-trash"></i>
                    </a>
                </td>
            </tr>
            {{endfor uDetails}}
        </tbody>
    </table>
</section>