<?php 
namespace Controllers\Cart;

use Controllers\PrivateController;
use Views\Renderer;

class Cart extends PrivateController{
    private $viewData = [];
    private $userId;
    public function run() :void{
        $this->on_loaded();
        if ($this->isPostBack()) {
            $this->process_postBack();
        };
        if(isset($_GET["idCart"])){
            $invoice = array_search($_GET["idCart"], array_column($this->viewData["invoices"], "idcart"));
            if($invoice !== false){
                $exchangeRate = \Utilities\multiUtilities::exchangeRateUSDHNL();
                $price = floatval($this->viewData["invoices"][$invoice]["crrprice"]) / $exchangeRate->result;
                // die(var_dump($this->viewData["invoices"][$invoice]));
                $newInvoice = [
                    [
                        "id" =>$this->viewData["invoices"][$invoice]["idcart"],
                        "name" =>$this->viewData["invoices"][$invoice]["type"],
                        "description" =>$this->viewData["invoices"][$invoice]["aplication"],
                        "sku" =>$this->viewData["invoices"][$invoice]["idprice"],
                        "price" => number_format($price, 2),
                        "quantity" =>$this->viewData["invoices"][$invoice]["crrcant"]
                    ]
                ];
                $_SESSION["invoice"] = $newInvoice;
                $_SESSION["cart"] =
                [
                    $this->viewData["invoices"][$invoice],
                ];
                // die(var_dump($_SESSION["cart"][0]));
                // die(var_dump($_SESSION["cart"]));
                \Utilities\Site::redirectTo("index.php?page=checkout_checkout");
            }
        }else{
            Renderer::render('cart/cart', $this->viewData);
        }
    }

    public function on_loaded(){
        $this->userId = $_SESSION["login"]["userId"];
        $this->viewData["currentInvoices"] = \Dao\Cart\Carts::getQtyInvoices($this->userId);
        $invoices = \Dao\Cart\Carts::getInvoicesByUserId($this->userId);
        $invoices = \Utilities\multiUtilities::typeEnumToTitle($invoices);
        $invoices = \Utilities\multiUtilities::calculateTotalFromArray($invoices);
        $this->viewData["invoices"] = $invoices;
    }

    public function process_postBack(){
        
    }
}