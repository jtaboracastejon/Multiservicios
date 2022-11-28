<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>{{title}}</h1>

    <h1>Servicios</h1>
    {{foreach services}}
        <p>{{servicename}}</p>
        <img src="{{imagepath}}" alt="" width="100px">
    {{endfor services}}

    <h1>Tarjetas</h1>
    {{foreach cards}}
        <p>Nombre Proveedor: {{name}}</p>
        <p>Servicio Proveedor: {{servicename}}</p>
        <p>Descripcion Proveedor: {{decription}}</p>
        <p>Tiempo en la plataforma: {{tiempoPlataforma}}</p>
        <img src="{{imgprofile}}" alt="">
        <img src="{{imgportada}}" alt="">
        <p>Rating --Pendiente</p>
        <p>Verificado {{isVerified}}</p>
        <p>PRO</p>
    {{endfor cards}}


    <h1>Reseña de la pagina</h1>
    <section>
        <p>Reseña: "{{review}}"</p>
        <p>Nombre :{{name}}</p>
        <p>Direccion: {{address}}</p>
    </section>

    
</body>
</html>