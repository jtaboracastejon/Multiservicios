<div>
    <div class="py-44 bg-black bg-opacity-80 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0"
        id="modalLogin" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <!-- contenedor, parte white -->
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded-3xl shadow-lg border border-gray-400">
                <!-- Aquí podes meter código -->
                <div>
                    <h1 class="multi-titleG2 !text-center">Iniciar Sesión</h1>
                </div>
                <form action="">
                    <fieldset>
                        <label for="txtEmail" class="form-label !font-semibold !mt-5">Correo Electronico/Usuario</label>
                        <input type="text" name="txtEmail" id="txtEmail" class="form-input" placeholder="ejemplo@gmail.com" required>
                        <p id="emailError"></p>
                        <label for="txtPswd" class="form-label !font-semibold !mt-5">Contraseña</label>
                        <input type="password" name="txtPswd" id="txtPswd" class="form-input" placeholder="" required>
                        <p id="pswdError"></p>
                        <a href="#" class="form-helperLink !text-right">¿Olvido su contraseña?</a>
                        <button type="button" name="btnLogin" id="btnLogin" class="form-primaryButton !align-middle !ml-28 !mt-3" onclick="return clickLogin()">Continuar</button>
                        <button type="button" class="form-secondaryButton" onclick="modalHandlerLogin()">Cancelar</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>

    <script>
        let modalLogin = document.getElementById("modalLogin");

        let txtEmail = document.getElementById("txtEmail");
        let emailError = document.getElementById("emailError");
        let txtPswd = document.getElementById("txtPswd");
        let pswdError = document.getElementById("pswdError");
        let error = false;

        function modalHandlerLogin(val = false) {
            if (val) {
                fadeIn(modalLogin);
            } else {
                fadeOut(modalLogin);
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
            txtEmail.value = "";
            emailError.innerText = "";
            txtPswd.value = "";
            pswdError.innerText = "";
            (function fade() {
                let val = parseFloat(el.style.opacity);
                if (!((val += 0.2) > 1)) {
                    el.style.opacity = val;
                    requestAnimationFrame(fade); 
                }
            })();
        }

        
        
        
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

        

        
    </script>

</div>