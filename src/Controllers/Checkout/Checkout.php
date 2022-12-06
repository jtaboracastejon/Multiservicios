<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Checkout extends PublicController{
    public function run():void
    {
        $viewData = array();
        if ($this->isPostBack()) {
            if(isset($_SESSION["cart"])){
                $arrCart = $_SESSION["cart"];
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

        \Views\Renderer::render("paypal/checkout", $viewData);
    }
}
?>
