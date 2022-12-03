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

//Login Modal
let txtEmail = document.getElementById("txtEmail");
let emailError = document.getElementById("emailError");
let txtPswd = document.getElementById("txtPswd");
let pswdError = document.getElementById("pswdError");
let error = false;


verificarEmail(txtEmail, emailError);

function validationForm() {
    if (txtEmail.value == "") {
        emailError.innerHTML = "El campo no puede estar vacio";
        return error = true;
    }
    if (txtPswd.value == "") {
        pswdError.innerHTML = "El campo no puede estar vacio";
        return error = true;
    }
    
    return false;
    
}

function clickLogin(){
        if(!validationForm()){
            console.log("Sin Error");
            $.ajax({
                type: "POST",
                url: "index.php?page=sec_login",
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
                    }
                    else if(response == "sinVerificarCorreo"){
                        alert("Debe verificar su correo electronico");
                        window.location.href = "index.php?page=landing_landing";
                    }
                }
                
                
            });
        }
        else{
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

verificarEmail(txtEmailUnete, emailErrorUnete);

function validationFormUnete() {
    if (rbCliente.checked == false && rbProveedor.checked == false) {
        rbError.innerHTML = "Debe seleccionar una opcion";
        return true;
    }
    else{
        rbError.innerHTML = "";
        rbProveedor.checked == true ? cbUsuarios = "PRV" : cbUsuarios = "CLI";
        rbProveedor.checked == true ? userType.innerHTML = "Proveedor" : userType.innerHTML = "Cliente";
    };

    if (txtEmailUnete.value == "") {
        emailErrorUnete.innerHTML = "El campo no puede estar vacio";
        return true;
    }
    else{
        emailErrorUnete.innerHTML = "";
    }
    

    return false;
}

function clickRegister1(){
    if(!validationFormUnete()){
        console.log("Sin Error");
        $.ajax({
            type: "POST",
            url: "index.php?page=sec_prueba",
            data:{
                txtEmail: txtEmailUnete.value,
                btnRegister: true,
                Cbusuarios : cbUsuarios,
            },
            success: function (response) {
                if(response == "success"){
                    modalHandler1(true, 'modal2', 'modal1');
                }
                else if(response == "exist"){
                    emailErrorUnete.innerHTML = "Correo ya existe";
                }
                else if(response == "error"){
                    emailErrorUnete.innerHTML = "Error al registrar";
                }
            }
            
            
        });
    }
    else{
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



function validationRegister2(){
    validatePassword(txtUserPass);
    if (txtUserName.value == "") {
        userNameError.innerHTML = "El campo no puede estar vacio";
        return true;
    }
    else{
        userNameError.innerHTML = "";
    }

    if (txtUserPass.value == "" || txtConfirmPass.value == "") {
        userPassError.innerHTML = "Debe llenar todos los campos";
        return true;
    }
    else if(txtUserPass.value.length < 8 || txtConfirmPass.value.length < 8){
        userPassError.innerHTML = "La contraseña debe tener al menos 8 caracteres";
        return true;
    }
    else if (txtUserPass.value != txtConfirmPass.value) {
        userPassError.innerHTML = "Las contraseñas no coinciden";
        return true;
    }
    else{
        userPassError.innerHTML = "";
    }

    return false;
}

function clickRegister2(){
    if(!validationRegister2()){
        console.log("Sin Error");
        $.ajax({
            type: "POST",
            url: "index.php?page=sec_register",
            data:{
                txtUser: txtUserName.value,
                txtPswd: txtUserPass.value,
                btnRegister2: true,
                cbDepartamentos : cmbDepto.value,
                cbMunicipios : cmbMuni.value,
            },
            success: function (response) {
                if(response == "success"){
                    sendCorreo();
                    modalHandler1(true, 'modal3', 'modal2');
                }
                else if(response == "exist"){
                    userNameError.innerHTML = "Credencial ya registrada en el sistema";
                }
                else if(response == "error"){
                    alert("Error al registrar");
                    window.location.href = "index.php?page=landing_landing";
                }
                else {
                    alert(response);
                }
            }
        });
    }
}

//Unete model 3 Verificar Correo

let txtCode = document.getElementById("txtCode");
let codeError = document.getElementById("codeError");

function validationRegister3(){
    if (txtCode.value == "") {
        codeError.innerHTML = "El campo no puede estar vacio";
        return true;
    }
    else{
        codeError.innerHTML = "";
    }

    return false;
}

function clickRegister3(){
    if(!validationRegister3()){
        console.log("Sin Error");
        $.ajax({
            type: "POST",
            url: "index.php?page=sec_verificacion",
            data:{
                txtVerificacion: txtCode.value,
                step: "verificar",
            },
            success: function (response) {
                if(response == "success"){
                    alert("Cuenta verificada correctamente");
                    modalHandler1(true, 'modal4', 'modal3');
                }
                else if(response == "incorrecto"){
                    codeError.innerHTML = "El código de verificación es incorrecto";
                }
                else if(response == "error"){
                    codeError.innerHTML = "Ha ocurrido un error";
                }
                else {
                    alert(response + "Error");
                }
            }
        });
    }
}

//Funciones

function sendCorreo(){
    $.ajax({
        type: "POST",
        url: "index.php?page=sec_verificacion",
        data:{
            step: "enviarCorreo",
        },
        success: function (response) {
            if(response == "success"){
                alert("¡Para verificar tu cuenta entra al link enviado a tu correo!");
            }
            else{
                alert("Error al enviar correo");
            }
        }
    });
}

function validatePassword(password){
        if(password.value.match(/[a-z]/g) && password.value.match(/[A-Z]/g) && password.value.match(/[0-9]/g) && password.value.length >= 8){
            userPassError.innerHTML = "";

            var strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
            var mediumRegex = new RegExp("/^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,32}$/");

            if(strongRegex.test(password)){
                password.style.borderColor = "green";
                return true;
            }
            else if(mediumRegex.test(password)){
                password.style.borderColor = "orange";
                return true;
            }
            else{
                password.style.borderColor = "red";
                return false;
            }
        }
        else{
            userPassError.innerHTML = "La contraseña debe contener al menos 8 caracteres, una mayuscula, una minuscula y un número";
            password.style.borderColor = "red";
            return false;
        }
    /* var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    return re.test(password) && re.test(confirmPassword); */
}

function verificarEmail(email, errorMsj){
    email.addEventListener("blur", function () {
    let emails = email.value; 
    let regex = /^([a-zA-Z0-9\.-]+)@([a-zA-Z0-9-]+).([a-z]{2,8})(.[a-z]{2,8})?$/;
    if (regex.test(emails)) {
        errorMsj.innerHTML = "";
        error = false;
        return true;
    } else {
        errorMsj.innerHTML = "Correo invalido";
        errorMsj.style.color = "red";
        error = true;
        return false;
    }
})
};