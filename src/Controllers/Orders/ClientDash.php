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
            if($item["orderstatus"] == "ACE"){
                $item["orderstatus"] = "Aceptada";
                $item["isEnProceso"] = true;
            }
            if($item["orderstatus"] == "FIP"){
                $item["orderstatus"] = "Finalizado";
                $item["isFinalizado"] = true;
            }
            if($item["orderstatus"] == "FIC"){
                $item["orderstatus"] = "Esperando Proveedor";
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

            $this->viewData["provider"] = \Dao\Security\Security::getUsuarioByUserCod($this->viewData["order"]["iduser_prov"]);
            $this->viewData["providerName"] = $this->viewData["provider"]["firstname"] . " " . $this->viewData["provider"]["lastname"];
            $this->viewData["providerDireccion"] = $this->viewData["provider"]["address"];
            $this->viewData["providerTelefono"] = $this->viewData["provider"]["phonenumber"];
            $this->viewData["providerDescription"] = $this->viewData["order"]["description"];
                      

        }
        else{
            $this->viewData["listorder"] = true;
        }
    }

    private function pre_render(){
        
    }

    private function process_postBack(){
        $step = $_POST["step"];

        if($step == 'acept'){
            $idorder = $_POST["idorder"];
            $this->updateOrder($idorder, "ACE");
        }
        if($step == 'reject'){
            $idorder = $_POST["idorder"];
            $this->updateOrder($idorder, "REC");
        }
        if($step == 'finish'){
            $idorder = $_GET["idorder"];
            $this->updateOrder($idorder, "FIC");
        }
        if($step == 'cancel'){
            $idorder = $_GET["idorder"];
            $this->updateOrder($idorder, "CAN");
        }
    }

    private function updateOrder($idorder, $status){
        try {
            $order["idorder"] = \Dao\Orders\Orders::getOrderById($idorder);
            $order["status"] = $status;
            \Dao\Orders\Orders::updateOrder($order);
            
            echo "success";
            exit();
            //code...
        } catch (\Throwable $th) {
            echo "error";
            exit();
        }
    }

}

?>