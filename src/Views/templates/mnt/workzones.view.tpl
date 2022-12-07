<h1>Work Zones</h1>
<section class="WWList">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Departamento</th>
                <th>Municipio</th>
                <th>Estado</th>
                <th><a href="index.php?page=mnt-workzone&mode=INS" class="btn w32 depth-1">+</a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach workzones}}
            <tr>
                <td><a href="index.php?page=mnt-workzone&mode=DSP&idworkzone={{idworkzone}}">{{idworkzone}}</a></td>
                <td>{{department}}</td>
                <td>{{municipality}}</td>
                <td>{{status}}</td>
                <td>
                    <a href="index.php?page=mnt-workzone&mode=UPD&idworkzone={{idworkzone}}">
                        <i class="fas fa-edit">EDITAR</i>
                    </a>
                    <a href="index.php?page=mnt-workzone&mode=DEL&idworkzone={{idworkzone}}">
                        <i class="fas fa-trash">ELIMINAR</i>
                    </a>
                </td>
            </tr>
            {{endfor workzones}}
        </tbody>
    </table>
</section>