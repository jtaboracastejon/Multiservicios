<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
class Error extends PublicController
{
    public function run(): void
    {

        \Views\Renderer::render("paypal/error", []);
    }
}

?>
