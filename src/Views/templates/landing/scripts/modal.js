function modalHandler1(val = false, toModal, fromModal = null) {
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

//Login Modal
let txtEmail = document.getElementById("txtEmail");
let emailError = document.getElementById("emailError");
let txtPswd = document.getElementById("txtPswd");
let pswdError = document.getElementById("pswdError");
let error = false;



function validationForm() {

    if (txtEmail.value == "") {
        emailError.innerHTML = "El campo no puede estar vacio";
        return true;
    }
    if (txtPswd.value == "") {
        pswdError.innerHTML = "El campo no puede estar vacio";
        return  true;
    }

    return false;

}

function clickLogin() {
    if (!validationForm()) {
        console.log("Sin Error");
        $.ajax({
            type: "POST",
            url: "index.php?page=sec_login",
            data: {
                txtUser: txtEmail.value,
                txtPswd: txtPswd.value,
                btnLogin: true
            },
            success: function (response) {
                if (response == "success") {
                    window.location.href = "index.php?page=landing_landing";
                }
                else if (response == "error") {
                    pswdError.innerHTML = "Usuario o contraseña incorrectos";
                }
                else if (response == "sinVerificarCorreo") {
                    window.location.href = "index.php?page=landing_landing";
                    sweetAlert('Correo sin verificar', 'Debe verificar su correo electronico', 'warning');
                }
            }


        });
    }
    else {
        console.log("Con Error");
        return false;
    }

}


//Unete Modal

let txtEmailUnete = document.getElementById("txtEmailUnite");
let emailErrorUnete = document.getElementById("emailErrorUnite");
let rbCliente = document.getElementById("btnBgRb1");
let rbProveedor = document.getElementById("btnBgRb2");
let cbUsuarios;
let userType = document.getElementById("userType");


function validationFormUnete() {

    
    if (rbCliente.checked == false && rbProveedor.checked == false) {
        rbError.innerHTML = "Debe seleccionar una opcion";
        return true;
    }
    else {
        rbError.innerHTML = "";
        rbProveedor.checked == true ? cbUsuarios = "PRV" : cbUsuarios = "CLI";
        rbProveedor.checked == true ? userType.innerHTML = "Proveedor" : userType.innerHTML = "Cliente";
    };
    
    if (txtEmailUnete.value == "") {
        emailErrorUnete.innerHTML = "El campo no puede estar vacio";
        return true;
    }
    else {
        emailErrorUnete.innerHTML = "";
    }
    
    if(verificarEmail(txtEmailUnete, emailErrorUnete)){
        return true;
    }

    return false;
}

function clickRegister1() {
    if (!validationFormUnete()) {
        console.log("Sin Error");
        $.ajax({
            type: "POST",
            url: "index.php?page=sec_prueba",
            data: {
                txtEmail: txtEmailUnete.value,
                btnRegister: true,
                Cbusuarios: cbUsuarios,
            },
            success: function (response) {
                if (response == "success") {
                    modalHandler1(true, 'modal2', 'modal1');
                }
                else if (response == "exist") {
                    emailErrorUnete.innerHTML = "Correo ya existe";
                }
                else if (response == "error") {
                    emailErrorUnete.innerHTML = "Error al registrar";
                }
            }


        });
    }
    else {
        console.log("Con Error");
        return false;
    }

}

//Unete model 2 Datos Usuario

let txtUserName = document.getElementById("txtUserName");
let txtUserPass = document.getElementById("txtUserPass");
let txtConfirmPass = document.getElementById("txtConfirmPass");
let cmbDepto = document.getElementById("cmbDepto");
let cmbMuni = document.getElementById("cmbMuni");
let verificationText = document.getElementById("verificationText");
let lblValidar = document.getElementById("lblValidar");



function validationRegister2(){
    
    if (txtUserName.value == "") {
        userNameError.innerHTML = "El campo no puede estar vacio";
        return true;
    }
    else {
        userNameError.innerHTML = "";
    }
    
    if (txtUserPass.value == "" || txtConfirmPass.value == "") {
        userPassError.innerHTML = "Debe llenar todos los campos";
        return true;
    }
    else if (txtUserPass.value.length < 8 || txtConfirmPass.value.length < 8) {
        userPassError.innerHTML = "La contraseña debe tener al menos 8 caracteres";
        return true;
    }
    if(validatePassword(txtUserPass)){
        return true;
    }
    else if (txtUserPass.value !== txtConfirmPass.value) {
        userPassError.innerHTML = "Las contraseñas no coinciden";
        return true;
    }
    else {
        userPassError.innerHTML = "";
    }

    return false;
}

function clickRegister2() {
    if (!validationRegister2()) {
        console.log("Sin Error");
        $.ajax({
            type: "POST",
            url: "index.php?page=sec_register",
            data: {
                txtUser: txtUserName.value,
                txtPswd: txtUserPass.value,
                btnRegister2: true,
                cbDepartamentos: cmbDepto.value,
                cbMunicipios: cmbMuni.value,
            },
            success: function (response) {
                if (response == "success") {
                    sendCorreo();
                    modalHandler1(true, 'modal3', 'modal2');
                    lblValidar.innerHTML = txtUserName.value + ", antes de que puedas empezar con nosotros, necesitamos verificar tu correo electrónico por motivos de seguridad.";
                    verificationText.innerHTML = "Se ha enviado un correo a " + txtEmailUnete.value + " para validar su cuenta";
                }
                else if (response == "exist") {
                    userNameError.innerHTML = "Credencial ya registrada en el sistema";
                    return;
                }
                else if (response == "error") {
                    sweetAlert('Error', 'Error al registrar', 'error');
                    window.location.href = "index.php?page=landing_landing";
                }
                else {
                    sweetAlert('Error', 'Error al registrar', 'error');
                    window.location.href = "index.php?page=landing_landing";
                }
            }
        });
    }
}

//Unete model 3 Verificar Correo

let txtCode = document.getElementById("txtCode");
let codeError = document.getElementById("codeError");

function validationRegister3() {
    if (txtCode.value == "") {
        codeError.innerHTML = "El campo no puede estar vacio";
        return true;
    }
    else {
        codeError.innerHTML = "";
    }

    return false;
}

function clickRegister3() {
    if (!validationRegister3()) {
        console.log("Sin Error");
        $.ajax({
            type: "POST",
            url: "index.php?page=sec_verificacion",
            data: {
                txtVerificacion: txtCode.value,
                step: "verificar",
            },
            success: function (response) {
                if (response == "success") {
                    sweetAlert('Exito', 'Registro exitoso', 'success');
                    modalHandler1(false, 'modal3');
                }
                else if (response == "incorrecto") {
                    codeError.innerHTML = "El código de verificación es incorrecto";
                }
                else if (response == "error") {
                    codeError.innerHTML = "Ha ocurrido un error";
                }
                else {
                    alert(response);
                    sweetAlert('Error', 'Error al registrar', 'error');
                }
            }
        });
    }
}

//Funciones

function sendCorreo() {
    $.ajax({
        type: "POST",
        url: "index.php?page=sec_verificacion",
        data: {
            step: "enviarCorreo",
        },
        success: function (response) {
            if(response == "success"){
                console.log("Correo enviado");
            }
            else {
                
            }
        }
    });
}

function validatePassword(password){
        if(password.value.match(/[a-z]/g) && password.value.match(/[A-Z]/g) && password.value.match(/[0-9]/g) && password.value.match(/[.!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/g)){
            userPassError.innerHTML = "";
            return false;
        }
        else {
            userPassError.innerHTML = "La contraseña debe contener al menos una mayuscula, una minuscula, un número y un caracter especial";
            password.style.borderColor = "red";
            return true;
        }
    /* var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    return re.test(password) && re.test(confirmPassword); */
}

function verificarEmail(email, errorMsj){
    let emails = email.value; 
    //let regex = /^([a-zA-Z0-9\.-]+)@([a-zA-Z0-9-]+).([a-z]{2,8})(.[a-z]{2,8})?$/;
    let regex = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    if (regex.test(emails)) {
        errorMsj.innerHTML = "";
        return false;
    } else {
        errorMsj.innerHTML = "Correo invalido";
        errorMsj.style.color = "red";
        return true;
    };

};

function sweetAlert(title, message, icon) {
    swal.fire({
        title: title,
        text: message,
        icon: icon,
        confirmButtonColor: '#1C3879',
        confirmButtonText: 'Cerrar'
    });
}