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
            $this->Accepted($_SESSION["orderid"]);
            // $this->migrateCardToTransaction($result);
        } else {
            $dataview["orderjson"] = "No Order Available!!!";
        }
        \Views\Renderer::render("paypal/accept", $dataview);
    }

    private function Accepted($orderId){
        $cart = $_SESSION["cart"];
        // die(var_dump($cart));
        foreach ($cart as $item) {
            if($item["triggerableTable"]=="promotions"){
                \Dao\Promotions\Promotions::updatePromotionStatus($item["triggerId"], 'ACT');
            }
            /* if($item["triggerableTable"]=="subscriptions"){
                \Dao\Subscriptions\Subscriptions::updateSubscriptionStatus($item["triggerableId"], 'ACT');
            } */
            \Dao\Cart\Transaction::insertCartToTransaction($orderId, $item);
            \Dao\Cart\Carts::deleteCartById($item["idcart"]);
        }
        // die(var_dump($cart));
    }


}

?>
