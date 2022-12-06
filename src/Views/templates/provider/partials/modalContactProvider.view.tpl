<div>
    <div class="py-44 bg-black bg-opacity-80 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0"
        id="modalContactProvider" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded-3xl shadow-lg border border-gray-400">
                <form action="">
                    <fieldset>
                        <label for="txtNombrePromo" class="form-label !font-semibold !mt-5">Descríbenos tu problema</label>
                        <textarea name="txtUserProblema" id="txtUserProblema" class="form-input" cols="30" rows="10" placeholder="Necesito reparar las puertas de mi casa"></textarea>
                        <p class="text-multiDanger" id="nombrePromoError"></p>
                    </fieldset>
                    <fieldset>
                        <div class="flex justify-center mt-10">
                            <button type="button" class="form-primaryButton" onclick="savePromo()">Continuar</button>
                            <button type="button" class="form-secondaryButton" onclick="modalHandler(false, 'modalContactProvider')">Cancelar</button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>