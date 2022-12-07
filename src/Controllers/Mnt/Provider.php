<?php 
namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;

class Provider extends PublicController{
    private $arrModeDsc = array(
        "INS" => "Agregar nuevo producto",
        "UPD" => "Editar %s %s",
        "DEL" => "Eliminando %s %s",
        "DSP" => "Detalle de %s %s"
    );
    private $viewData = array(
        "mode" => "",
        "mode_dsc" => "",
        "iduserdetail" => "",
        "idservice" => "",
        "decription" => "",
        "status" => "",
        "act_selected" => true,
        "ina_selected" => false,
        "readOnly" => false,
        "showSaveBtn" => true
        
    );

	public function run() :void{
        $this->onForm_loaded();
        if($this->isPostBack()){
            $this->process_postBack();
        }
        $this->pre_render();
        Renderer::render("mnt/provider", $this->viewData);
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
            if (!isset($_GET["idprovider"])) {
                $this->errorRedir();
            }

            $providerId = intval($_GET["idprovider"]);
            $dbPro = \Dao\Providers\Providers::getProviderById($providerId);
            \Utilities\ArrUtils::mergeFullArrayTo($dbPro, $this->viewData);
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
        $this->viewData["iduserdetail"] = $_POST["iduserdetail"];
        $this->viewData["idservice"] = $_POST["idservice"];
        $this->viewData["decription"] = $_POST["decription"];
        $this->viewData["status"] = $_POST["status"];
        $this->viewData["act_selected"] = $_POST["status"] == "ACT";
        $this->viewData["ina_selected"] = $_POST["status"] == "INA";
        return true;
    }

    private function on_insert_clicked()
    {
        $insertResult = \Dao\Providers\Providers::addProvider(
            $this->viewData["iduserdetail"],
            $this->viewData["idservice"],
            $this->viewData["decription"],
            $this->viewData["status"]
        );
        if($insertResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=mnt-providers",
                "Registro guardado Exitosamente!"
            );
        }
    }

    private function on_update_clicked()
    {
        $updateResult = \Dao\Providers\Providers::updateProvider(
            $this->viewData["idprovider"],
            $this->viewData["iduserdetail"],
            $this->viewData["idservice"],
            $this->viewData["decription"],
            $this->viewData["status"]
        );
        if($updateResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Providers",
                "Registro actualizado Exitosamente!"
            );
        }
    }

    private function on_delete_clicked()
    {
        $deleteResult = \Dao\Providers\Providers::deleteProvider(
            $this->viewData["idprovider"]
        );
        if($deleteResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Providers",
                "Registro eliminado Exitosamente!"
            );
        }
    }

    private function pre_render()
    {

        $getALL = \Dao\Providers\Providers::getAllServices();
        $this->viewData["getALL"] = $getALL;

        
       // \Dao\Landing\Landing::split_name($card["firstname"], $card["lastname"]);

        $getAllUser = \Dao\Providers\Providers::getAllUserDetails();
        $this->viewData["getAllUser"] = $getAllUser;


        $this->viewData["act_selected"] = $this->viewData["status"] === "ACT";
        $this->viewData["ina_selected"] = $this->viewData["status"] === "INA";
        if ($this->viewData["mode"] !== "INS") {
            $this->viewData["mode_dsc"] = sprintf(
                $this->arrModeDsc[$this->viewData["mode"]],
                $this->viewData["idprovider"],
                $this->viewData["decription"]
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
            "index.php?page=mnt-providers",
            "Algo Inesperado sucedió!"
        );
    }
}
?>