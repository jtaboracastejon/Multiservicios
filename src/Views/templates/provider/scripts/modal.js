function modalHandler(val = false, toModal, fromModal = null) {
    let toModalTg = document.getElementById(toModal);
    let fromModalTg = document.getElementById(fromModal);

    if (fromModalTg != null) {
        fadeOut(fromModalTg);
    }
    if (val) {
        fadeIn(toModalTg);
    } else {
        fadeOut(toModalTg);
    }
}
function fadeOut(el) {
    el.style.opacity = 1;
    (function fade() {
        if ((el.style.opacity -= 0.1) < 0) {
            el.style.display = "none";
        } else {
            requestAnimationFrame(fade);
        }
    })();
}
function fadeIn(el, display) {
    el.style.opacity = 0;
    el.style.display = display || "flex";
    (function fade() {
        let val = parseFloat(el.style.opacity);
        if (!((val += 0.2) > 1)) {
            el.style.opacity = val;
            requestAnimationFrame(fade);
        }
    })();
}

let NombrePromo = document.getElementById("txtNombrePromo");
let FechaInicio = document.getElementById("txtFechaInicio");
let FechaFinal = document.getElementById("txtFechaFinal");
let CostoTotal = document.getElementById("txtCostoTotal");

let nombrePromoError = document.getElementById("nombrePromoError");
let fechaInicioError = document.getElementById("fechaInicioError");
let fechaFinalError = document.getElementById("fechaFinalError");

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
            },
            success: function (data) {
                if(data == "success"){
                    alert("Promocion creada con exito");
                    modalHandler(false, "modalPromo");
                    location.reload();
                }
                else{
                    alert(data);                
                }
            }
        });
    }
}