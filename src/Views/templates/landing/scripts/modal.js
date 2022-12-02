function modalHandler1(val = false,  toModal, fromModal = null) {
    let toModalTg = document.getElementById(toModal);
    let fromModalTg = document.getElementById(fromModal);

    if(fromModalTg != null){
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

let txtEmail = document.getElementById("txtEmail");
let emailError = document.getElementById("emailError");
let txtPswd = document.getElementById("txtPswd");
let pswdError = document.getElementById("pswdError");
let error = false;






txtEmail.addEventListener("blur", function () {
    let email = txtEmail.value; 
    let regex = /^([a-zA-Z0-9\.-]+)@([a-zA-Z0-9-]+).([a-z]{2,8})(.[a-z]{2,8})?$/;
    if (regex.test(email)) {
        emailError.innerHTML = "";
        error = false;
        return true;
    } else {
        emailError.innerHTML = "Correo invalido";
        emailError.style.color = "red";
        error = true;
        return false;
    }
});

txtPswd.addEventListener("blur", function () {
    let pswd = txtPswd.value;
    if (pswd.length >= 8) {
        pswdError.innerHTML = "";
        error = false;
        return true;
    } else {
        pswdError.innerHTML = "La contraseña debe tener al menos 8 caracteres";
        pswdError.style.color = "red";
        error = true;
        return false;
    }
});

function validationForm() {
    if (txtEmail.value == "") {
        emailError.innerHTML = "El campo no puede estar vacio";
        emailError.style.color = "red";
        error = true;
    }
    if (txtPswd.value == "") {
        pswdError.innerHTML = "El campo no puede estar vacio";
        pswdError.style.color = "red";
        error = true;
    }

    if (error) {
        return false;
    } else {
        return true;
    }
}

function clickLogin(){
        if(validationForm()){
            console.log("Sin Error");
            $.ajax({
                type: "POST",
                url: "index.php?page=landing_landing",
                data:{
                    txtEmail: txtEmail.value,
                    txtPswd: txtPswd.value,
                    btnLogin: true
                },
                success: function (response) {
                    if(response == "success"){
                        window.location.href = "index.php?page=landing_landing";
                    }
                    else if(response == "error"){
                        pswdError.innerHTML = "Usuario o contraseña incorrectos";
                        pswdError.style.color = "red";
                    }
                    else if(response == "sinVerificarCorreo"){
                        window.location.href = "index.php?page=landing_landing";
                        alert("Debe verificar su correo electronico");
                    }
                }
                
                
            });
        }
        else{
            console.log("Con Error");
            return false;
        }               
    
}
