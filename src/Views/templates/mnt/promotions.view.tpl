<h1>Listado de Promociones</h1>
<section class="WWList">
    <table>
        <thead>
            <tr>
                <th>Código</th>
                <th>Usuario</th>
                <th>Adquirida</th>
                <th>Expira</th>
                <th><a href="index.php?page=Mnt-promotion&mode=INS" class="btn w32 depth-1">+</a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach promotions}}
            <tr>
                <td><a href="index.php?page=Mnt-promotion&mode=DSP&promotionId={{idpromotion}}">{{idpromotion}}</a></td>
                <td>{{fullname}}</td>
                <td>{{startdate}}</td>
                <td>{{enddate}}</td>
                <td>
                    <a href="index.php?page=Mnt-promotion&mode=UPD&promotionId={{idpromotion}}">
                        <i class="fas fa-edit"></i>
                    </a>
                    <a href="index.php?page=Mnt-promotion&mode=DEL&promotionId={{idpromotion}}">
                        <i class="fas fa-trash"></i>
                    </a>
                </td>
            </tr>
            {{endfor promotions}}
        </tbody>
    </table>
</section>