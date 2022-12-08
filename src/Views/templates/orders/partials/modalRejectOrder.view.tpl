<div>
    <div class="py-44 bg-black bg-opacity-80 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0"
        id="modalRejectOrder" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded-3xl shadow-lg border border-gray-400">
                <form action="">
                <div class="flex justify-between">
                    <h1 class="text-center font-bold">Tiene una solicitud para:</h1>
                    <button type="button" class="justify-self-end" onclick="modalHandler(false, 'modalRejectOrder')"><i class="fa-regular fa-circle-xmark"></i></button>
                </div> 
                    <fieldset>
                        <textarea name="txtUserProblema" id="txtUserProblema" class="form-input" cols="30" rows="10" placeholder="" readonly></textarea>
                    </fieldset>
                    <fieldset>
                        <label for="" class="form-label !font-light !mt-5">Esta solicitud será rechazada automaticamente despues de 42 horas</label>
                    </fieldset>
                    <fieldset>
                        <div class="flex justify-center mt-10">
                            <button type="button" class="form-dangerButton" onclick="cancelarOrder('clientdash')">Cancelar Orden</button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>