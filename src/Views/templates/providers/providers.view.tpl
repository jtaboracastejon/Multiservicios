<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reseñas</title>
</head>
<body>
   
    <h1>Providers</h1>
    {{foreach cards}}
        <p>Nombre Proveedor: {{name}}</p>
        <p>Servicio Proveedor: {{servicename}}</p>
        <p>Descripcion Proveedor: {{decription}}</p>
        <p>Tiempo en la plataforma: {{tiempoPlataforma}}</p>
        <p>Rating --Pendiente</p>
        <p>Verificado {{isVerified}}</p>
        <p>PRO</p>
    {{endfor cards}}


    <h1>Reseñas</h1>
    {{foreach ReviewP}}
        <h2>{{firstname}} {{lastname}}--{{rating}}</h2>
        <p>{{department}} , {{municipality}}</p>
        <h3>Title: {{title}}</h3>
        <p>Review: {{review}}</p>
    {{endfor ReviewP}}
</body>
</html>