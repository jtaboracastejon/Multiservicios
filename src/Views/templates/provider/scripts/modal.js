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

let userProblema = document.getElementById("txtUserProblema");
let userProblemaModal = document.getElementById("userProblemaError");

function validation(){
    if(userProblema.value == ""){
        userProblemaModal.innerHTML = "El campo no puede estar vacio";
        return false;
    }else{
        userProblemaModal.innerHTML = "";
        return true;
    }
}

function saveProblem(){
    if(validation()){
        $.ajax({
            url: window.location.href,
            type: "POST",
            data: {
                description: userProblema.value
            },
            success: function (response) {
                if(response == "success"){
                    
                    sweetAlert("¡Gracias!", "Tu problema ha sido enviado", "success");
                    modalHandler(false, 'modalContactProvider');
                }
                else{
                    modalHandler(false, 'modalContactProvider');
                    sweetAlert("¡Error!", "Ha ocurrido un error, intenta de nuevo más tarde", "error");
                }
            }
        });
    }
}

function sweetAlert(title, message, icon) {
    swal.fire({
        title: title,
        text: message,
        icon: icon,
        confirmButtonColor: '#1C3879',
        confirmButtonText: 'Cerrar'
    });
}


