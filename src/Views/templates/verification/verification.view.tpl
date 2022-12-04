<!--
<div> Esto es para cerrar el dashboard-->
    {{include dashboard/dashboard}}
    <div class="p-10 bg-multiLightGray col-span-4" id="barrelContainer">
    </div>
</div> <!--Esto es para cerrar el dashboard-->

<script>
    document.getElementById("barrelContainer");
    const statusProcess = ('{{statusProcess}}');
    if(statusProcess === "EN PROCESO"){
        barrelContainer.innerHTML = '{{include verification/partials/timeline}}';
    };
    if(statusProcess === "NO VERIFICADO"){
        barrelContainer.innerHTML = '{{include verification/partials/verificationForm}}';
    };
    if(statusProcess === "VERIFICADO"){
        barrelContainer.innerHTML = '{{include verification/partials/verified}}';
    };

</script>
