<div>
    <div class="py-44 bg-black bg-opacity-80 transition duration-150 ease-in-out z-10 absolute top-0 right-0 bottom-0 left-0"
        id="modal1" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <div class="relative py-8 px-5 md:px-10 bg-white shadow-md rounded-3xl shadow-lg border border-gray-400">
                <form action="">
                <div>
                    <h1 class="multi-titleG2 !text-center">Únete a nosotros</h1>
                </div>
                <fieldset>
                    <div class="grid grid-cols-2 justify-between mt-5 gap-4">
                        <div class="flex">
                            <input type="radio" id="btnBgRb1" name="btnBgRbUserType" class="peer hidden" />
                            <label for="btnBgRb1" class="form-checkboxRadioBG w-full">Cliente</label>
                        </div>
                        <div class="flex">
                            <input type="radio" id="btnBgRb2" name="btnBgRbUserType" class="peer hidden" />
                            <label for="btnBgRb2" class="form-checkboxRadioBG w-full">Proveedor</label>
                        </div>
                    </div>
                    <p class="text-multiDanger" id="rbError"></p>
                </fieldset>
                <fieldset>
                    <label for="txtEmailUnite" class="form-label !font-semibold !mt-5">Correo Electrónico</label>
                    <input type="email" name="txtEmailUnite" id="txtEmailUnite" class="form-input" placeholder="ejemplo@real.com">
                    <p class="text-multiDanger" id="emailErrorUnite"></p>
                    <div class="flex justify-center mt-10">
                        <button type="button" class="form-primaryButton" onclick="clickRegister1()">Continuar</button>
                        <button type="button" class="form-secondaryButton" onclick="modalHandler1(false, 'modal1')">Cancelar</button>
                    </div>
                    <p class="form-helper !text-center">Al hacer clic en continuar usted acepta que su correo sera
                        almacenado y
                        compartido dentro
                        de nuestra empresa dentro de los <a href="#" class="form-helperLink">Términos y condiciones</a>.
                    </p>
                </fieldset>
                </form>
            </div>
        </div>
    </div>

</div>