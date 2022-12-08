<div>
    <div class="multi-bgModal"
        id="waiting4PaypalModal" style="opacity: -0.1; display: none;">
        <div role="alert" class="container mx-auto w-11/12 md:w-2/3 max-w-lg">
            <div class="relative py-8 px-5 md:px-10 rounded-3xl shadow-lg border border-gray-400" style="background-color: #fcfcff;">
                <div class="flex justify-between">
                    <h1 class="text-center font-bold">Estamos preparando todo para su pago</h1>
                    <button type="button" class="justify-self-end" onclick="modalHandler(false, 'waiting4PaypalModal')"><i class="fa-regular fa-circle-xmark"></i></button>
                </div> 
                <p>En caso de cancelar podrá recuperar su pago en facturas pendientes</p>
                <img src="../{{BASE_DIR}}/public/imgs/gif/waitingPaypal.gif" alt="gif de pago" class="object-cover h-96">
                <p class="form-helper">Esta siendo redireccionado a Paypal</p>
            </div>
        </div>
    </div>
</div>