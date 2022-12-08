let id = null;
console.log('modal.js');

function modalHandler(val = false, toModal, fromModal = null, text = null, idV = null) {
    id = idV;
    let toModalTg = document.getElementById(toModal);
    let fromModalTg = document.getElementById(fromModal);
    let textProblema2 = document.getElementById('txtUserProblema2');
    let textProblema = document.getElementById('txtUserProblema');

    if (fromModalTg != null) {
        fadeOut(fromModalTg);
    }
    if (val) {
        fadeIn(toModalTg);
        textProblema2.innerHTML =  text;
        textProblema.innerHTML =  text;
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


function sweetAlert(title, message, icon) {
    swal.fire({
        title: title,
        text: message,
        icon: icon,
        confirmButtonColor: '#1C3879',
        confirmButtonText: 'Cerrar'
    });
}



function aceptOrder(){

    $.ajax({
        url: window.location.href,
        type: 'POST',
        data: {
            idorder: id,
            step: 'acept'
        },
        success: function (response) {
            if (response == 'success') {
                sweetAlert('Orden aceptada', 'La orden ha sido aceptada correctamente', 'success');
                setTimeout(function () {
                    window.location.reload();
                }, 2000);
            } else {
                alert(response);
                sweetAlert('Error', 'Ha ocurrido un error, por favor intentelo mas tarde', 'error');
                setTimeout(function () {
                    window.location.reload();
                }, 2000);
            }
        }
    });
}

function rejectOrder(){
    $.ajax({
        url: window.window.location.href,
        type: 'POST',
        data: {
            idorder: id,
            step: 'reject'
        },
        success: function (response) {
            if (response == 'success') {
                sweetAlert('Orden rechazada', 'La orden ha sido rechazada', 'error');
                setTimeout(function () {
                    window.location.reload();
                }, 2000);
            } else {
                alert(response);
                sweetAlert('Error', 'Ha ocurrido un error, por favor intentelo mas tarde', 'error');
                setTimeout(function () {
                    location.reload();
                }, 2000);
            }
        }
    });
}

function cancelarOrder(){
    $.ajax({
        url: window.location.href,
        type: 'POST',
        data: {
            idorder: id,
            step: 'cancel'
        },
        success: function (response) {
            if (response == 'success') {
                sweetAlert('Orden cancelada', 'La orden ha sido cancelada', 'error');
                setTimeout(function () {
                    window.location.href = "index.php?page=orders_providerdash";
                }, 2000);
            } else {
                alert(response);
                sweetAlert('Error', 'Ha ocurrido un error, por favor intentelo mas tarde', 'error');
                setTimeout(function () {
                    location.reload();
                }, 2000);
            }
        }
    });
}

function finalizarOrder(){
    $.ajax({
        url: window.location.href,
        type: 'POST',
        data: {
            idorder: id,
            step: 'finish'
        },
        success: function (response) {
            if (response == 'success') {
                sweetAlert('Orden finalizada', 'La orden ha sido finalizada', 'success');
                setTimeout(function () {
                    window.location.href = "index.php?page=orders_providerdash";
                }, 2000);
            } else {
                alert(response);
                sweetAlert('Error', 'Ha ocurrido un error, por favor intentelo mas tarde', 'error');
                setTimeout(function () {
                    window.location.reload();
                }, 2000);
            }
        }
    });
}

