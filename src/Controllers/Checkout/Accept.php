<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
class Accept extends PublicController{
    public function run():void
    {
        $dataview = array();
        $token = $_GET["token"] ?: "";
        $session_token = $_SESSION["orderid"] ?: "";
        if ($token !== "" && $token == $session_token) {
            $result = \Utilities\Paypal\PayPalCapture::captureOrder($session_token);
            $dataview["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);
            // $this->migrateCardToTransaction($result);
        } else {
            $dataview["orderjson"] = "No Order Available!!!";
        }
        \Views\Renderer::render("paypal/accept", $dataview);
    }

   /*  private function migrateCardToTransaction($idcart){
        try {
            $cart = \Dao\Cart\Carts::getCardById($idcart);
            \Dao\Transactions\Transactions::migrateCartToTransaction($cart);
            \Dao\Cart\Carts::deleteCartById($idcart);
            \Dao\Promotions\Promotions::checkPromotion($_SESSION["orderid"]]);
        } catch (\Throwable $th) {
            //throw $th;
        }
    } */

}

?>
