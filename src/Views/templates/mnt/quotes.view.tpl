<h1>Listado de Citas</h1>
<section class="WWList">
    <table>
        <thead>
            <tr>
                <th>Código</th>
                <th>Cita</th>
                <th>Autor</th>
                <th>Estado</th>
                <th>Creado</th>
                <th><a href="index.php?page=Mnt-Quote&mode=INS" class="btn w32 depth-1">+</a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach quotes}}
            <tr>
                <td>{{quoteId}}</td>
                <td><a href="index.php?page=Mnt-Quote&mode=DSP&quoteId={{quoteId}}">{{quote}}</a></td>
                <td>{{author}}</td>
                <td>{{status}}</td>
                <td>{{created}}</td>
                <td>
                    <a href="index.php?page=Mnt-Quote&mode=UPD&quoteId={{quoteId}}">
                        <i class="fas fa-edit">edit</i>
                    </a>
                    <a href="index.php?page=Mnt-Quote&mode=DEL&quoteId={{quoteId}}">
                        <i class="fas fa-trash">del</i>
                    </a>
                </td>
            </tr>
            {{endfor quotes}}
        </tbody>
    </table>
</section>