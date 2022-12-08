<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
class Accept extends PublicController{
    public function run():void
    {
        $dataview = array();
        $token = $_GET["token"] ?: "";
        $session_token = $_SESSION["orderid"] ?: "";
        $dataview["orderId"] = $_SESSION["orderid"] ?: "12347879678979";
        if ($token !== "" && $token == $session_token ) {
            try {
                $result = \Utilities\Paypal\PayPalCapture::captureOrder($session_token);
                $dataview["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);
                $this->Accepted($_SESSION["orderid"]);
                // $this->migrateCardToTransaction($result);
            } catch (\Exception $e) {
                $exception = json_decode($e->getMessage(), true);
                
                \Utilities\Site::redirectToWithMsg("index.php?page=checkout_error", "Error: " . $exception["name"] . " - " . $exception["message"]);
                // $dataview["orderjson"] = $exception[""];
            }
            // $this->migrateCardToTransaction($result);
        } else {
            \Utilities\Site::redirectToWithMsg("index.php?page=checkout_error", "Error");
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
            if($item["triggerableTable"]=="subscriptions"){
                \Dao\Subscriptions\Subscriptions::updateSubscriptionStatus($item["triggerId"], 'ACT');
            }
            \Dao\Cart\Transaction::insertCartToTransaction($orderId, $item);
            \Dao\Cart\Carts::deleteCartById($item["idcart"]);
        }
        // die(var_dump($cart));
    }


}

?>
