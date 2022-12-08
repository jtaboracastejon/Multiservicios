<?php
namespace Controllers\Mnt;
use Controllers\PublicController;
use DateTime;
use Views\Renderer;

class Function1 extends PublicController{

    private $arrModeDsc = array(
        'INS' => 'Nuevo Funcion',
        'UPD' => 'Actualizando Funcion',
        'DSP' => 'Detalle de Funcion',
        'DEL' => 'Eliminando Funcion'
    );

    private $viewData= array(
        'modeDsc' => '',
        'mode' => '',
        'fncod' => '',
        'fndsc' => '',
        'fnest' => 'ACT',
        'fntyp'=> 'CTR',
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
    Renderer::render("mnt/function1", $this->viewData);
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
            if(!isset($_GET["fncod"])){
                $this->errorHandler();
            }
            $fncod = ($_GET["fncod"]);
            $dbFunction = \Dao\Mnt\Functions::getById($fncod);
            \Utilities\ArrUtils::mergeFullArrayTo($dbFunction, $this->viewData);
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
        $this->viewData["fncod"] = $_POST["fncod"];
        $this->viewData["fndsc"] = $_POST["fndsc"];
        $this->viewData["fnest"] = $_POST["fnest"];
        $this->viewData["fntyp"] = $_POST["fntyp"];
       //$this->viewData["datecreate"] = $_POST["datecreate"];

        return true;
    }
    private function on_update_clicked()
    {
        $updateResult=\Dao\Mnt\Functions::updateFunction(
            $this->viewData["fncod"],
            $this->viewData["fndsc"],
            $this->viewData["fnest"] ,
            $this->viewData["fntyp"],
            $this->viewData["fncod"]
        );
        if($updateResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Functions",
                "Funciones actualizado correctamente"
            );
        }
    }
    private function on_delete_clicked()
    {
        $deleteResult=\Dao\Mnt\Functions::deleteFunction(
            $this->viewData["fncod"]
        );
        if($deleteResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Functions",
                "Funcion eliminado correctamente"
            );
        }

    }
    private function on_insert_clicked()
    {
        $insertResult=\Dao\Mnt\Functions::addFunction(
            $this->viewData["fncod"],
            $this->viewData["fndsc"],
            $this->viewData["fnest"],
            $this->viewData["fntyp"], 
            //$this->viewData["datecreate"],
            $this->viewData["fncod"]
        );
        if($insertResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Functions",
                "Funcion agregado correctamente"
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

        $getallF = \Dao\Mnt\Functions::getAllFncod();
        $this->viewData["getallF"] = $getallF;
        $this->viewData["getallF"] = \Utilities\ArrUtils::objectArrToAllFunctions(
            $this->viewData["getallF"],
            'fncod',
            'fndsc',
            'fncod',
            $this->viewData["fncod"]
        );
        


        $getallS = \Dao\Mnt\Functions::getAllFunctions();
        $this->viewData["getallS"] = $getallS;
        $this->viewData["getallS"] = \Utilities\ArrUtils::objectArrToAllServices(
            $this->viewData["getallS"],
            'fncod',
            'fndsc',
            'fncod',
            $this->viewData["fncod"]
        );

        $this->viewData["act_selected"] = $this->viewData["fnest"]=== "ACT";
        $this->viewData["ina_selected"] = $this->viewData["fnest"]=== "INA";
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
            "index.php?page=Mnt-Functions",
            "Modo de operación no reconocido"
        );
    }
}

?>