<div>
    <div class="multi-bgModal"
        id="paymentNotyModal" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <div class="relative py-8 px-5 rounded-3xl shadow-lg border border-gray-400" style="background-color: #fcfcff;">
                <h1 class="text-center font-bold">Antes procesar su pago</h1>
                <img src="../{{BASE_DIR}}/public/imgs/gif/paymentinfo.gif" alt="gif de pago" class="object-cover h-96">
                <p>Le informamos que el total de su cuenta sera convertido a dólares para poder ser procesado con Paypal</p>
                <div class="rounded-t-xl text-center mt-4 gap-4 grid grid-cols-3 items-center">
                    {{with plan}}
                    <span class="text-center border-r-2">
                        <p class="text-sm">Total a pagar:</p>
                        <p class="text-lg">L. {{price}}</p>
                    </span>
                    {{endwith plan}}
                    <span class="text-center border-r-2">
                        <p class="text-sm">Tasa de Conversión:</p>
                        <p class="text-lg">$1 = L. {{usdHnlExchangeRate}}</p>
                    </span>
                    <span class="text-center">
                        <p class="text-sm">Precio sin ISV:</p>
                        <p class="text-lg">$ {{priceInDollars}}</p>
                    </span>
                </div>
                <p class="form-helper">La tasa de conversión es proveída por <a href="https://exchangerate.host/" class="form-helperLink" target="_blank">exchangerate.host</a></p>
                <fieldset>
                    <div class="flex justify-center mt-10">
                        <button type="button" class="form-primaryButton" onclick="processPayment()">Continuar</button>
                        <button type="button" class="form-secondaryButton" onclick="modalHandler(false, 'paymentNotyModal')">Cancelar</button>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</div>