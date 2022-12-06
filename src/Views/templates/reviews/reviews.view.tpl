<h1>PROVIDER REVIEW</h1>
<section class="WWList">
    <table>
        <thead>
            <tr>
                <th>Id qualities</th>
                <th>Id review</th>
                <th>Titulo</th>
                <th>Rating</th>
                <th>Time</th>
                <th>knowledge</th>
                <th>attitude</th>
                <th>communication</th>
                <th>puntuality</th>
                <th>responsibility</th>
                <th><a href="index.php?page=Reviews-Review&mode=INS" class="btn w32 depth-1">+</a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach GetAll}}
            <tr>
                <td>{{idqualities}}</td>
                <td>{{idreview}}</td>
                <td>{{titulo}}</td>
                <td>{{rating}}</td>
                <td>{{time}}</td>
                <td>{{knowledge}}</td>
                <td>{{attitude}}</td>
                <td>{{communication}}</td>
                <td>{{puntuality}}</td>
                <td>{{responsibility}}</td>
                <td>
                    <a href="index.php?page=Reviews-Review&mode=UPD&idqualities={{idqualities}}">
                        <i class="fas fa-edit">EDITAR</i>
                    </a>
                    <a href="index.php?page=Reviews-Review&mode=DEL&idqualities={{idqualities}}">
                        <i class="fas fa-trash">ELIMINAR</i>
                    </a>
                </td>
            </tr>
            {{endfor GetAll}}
        </tbody>
    </table>
</section><br>
