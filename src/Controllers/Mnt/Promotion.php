<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;

class Promotion extends PublicController
{
    private $arrModeDsc = array(
        "INS" => "Agregar nueva promocion",
        "UPD" => "Editar %s %s",
        "DEL" => "Eliminando %s %s",
        "DSP" => "Detalle de %s %s"
    );
    private $viewData = array(
        "mode" => "",
        "mode_dsc" => "",
        "promotionId" => "",
        "act_selected" => true,
        "ina_selected" => false,
        "readOnly" => false,
        "showSaveBtn" => true
    );
    public function run(): void
    {
        $this->onForm_loaded();
        if ($this->isPostBack()) {
            $this->process_postBack();
        }
        $this->pre_render();
        Renderer::render("mnt/promotion", $this->viewData);
    }

    private function onForm_loaded()
    {
        if (!isset($_GET["mode"])) {
            $this->errorRedir();
        }
        $this->viewData["mode"] = $_GET["mode"];
        if (!isset($this->arrModeDsc[$this->viewData["mode"]])) {
            $this->errorRedir();
        }

        if ($this->viewData["mode"] !== "INS") {
            if (!isset($_GET["promotionId"])) {
                $this->errorRedir();
            }

            $this->viewData["promotionId"] = intval($_GET["promotionId"]);
            $dbQuote = \Dao\Mnt\Promotions::getPromotionById($this->viewData["promotionId"]);
            \Utilities\ArrUtils::mergeFullArrayTo($dbQuote, $this->viewData);
        }
    }

    private function process_postBack()
    {
        if($this->validate_inputs()){
            switch($this->viewData["mode"]){
                case "INS":
                    $this->on_insert_clicked();
                    break;
                case "UPD":
                    $this->on_update_clicked();
                    break;
                case "DEL":
                    $this->on_delete_clicked();
                    break;
            }
        }
    }

    private function validate_inputs()
    {
        $this->viewData["providercod"] = $_POST["providercod"]; 
        //TO-DO: Validar la entrada de datos
        return true;
    }
    private function on_insert_clicked()
    {
        
        $insertResult = \Dao\Mnt\Promotions::insertPromotion(
            $this->viewData["providercod"],
            30

        );
        if($insertResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Promotions",
                "Registro guardado Exitosamente!"
            );
        }
    }

    private function on_update_clicked()
    {
        $updateResult = \Dao\Mnt\Promotions::updatePromotion(
            $this->viewData["promotionId"],
            $this->viewData["usercod"],
            30
        );
        if($updateResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Promotions",
                "Registro actualizado Exitosamente!"
            );
        }
    }

    private function on_delete_clicked()
    {
        $deleteResult = \Dao\Mnt\Promotions::deletePromotion(
            $this->viewData["promotionId"],
        );
        if($deleteResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Promotions",
                "Registro eliminado Exitosamente!"
            );
        }
    }

    

    private function pre_render()
    {   $this->viewData["users"] = \Dao\Security\Security::getAllUsers();
        if ($this->viewData["mode"] !== "INS") {
            $this->viewData["mode_dsc"] = sprintf(
                $this->arrModeDsc[$this->viewData["mode"]],
                $this->viewData["idpromotion"],
                $this->viewData["fullname"]
            );
        } else {
            $this->viewData["mode_dsc"] = $this->arrModeDsc["INS"];
        }
        $this->viewData["showSaveBtn"] = !($this->viewData["mode"] == "DSP");
    }

    //Utilities
    private function errorRedir()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=Mnt-Promotions",
            "Algo Inesperado sucedió!"
        );
    }
}
