<?php
namespace Controllers\Mnt;
use Controllers\PublicController;
use DateTime;
use Views\Renderer;
class FunctionRol extends PublicController{

    private $arrModeDsc = array(
        'INS' => 'Nuevo Funcion Rol',
        'UPD' => 'Actualizando Funcion Rol',
        'DSP' => 'Detalle de Funcion Rol',
        'DEL' => 'Eliminando Funcion Rool'
    );

    private $viewData= array(
        'modeDsc' => '',
        'mode' => '',
        'rolescod' => '',
        'fncod' => '',
        'fnrolest' => 'ACT',
        'fnexp'=> '',
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
    Renderer::render("mnt/functionrol", $this->viewData);
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
            if(!isset($_GET["rolescod"])){
                $this->errorHandler();
            }
            $rolescod = intval($_GET["rolescod"]);
            $dbFunctionsRols = \Dao\Mnt\FunctionsRols::getById($rolescod);
            \Utilities\ArrUtils::mergeFullArrayTo($dbFunctionsRols, $this->viewData);
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
        $this->viewData["rolescod"] = $_POST["rolescod"];
        $this->viewData["fncod"] = $_POST["fncod"];
        $this->viewData["fnrolest"] = $_POST["fnrolest"];
        $this->viewData["fnexp"] = $_POST["fnexp"];
       //$this->viewData["datecreate"] = $_POST["datecreate"];

        return true;
    }
    private function on_update_clicked()
    {
        $updateResult=\Dao\Mnt\FunctionsRols::updateFunctionRol(
            $this->viewData["rolescod"],
            $this->viewData["fncod"],
            $this->viewData["fnrolest"] ,
            $this->viewData["fnexp"],
            $this->viewData["rolescod"]
        );
        if($updateResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-FunctionsRols",
                "Funcion Rol actualizado correctamente"
            );
        }
    }
    private function on_delete_clicked()
    {
        $deleteResult=\Dao\Mnt\FunctionsRols::deleteFunctionRol(
            $this->viewData["rolescod"]
        );
        if($deleteResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-FunctionsRols",
                "Funcion Rol eliminado correctamente"
            );
        }

    }
    private function on_insert_clicked()
    {
        $insertResult=\Dao\Mnt\FunctionsRols::addFunctionRol(
            $this->viewData["rolescod"],
            $this->viewData["fncod"],
            $this->viewData["fnrolest"],
            $this->viewData["fnexp"], 
            $this->viewData["rolescod"]
        );
        if($insertResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-FunctionsRols",
                "Funcion Rol agregado correctamente"
            );
        }
    }

    private function pre_render()
    {
        /*
        $getallU = \Dao\Mnt\Providers::getAllUserdetail();
        $this->viewData["getallU"] = $getallU;
        $this->viewData["getallU"] = \Utilities\ArrUtils::objectArrToAllUser(
            $this->viewData["getallU"],
            'iduserdetail',
            'firstname',
            'iduserdetail',
            $this->viewData["iduserdetail"]
        );
        */

        $getallF = \Dao\Mnt\FunctionsRols::getAllFncod2();
        $this->viewData["getallF"] = $getallF;
        $this->viewData["getallF"] = \Utilities\ArrUtils::objectArrToAllFunctions2(
            $this->viewData["getallF"],
            'fncod',
            'fndsc',
            'fncod',
            $this->viewData["fncod"]
        );

        $getallS = \Dao\Mnt\FunctionsRols::getAllFunctionsRols();
        $this->viewData["getallS"] = $getallS;
        $this->viewData["getallS"] = \Utilities\ArrUtils::objectArrToAllServices(
            $this->viewData["getallS"],
            'rolescod',
            'fncod',
            'rolescod',
            $this->viewData["fncod"]
        );
        
        $this->viewData["act_selected"] = $this->viewData["fnrolest"]=== "ACT";
        $this->viewData["ina_selected"] = $this->viewData["fnrolest"]=== "INA";
        if($this->viewData["mode"]!=='INS'){
            $this->viewData["mode_dsc"]=sprintf(
                $this->arrModeDsc[$this->viewData["mode"]],
                $this->viewData["fncod"],
                $this->viewData["fndsc"]
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
            "index.php?page=Mnt-FunctionsRols",
            "Modo de operación no reconocido"
        );
    }
}

?>