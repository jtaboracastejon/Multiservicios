<?php 
namespace Controllers\Orders;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;

class ClientDash extends PublicController{
    
    private $viewData = [];

    public function run():void{

        $this->onForm_loaded();
        if($this->isPostBack()){
            $this->process_postBack();
        }
        $this->pre_render();

        \Utilities\Site::addEndScript("src/Views/templates/orders/scripts/modal.js");
        
        Renderer::render("orders/clientdash", $this->viewData);
    }

    private function onForm_loaded(){
        if(!isset($_SESSION["login"])){
            header("Location: index.php?page=login");
            die();
        }

        $order = \Dao\Orders\Orders::getOrdersByClientId($_SESSION["login"]["userId"]);   

        $newOrder = array_map(function($item){
            if($item["orderstatus"] == "PEN"){
                $item["orderstatus"] = "Pendiente";
                $item["isPendiente"] = true;
            }
            if($item["orderstatus"] == "EPR"){
                $item["orderstatus"] = "En proceso";
                $item["isEnProceso"] = true;
            }
            if($item["orderstatus"] == "FIN"){
                $item["orderstatus"] = "Finalizado";
                $item["isFinalizado"] = true;
            }
            if($item["orderstatus"] == "CAN"){
                $item["orderstatus"] = "Cancelado";
                $item["isFinalizado"] = true;
            }
            if($item["orderstatus"] == "REC"){
                $item["orderstatus"] = "Rechazado";
                $item["isFinalizado"] = true;
            }
            return $item;
        }, $order);

        $this->viewData["orders"] = $newOrder;

        if(isset($_GET["idorder"])){
            $this->viewData["order"] = \Dao\Orders\Orders::getOrderById($_GET["idorder"]);
            $this->viewData["listorder"] = false;

            $this->viewData["client"] = \Dao\Security\Security::getUsuarioByUserCod($this->viewData["order"]["iduser_cli"]);
            $this->viewData["clientName"] = $this->viewData["client"]["firstname"] . " " . $this->viewData["client"]["lastname"];
            $this->viewData["clientDireccion"] = $this->viewData["client"]["address"];
            $this->viewData["clientTelefono"] = $this->viewData["client"]["phonenumber"];
            $this->viewData["orderDetail"] = $this->viewData["order"]["descriptionwork"];
                      

        }
        else{
            $this->viewData["listorder"] = true;
        }
    }

    private function pre_render(){

    }

    private function process_postBack(){

    }

}

?>