<?php
namespace Controllers\Mnt;
use Controllers\PublicController;
use DateTime;
use Views\Renderer;
class Provider extends PublicController{

    private $arrModeDsc = array(
        'INS' => 'Nuevo Proveedor',
        'UPD' => 'Actualizando Proveedor',
        'DSP' => 'Detalle de Proveedor',
        'DEL' => 'Eliminando Proveedor'
    );

    private $viewData= array(
        'modeDsc' => '',
        'mode' => '',
        'idprovider' => -1,
        'iduserdetail' => '',
        'idservice' => '',
        'description'=> '',
        'status' => 'ACT',
        'datacreate'=> '',
        'act_selected' => true,
        'ina_selected' => false,
        'readOnly' => false,
        'showSaveBtn'=>true
    );
    
public function run(): void
{   
    $this->onForm_loaded();
    if($this->isPostBack()){ // isset($_POST["btnGuardar"])
        $this->process_postback();
    }
    $this->pre_render();
    Renderer::render("mnt/provider", $this->viewData);
}
    private function onForm_loaded()
    {
        if(!isset($_GET["mode"])){
            $this->errorHandler();
        }
        $this->viewData["mode"] = $_GET["mode"];
        if(!isset($this->arrModeDsc[$this->viewData["mode"]])){
            $this->errorHandler();
        }
        if($this->viewData["mode"]!=="INS"){
            if(!isset($_GET["idprovider"])){
                $this->errorHandler();
            }
            $idprovider = intval($_GET["idprovider"]);
            $dbProvider = \Dao\Mnt\Providers::getById($idprovider);
            \Utilities\ArrUtils::mergeFullArrayTo($dbProvider, $this->viewData);
        }
    }

    private function process_postback()
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
        //validando entrada de datos
        $this->viewData["iduserdetail"] = $_POST["iduserdetail"];
        $this->viewData["idservice"] = $_POST["idservice"];
        $this->viewData["decription"] = $_POST["decription"];
        $this->viewData["status"] = $_POST["status"];
       //$this->viewData["datecreate"] = $_POST["datecreate"];

        return true;
    }
    private function on_update_clicked()
    {
        $updateResult=\Dao\Mnt\Providers::updateProvider(
            $this->viewData["iduserdetail"],
            $this->viewData["idservice"],
            $this->viewData["decription"] ,
            $this->viewData["status"],
            $this->viewData["datecreate"],
            $this->viewData["idprovider"]
        );
        if($updateResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Providers",
                "Proveedor actualizado correctamente"
            );
        }
    }
    private function on_delete_clicked()
    {
        $deleteResult=\Dao\Mnt\Providers::deleteProvider(
            $this->viewData["idprovider"]
        );
        if($deleteResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Providers",
                "Proveedor eliminado correctamente"
            );
        }

    }
    private function on_insert_clicked()
    {
        $insertResult=\Dao\Mnt\Providers::addProvider(
            $this->viewData["iduserdetail"],
            $this->viewData["idservice"],
            $this->viewData["decription"],
            $this->viewData["status"], 
            //$this->viewData["datecreate"],
            $this->viewData["idprovider"]
        );
        if($insertResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Providers",
                "Proveedor agregado correctamente"
            );
        }

    }


    private function pre_render()
    {
        $getallU = \Dao\Mnt\Providers::getAllUserdetail();
        $this->viewData["getallU"] = $getallU;
        $this->viewData["getallU"] = \Utilities\ArrUtils::objectArrToAllUser(
            $this->viewData["getallU"],
            'iduserdetail',
            'firstname',
            'iduserdetail',
            $this->viewData["iduserdetail"]
        );

        $getallS = \Dao\Mnt\Providers::getAllServices();
        $this->viewData["getallS"] = $getallS;
        $this->viewData["getallS"] = \Utilities\ArrUtils::objectArrToAllServices(
            $this->viewData["getallS"],
            'idservice',
            'servicename',
            'idservice',
            $this->viewData["idservice"]
        );

        $this->viewData["act_selected"] = $this->viewData["status"]=== "ACT";
        $this->viewData["ina_selected"] = $this->viewData["status"]=== "INA";
        if($this->viewData["mode"]!=='INS'){
            $this->viewData["mode_dsc"]=sprintf(
                $this->arrModeDsc[$this->viewData["mode"]],
                $this->viewData["idprovider"],
                $this->viewData["iduserdetail"]
            );
        }else{
            $this->viewData["mode_dsc"]=$this->arrModeDsc["INS"];
        }
        $this->viewData["readonly"]=($this->viewData["mode"]== "DEL" || $this->viewData["mode"]=="DSP");
        $this->viewData["showSaveBtn"] = ($this->viewData["mode"]!= "DSP");
    }

    ///UTILITIES
    private function errorHandler(){
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=Mnt-Providers",
            "Modo de operación no reconocido"
        );
    }
}

?>