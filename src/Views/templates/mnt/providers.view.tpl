<h1>Provider</h1>
<section class="WwWList">
    <table>
        <thead>
            <tr>
                <th>ProviderId</th>
                <th>Id user</th>
                <th>Service Id</th>
                <th>Decription</th>
                <th>Status</th>
                <th>Create</th>
                <th><a href="index.php?page=mnt-provider&mode=INS" class="btn w32 depth-1">+</a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach providers}}
            <tr>
                <td>{{idprovider}}</td>
                <td>{{iduserdetail}}</td>
                <td>{{idservice}}</td>
               <td><a href="index.php?page=mnt-provider&mode=DSP&idprovider={{idprovider}}">{{decription}}</a></td>
                <td>{{status}}</td>
                <td>{{datecreate}}</td>
                <td>
                    <a href="index.php?page=mnt-provider&mode=UPD&idprovider={{idprovider}}">
                        <i class="fas fa-edit">EDITAR</i>
                    </a>
                    <a href="index.php?page=mnt-provider&mode=DEL&idprovider={{idprovider}}">
                        <i class="fas fa-trash">DELETE</i>
                    </a>
                </td>
            </tr>
            {{endfor providers}}
        </tbody>
    </table>
</section>