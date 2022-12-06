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
                $newInvoice = [
                    [
                        "id" =>$this->viewData["invoices"][$invoice]["idcart"],
                        "name" =>$this->viewData["invoices"][$invoice]["type"],
                        "description" =>$this->viewData["invoices"][$invoice]["aplication"],
                        "sku" =>$this->viewData["invoices"][$invoice]["idprice"],
                        "price" =>$this->viewData["invoices"][$invoice]["crrprice"],
                        "quantity" =>$this->viewData["invoices"][$invoice]["crrcant"],
                    ]
                ];
                //\Controllers\Checkout\Checkout::checkout($newInvoice);
            }
        }else{
            Renderer::render('cart/cart', $this->viewData);
        }
    }

    public function on_loaded(){
        $this->userId = $_SESSION["login"]["userId"];
        $this->viewData["currentInvoices"] = \Dao\Cart\Carts::getQtyInvoices($this->userId);
        $invoices = \Dao\Cart\Carts::getInvoicesByUserId($this->userId);
        $invoices = array_map(function($invoice){
            if($invoice["type"] == "PRO"){
                $invoice["type"] = "Promoción";
            }
            if($invoice["type"] == "SUS"){
                $invoice["type"] = "Suscripción";
            }
            if($invoice["type"] == "REC"){
                $invoice["type"] = "Recargo";
            }
            return $invoice;
        }, $invoices);
        $this->viewData["invoices"] = $invoices;

                      
    }

    public function process_postBack(){
        
    }
}