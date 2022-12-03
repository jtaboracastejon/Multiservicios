<div>
    <div class="py-44 bg-black bg-opacity-80 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0"
        id="modal3" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded-3xl shadow-lg border border-gray-400">
                
                <div class="flex justify-between">
                    <h1 class="multi-titleG2 !text-xl !text-center">¡Estas un paso mas cerca!</h1>
                    <button type="button" onclick="modalHandler1(false, 'modal3')"><i class="fa-regular fa-circle-xmark"></i></button>
                </div>
                
                <fieldset>
                    <p class="text-justify">
                        jdoe, antes de que puedas empezar con nosotros, necesitamos verificar tu correo electronico por
                        motivos de seguridad.
                    </p>
                    <p class="text-justify" id="verificationText">
                        Se ha enviado un correo con un código de verificación su correo electronico.
                    </p>
                </fieldset>
                <form action="">
                <div class="grid grid-cols-1 justify-items-center">
                    <input type="text" name="txtCode" id="txtCode" class="form-input !w-6/12"
                        placeholder="Código de Seguridad">
                    <p class="text-multiDanger" id="codeError"></p>
                    <button type="button" class="form-primaryButton !align-middle !mt-3 !w-6/12" onclick="return clickRegister3()">Continuar</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>