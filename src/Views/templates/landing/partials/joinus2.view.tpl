<div>
    <div class="py-44 bg-black bg-opacity-80 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0"
        id="modal2" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded-3xl shadow-lg border border-gray-400">
                <form action="">
                <div class="grid grid-cols-3 items-center">
                    <p class="form-helper !m-0">
                        Datos Personales.
                    </p>
                    <a href="#" class="form-helperLink !border-l-2 !px-2 !mr-4 !border-multiDarkBlue !ml-4" id="userType"></a>                        
                    <button type="button" class="justify-self-end" onclick="modalHandler1(false, 'modal2')"><i class="fa-regular fa-circle-xmark"></i></button>
                </div>
                <fieldset>
                    <label for="txtUserName" class="form-label !font-medium !mt-5">Nombre del Usuario</label>
                    <input type="text" name="txtUserName" id="txtUserName" class="form-input" placeholder="Jonh123">
                    <p class="text-multiDanger" id="userNameError"></p>
                </fieldset>
                <fieldset>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="grid grid-rows-1">
                            <label for="txtUserPass" class="form-label !font-medium !mt-5">Contraseña</label>
                            <input type="password" name="txtUserPass" id="txtUserPass" class="form-input "
                                placeholder="********">
                        </div>
                        <div>
                            <label for="txtConfirmPass" class="form-label !font-medium !mt-5">Confirmar Contraseña</label>
                            <input type="password" name="txtConfirmPass" id="txtConfirmPass" class="form-input"
                                placeholder="********">
                            
                        </div>
                    </div>
                            <p class="text-multiDanger" id="userPassError"></p>
                    <div>
                        <p class="form-helper">
                            Utiliza ocho caracteres como mínimo con una combinación de letras, números y símbolos.
                        </p>
                    </div>
                    <div class="grid grid-cols-3 gap-4">
                        <div class="grid grid-rows-1">
                            <label for="cmbDepto" class="form-label !font-medium !mt-5">Departamento</label>
                            <select name="cmbDepto" id="cmbDepto" class="form-select">
                                <option value="1">Atlántida</option>
                                <option value="2">Colón</option>
                                <option value="3">Comayagua</option>
                            </select>
                        </div>
                        <div class="grid col-span-2">
                            <label for="cmbMuni" class="form-label !font-medium !mt-5">Municipio</label>
                            <select name="cmbMuni" id="cmbMuni" class="form-select">
                                <option value="1">La Ceiba</option>
                                <option value="2">Tela</option>
                                <option value="3">Jutiapa</option>
                            </select>
                        </div>
                    </div>
                    <button type="button" class="form-primaryButton !ml-36 !mt-3" onclick="return clickRegister2()">Continuar</button>
                </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>