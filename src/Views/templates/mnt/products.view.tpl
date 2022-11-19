<h1>Listado de Productos</h1>
<section class="WWList">
    <table>
        <thead>
            <tr>
                <th>Código</th>
                <th>Código de Barras</th>
                <th>Descripción</th>
                <th>Marca</th>
                <th>Categoría</th>
                <th>Estado</th>
                <th>Creado</th>
                <th><a href="index.php?page=mnt-product&mode=INS" class="btn w32 depth-1">+</a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach products}}
            <tr>
                <td>{{productId}}</td>
                <td>{{barcode}}</td>
                <td><a href="index.php?page=mnt-product&mode=DSP&productId={{productId}}">{{description}}</a></td>
                <td>{{brandId}}</td>
                <td>{{categoryId}}</td>
                <td>{{status}}</td>
                <td>{{created}}</td>
                <td>
                    <a href="index.php?page=mnt-product&mode=UPD&productId={{productId}}">
                        <i class="fas fa-edit"></i>
                    </a>
                    <a href="index.php?page=mnt-product&mode=DEL&productId={{productId}}">
                        <i class="fas fa-trash"></i>
                    </a>
                </td>
            </tr>
            {{endfor products}}
        </tbody>
    </table>
</section>