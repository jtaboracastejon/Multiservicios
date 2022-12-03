<?php 
namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;

class Workzone extends PublicController{
    private $arrModeDsc = array(
        "INS" => "Agregar nueva zona laboral",
        "UPD" => "Editar %s %s %s",
        "DEL" => "Eliminando %s %s %s",
        "DSP" => "Detalle de %s %s %s"
    );
    private $viewData = array(
        "mode" => "",
        "mode_dsc" => "",
        "iddepto" => "",
        "idmunicipality" => "",
        "status" => "",
        "dis_selected" => true,
        "nodis_selected" => false,
        "readOnly" => false,
        "showSaveBtn" => true
    );

	public function run() :void{
        $this->onForm_loaded();
        if($this->isPostBack()){
            $this->process_postBack();
        }
        $this->pre_render();
        Renderer::render("mnt/workzone", $this->viewData);
	}

    public function onForm_loaded(){
        if (!isset($_GET["mode"])) {
            $this->errorRedir();
        }
        $this->viewData["mode"] = $_GET["mode"];
        if (!isset($this->arrModeDsc[$this->viewData["mode"]])) {
            $this->errorRedir();
        }

        if ($this->viewData["mode"] !== "INS") {
            if (!isset($_GET["idworkzone"])) {
                $this->errorRedir();
            }

            $idworkzone = intval($_GET["idworkzone"]);
            $dbWz = \Dao\WorkZones\Workzone::getWorkZonesById($idworkzone);
            \Utilities\ArrUtils::mergeFullArrayTo($dbWz, $this->viewData);
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
        $this->viewData["iddepto"] = $_POST["iddepto"];
        $this->viewData["idmunicipality"] = $_POST["idmunicipality"];
        $this->viewData["status"] = $_POST["status"];
        $this->viewData["dis_selected"] = $_POST["status"] == "DIS";
        $this->viewData["nodis_selected"] = $_POST["status"] == "NODIS";
        return true;
    }

    private function on_insert_clicked()
    {
        $insertResult = \Dao\WorkZones\Workzone::addWorkZone(
            $this->viewData["iddepto"],
            $this->viewData["idmunicipality"],
            $this->viewData["status"]
        );
        if($insertResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=mnt-workzones",
                "Registro guardado Exitosamente!"
            );
        }
    }

    private function on_update_clicked()
    {
        $updateResult = \Dao\WorkZones\Workzone::updateWorkzone(
            $this->viewData["idworkzone"],
            $this->viewData["iddepto"],
            $this->viewData["idmunicipality"],
            $this->viewData["status"]      
        );
        if($updateResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Workzones",
                "Registro actualizado Exitosamente!"
            );
        }
    }

    private function on_delete_clicked()
    {
        $deleteResult = \Dao\WorkZones\Workzone::deleteWorkZone(
            $this->viewData["idworkzone"]
        );
        if($deleteResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Workzones",
                "Registro eliminado Exitosamente!"
            );
        }
    }

    private function pre_render()
    {
        $getAllD = \Dao\WorkZones\Workzone::getAllDeptos();
        $this->viewData["getAllD"] = $getAllD;

        $getAllM = \Dao\WorkZones\Workzone::getAllMunicipies();
        $this->viewData["getAllM"] = $getAllM;

        $this->viewData["DIS_selected"] = $this->viewData["status"] === "DIS";
        $this->viewData["NODIS_selected"] = $this->viewData["status"] === "NODIS";
        if ($this->viewData["mode"] !== "INS") {
            $this->viewData["mode_dsc"] = sprintf(
                $this->arrModeDsc[$this->viewData["mode"]],
                $this->viewData["idworkzone"],
                $this->viewData["iddepto"],
                $this->viewData["idmunicipality"],

            );
        } else {
            $this->viewData["mode_dsc"] = $this->arrModeDsc["INS"];
        }
        $this->viewData["readOnly"] = $this->viewData["mode"] == "DEL" || $this->viewData["mode"] == "DSP";
        $this->viewData["showSaveBtn"] = !($this->viewData["mode"] == "DSP");
    }

    private function errorRedir()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt-workzones",
            "Algo Inesperado sucedió!"
        );
    }
}
?>