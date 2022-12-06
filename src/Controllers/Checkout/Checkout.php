<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Checkout extends PublicController{
    public function run():void
    {
        $viewData = array();
        if ($this->isPostBack()) {
            // $this->checkout();
            /* $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test".(time() - 10000000),
                "http://192.168.194.141/Multiservicios/index.php?page=checkout_error",
                "http://192.168.194.141/Multiservicios/index.php?page=checkout_accept"
            );
            $PayPalOrder->addItem("Test", "TestItem1", "PRD1", 100, 15, 1, "DIGITAL_GOODS");
            $PayPalOrder->addItem("Test 2", "TestItem2", "PRD2", 50, 7.5, 2, "DIGITAL_GOODS");
            $response = $PayPalOrder->createOrder();
            $_SESSION["orderid"] = $response[1]->result->id;
            \Utilities\Site::redirectTo($response[0]->href);
            die(); */
        }

        \Views\Renderer::render("paypal/checkout", $viewData);
    }

    /**
     * Crea un nuevo pedido, agrega los artículos al pedido y luego redirige al usuario a la página de
     * pago de PayPal.
     * 
     * @param array arrCart uno o varios articulos que se pagaran
     * @param array estructura [id, name, description, price, quantity, sku, category]
     */
    public static function checkout($arrCart)
    {
        $viewData = array();
        $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
            "test".(time() - 10000000),
            "http://192.168.194.141/Multiservicios/index.php?page=checkout_error",
            "http://192.168.194.141/Multiservicios/index.php?page=checkout_accept"
        );
        array_map(
            function ($item) use ($PayPalOrder) {
                $tax = floatval($item["price"] * 0.15);
                $PayPalOrder->addItem($item["name"], $item["description"], $item["sku"], $item["price"], $tax, $item["quantity"], "DIGITAL_GOODS");
            },
            $arrCart
        );
        $response = $PayPalOrder->createOrder();
        $_SESSION["orderid"] = $response[1]->result->id;
        \Utilities\Site::redirectTo($response[0]->href);
        die();
    }
}
?>
