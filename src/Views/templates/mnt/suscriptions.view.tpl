<h1>Listado de Suscripciones</h1>
<section class="WWList">
    <table>
        <thead>
            <tr>
                <th>Código</th>
                <th>Usuario</th>
                <th>Adquirida</th>
                <th>Expira</th>
                <th><a href="index.php?page=Mnt-suscription&mode=INS" class="btn w32 depth-1">+</a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach suscriptions}}
            <tr>
                <td><a href="index.php?page=Mnt-suscription&mode=DSP&suscriptionId={{idsuscription}}">{{idsuscription}}</a></td>
                <td>{{username}}</td>
                <td>{{startdate}}</td>
                <td>{{enddate}}</td>
                <td>
                    <a href="index.php?page=Mnt-suscription&mode=UPD&suscriptionId={{idsuscription}}">
                        <i class="fas fa-edit"></i>
                    </a>
                    <a href="index.php?page=Mnt-suscription&mode=DEL&suscriptionId={{idsuscription}}">
                        <i class="fas fa-trash"></i>
                    </a>
                </td>
            </tr>
            {{endfor suscriptions}}
        </tbody>
    </table>
</section>