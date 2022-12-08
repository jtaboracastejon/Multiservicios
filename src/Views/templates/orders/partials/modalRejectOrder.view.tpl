<div>
    <div class="py-44 bg-black bg-opacity-80 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0"
        id="modalRejectOrder" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded-3xl shadow-lg border border-gray-400">
                <form action="">
                    <p class="pl-10 pt-10 text-black-400 text-xl font-bold lg:text-2xl mb-2">Datos de contacto</p>
                    <fieldset>
                        <label for="txtNombrePromo" class="form-label !font-semibold !mt-5">Nombre del cliente</label>
                        <input name="" id="txtNombreCliente" class="form-input" cols="30" rows="10" placeholder="" value="Hola" readonly></input>
                        <label for="txtNombrePromo" class="form-label !font-semibold !mt-5">Telefono del cliente</label>
                        <input name="" id="txtTelefonoCliente" class="form-input" cols="30" rows="10" placeholder="" value="Hola" readonly></input>

                    </fieldset>
                    <fieldset>
                        <label for="txtNombrePromo" class="form-label !font-semibold !mt-5">Solicitud del cliente:</label>
                        <textarea name="" id="" class="form-input" cols="30" rows="10" placeholder="" readonly></textarea>
                    </fieldset>
                    <fieldset>
                        <label for="txtDescription" class="form-label !font-light !mt-5">Al enviar esta orden aceptas que el proveedor pueda ver tus datos de contacto</label>
                    </fieldset>
                    <fieldset>
                        <div class="flex justify-center mt-10">
                            <button type="button" class="form-successButton" onclick="rejectOrder()">Finalizar</button>
                            <button type="button" class="form-dangerButton" onclick="modalHandler(false, 'modalRejectOrder')">Anular</button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>