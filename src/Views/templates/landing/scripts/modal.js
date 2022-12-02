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


//Unete Modal

let txtEmailUnete = document.getElementById("txtEmailUnite");
let rbCliente = document.getElementById("btnBgRb1");
let rbProveedor = document.getElementById("btnBgRb2");
let Cbusuarios;

verificarEmail(txtEmailUnete, emailErrorUnite);

function validationFormUnete() {
    if (txtEmailUnete.value == "") {
        emailErrorUnete.innerHTML = "El campo no puede estar vacio";
        return true;
    }
    if (rbCliente.checked == false && rbProveedor.checked == false) {
        rbError.innerHTML = "Debe seleccionar una opcion";
        return true;
    }
    if(rbProveedor.checked == true){
        Cbusuarios = "PRV";
    }else{
        Cbusuarios = "CLI";
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
                txtEmail: txtEmailUnite.value,
                btnRegister: true,
                Cbusuarios : Cbusuarios,
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

function verificarEmail(email, errorMsj){
    email.addEventListener("blur", function () {
    let email = email.value; 
    let regex = /^([a-zA-Z0-9\.-]+)@([a-zA-Z0-9-]+).([a-z]{2,8})(.[a-z]{2,8})?$/;
    if (regex.test(email)) {
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