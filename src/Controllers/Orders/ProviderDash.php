<?php 
namespace Controllers\Orders;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;

class ProviderDash extends PublicController{
    private $viewData = array(
        "clientName" => "",
        "clientDireccion" => "",
        "clientTelefono" => "",
        "clientProblema" => "",
    );

    public function run():void{

        $this->onForm_loaded();
        if($this->isPostBack()){
            $this->process_postBack();
        }
        $this->pre_render();

        \Utilities\Site::addEndScript("src/Views/templates/orders/scripts/modal.js");
        
        Renderer::render("orders/providerdash", $this->viewData);
    }

    private function onForm_loaded(){
        if(!isset($_SESSION["login"])){
            header("Location: index.php?page=login");
            die();
        }

        $order = \Dao\Orders\Orders::getOrdersByProviderId($_SESSION["login"]["userId"]);
        
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
        $idorder = $_POST["idorder"];
        $step = $_POST["step"];

        if($step == 'acept'){
            $this->aceptOrder($idorder);
        }
        if($step == 'reject'){
            $this->rejectOrder($idorder);
        }
        
    }

    private function aceptOrder($idorder){
        try {
            $order["idorder"] = \Dao\Orders\Orders::getOrderById($idorder);
            $order["status"] = "EPR";
            \Dao\Orders\Orders::updateOrder($order);
            
            echo "success";
            exit();
            //code...
        } catch (\Throwable $th) {
            echo "error";
            exit();
        }
    }

    private function rejectOrder($idorder){
        try {
            $order["idorder"] = \Dao\Orders\Orders::getOrderById($idorder);
            $order["status"] = "CAN";
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