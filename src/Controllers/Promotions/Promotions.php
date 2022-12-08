<?php 
namespace Controllers\Promotions;

use Controllers\PrivateController;
use Views\Renderer;

class Promotions extends PrivateController{
    private $viewData = [];
    private $userId;

    public function run() :void{

        $this->on_loaded();
        if ($this->isPostBack()) {
            $this->process_postBack();
        };
        $this->pre_render();
        

        \Utilities\Site::addEndScript("src/Views/templates/promotions/scripts/createPromo.js");
        \Utilities\Site::addEndScript("src/Views/templates/common/scripts/modal.js");
        Renderer::render('promotions/promotions', $this->viewData);
    }

    public function on_loaded(){
        $this->userId = $_SESSION["login"]["userId"];
        $this->viewData["PromotionPerDay"] = \Dao\Promotions\Promotions::getLastPromotionPrice();
        $this->viewData["pricePromotionPerDay"] = number_format($this->viewData["PromotionPerDay"]["price"],2);
        $this->viewData["provider"] = \Dao\Security\Security::getProviderByUserID($this->userId);

        $this->viewData["promotions"] = \Dao\Promotions\Promotions::getAllPromotions($this->viewData["provider"]["idprovider"]);
    }

    public function pre_render(){
    }

    public function process_postBack(){ 
        $this->viewData["promotionname"] = $_POST["promotionname"];
        $this->viewData["startdate"] = $_POST["startdate"];
        $this->viewData["enddate"] = $_POST["enddate"];
        $this->viewData["costototal"] = $_POST["costototal"];
        $this->viewData["days"] = $_POST["days"];
        $this->viewData["price"] = $_POST["price"];

        try {
            \Dao\Promotions\Promotions::insertPromotionQuery(
                $this->viewData["provider"]["idprovider"],
                $this->viewData["promotionname"],
                $this->viewData["startdate"],
                $this->viewData["enddate"],
                $this->viewData["costototal"],
            );

            $nextPromoId = \Dao\Promotions\Promotions::getPromotionLastId();
            \Dao\Cart\Carts::addCart(
                $this->userId,
                $this->viewData["PromotionPerDay"]["idprice"],
                $this->viewData["days"], 
                $this->viewData["price"], 
                date("Y-m-d H:i:s"),
                date("Y-m-d H:i:s"),
                $nextPromoId,
                "promotions"
            );
            $nextCartId = \Dao\Cart\Carts::getCartLastId();
            // \Utilities\Site::redirectTo("index.php?page=cart-cart&idCart=$nextCartId");
            echo "index.php?page=cart-cart&idCart=$nextCartId";
            
            exit();                

        } catch (\Throwable $th) {
            echo "error";
            exit();
        }
    }


} ?>