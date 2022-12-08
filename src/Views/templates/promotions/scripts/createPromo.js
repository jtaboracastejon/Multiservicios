let NombrePromo = document.getElementById("txtNombrePromo");
let FechaInicio = document.getElementById("txtFechaInicio");
let FechaFinal = document.getElementById("txtFechaFinal");
let CostoTotal = document.getElementById("txtCostoTotal");

let nombrePromoError = document.getElementById("nombrePromoError");
let fechaInicioError = document.getElementById("fechaInicioError");
let fechaFinalError = document.getElementById("fechaFinalError");

const pricePromotionPerDayTg = document.getElementById("hidPrecioDePromo").value;
document.getElementById("txtPrecioDePromo").value = "L. "+ pricePromotionPerDayTg +" / día"

let dateInicio, dateFinal, diasDiferencia;
FechaInicio.addEventListener("change", function(){
    dateInicio= new Date(FechaInicio.value);
    if(dateFinal !== 'undefined'){
        getDays()
    }
});
FechaFinal.addEventListener("change", function(){
    dateFinal =  new Date(FechaFinal.value)
    if(dateInicio !== 'undefined'){
        getDays()
    }
});

function getDays(){
    var tiempoDiferencia = dateFinal.getTime() - dateInicio.getTime();
    diasDiferencia = tiempoDiferencia/(1000 * 3600 * 24);
    document.getElementById("txtCantidadDeDias").value = diasDiferencia
    document.getElementById("txtCostoTotal").value = "L. " + parseFloat(diasDiferencia) * parseFloat(pricePromotionPerDayTg);
}

function validateForm() {
    if(NombrePromo.value == ""){
        nombrePromoError.innerHTML = "El nombre de la promocion no puede estar vacio";
        return false;
    }
    else{
        nombrePromoError.innerHTML = "";
    }

    if(FechaInicio.value == ""){
        fechaInicioError.innerHTML = "La fecha de inicio no puede estar vacia";
        return false;
    }
    else{
        fechaInicioError.innerHTML = "";
    }

    if(FechaFinal.value == ""){
        fechaFinalError.innerHTML = "La fecha final no puede estar vacia";
        return false;
    }
    else{
        fechaFinalError.innerHTML = "";
    }
    
    if(diasDiferencia < 0){
        fechaFinalError.innerHTML = "La fecha final no puede ser menor a la fecha de inicio";
        return false;
    }
    else{
        fechaFinalError.innerHTML = "";
    }

    return true;
}

function savePromo(){
    if(validateForm()){
        $.ajax({
            type: "POST",
            url: "index.php?page=promotions_promotions",
            data: {
                promotionname: NombrePromo.value,
                startdate: FechaInicio.value,
                enddate: FechaFinal.value,
                costototal: parseFloat(diasDiferencia) * parseFloat(pricePromotionPerDayTg),
                days: parseFloat(diasDiferencia),
                price : parseFloat(pricePromotionPerDayTg),
            },
            success: function (response) {
                if(response == "error"){
                    alert(response);                
                }
                else{
                    window.location.href = response;
                }
            }
        });
    }
}