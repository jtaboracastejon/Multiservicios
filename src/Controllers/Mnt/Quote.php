<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;

class Quote extends PublicController
{
    private $arrModeDsc = array(
        "INS" => "Agregar nueva cita",
        "UPD" => "Editar %s %s",
        "DEL" => "Eliminando %s %s",
        "DSP" => "Detalle de %s %s"
    );
    private $viewData = array(
        "mode" => "",
        "mode_dsc" => "",
        "quoteid" => "",
        "quote" => "",
        "author" => "",
        "status" => "",
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
        Renderer::render("mnt/quote", $this->viewData);
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
            if (!isset($_GET["quoteId"])) {
                $this->errorRedir();
            }

            $quoteId = intval($_GET["quoteId"]);
            $dbQuote = \Dao\Mnt\Quotes::getById($quoteId);
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
        $this->viewData["quote"] = $_POST["quote"];
        $this->viewData["author"] = $_POST["author"];
        $this->viewData["status"] = $_POST["status"];
        $this->viewData["act_selected"] = $_POST["status"] === "ACT";
        $this->viewData["ina_selected"] = $_POST["status"] === "INA";
        //TO-DO: Validar la entrada de datos
        return true;
    }
    private function on_insert_clicked()
    {
        $insertResult = \Dao\Mnt\Quotes::AgregarQuote(
            $this->viewData["quote"],
            $this->viewData["author"],
            $this->viewData["status"]
        );
        if($insertResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Quotes",
                "Registro guardado Exitosamente!"
            );
        }
    }

    private function on_update_clicked()
    {
        $updateResult = \Dao\Mnt\Quotes::ActualizarQuote(
            $this->viewData["quoteId"],
            $this->viewData["quote"],
            $this->viewData["author"],
            $this->viewData["status"]
        );
        if($updateResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Quotes",
                "Registro actualizado Exitosamente!"
            );
        }
    }

    private function on_delete_clicked()
    {
        $deleteResult = \Dao\Mnt\Quotes::EliminarQuote(
            $this->viewData["quoteId"]
        );
        if($deleteResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Quotes",
                "Registro eliminado Exitosamente!"
            );
        }
    }

    

    private function pre_render()
    {
        $this->viewData["act_selected"] = $this->viewData["status"] === "ACT";
        $this->viewData["ina_selected"] = $this->viewData["status"] === "INA";
        if ($this->viewData["mode"] !== "INS") {
            $this->viewData["mode_dsc"] = sprintf(
                $this->arrModeDsc[$this->viewData["mode"]],
                $this->viewData["quoteid"],
                $this->viewData["quote"]
            );
        } else {
            $this->viewData["mode_dsc"] = $this->arrModeDsc["INS"];
        }
        $this->viewData["readOnly"] = $this->viewData["mode"] == "DEL" || $this->viewData["mode"] == "DSP";
        $this->viewData["showSaveBtn"] = !($this->viewData["mode"] == "DSP");
    }

    //Utilities
    private function errorRedir()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=Mnt-Quotes",
            "Algo Inesperado sucedió!"
        );
    }
}
