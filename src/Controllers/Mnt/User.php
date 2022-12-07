<?php
namespace Controllers\Mnt;
use Controllers\PublicController;
use DateTime;
use Views\Renderer;
class User extends PublicController{

    private $arrModeDsc = array(
        'INS' => 'Nuevo Usuario',
        'UPD' => 'Actualizando Usuario %s - %s',
        'DSP' => 'Detalle de Usuario %s - %s',
        'DEL' => 'Eliminando Usuario %s - %s'
    );

    private $viewData= array(
        'modeDsc' => '',
        'mode' => '',
        'usercod' => -1,
        'useremail' => '',
        'username' => '',
        'userest' => '',
        'usertipo' => '',
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
    Renderer::render("mnt/user", $this->viewData);
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
            if(!isset($_GET["usercod"])){
                $this->errorHandler();
            }
            $usercod = intval($_GET["usercod"]);
            $dbUser = \Dao\Mnt\Users::getById($usercod);
            \Utilities\ArrUtils::mergeFullArrayTo($dbUser, $this->viewData);

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
        $this->viewData["useremail"] = $_POST["useremail"];
        $this->viewData["username"] = $_POST["username"];
        $this->viewData["userest"] = $_POST["userest"];
        $this->viewData["usertipo"] = $_POST["usertipo"];

        return true;
    }
    private function on_update_clicked()
    {
        $updateResult=\Dao\Mnt\Users::updateUser(
            $this->viewData["useremail"],
            $this->viewData["username"],
            $this->viewData["userest"] ,
            $this->viewData["usertipo"],
            $this->viewData["usercod"]
        );
        if($updateResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Users",
                "Usuario actualizado correctamente"
            );
        }
    }
    private function on_delete_clicked()
    {
        $deleteResult=\Dao\Mnt\Users::deleteUser(
            $this->viewData["usercod"]
        );
        if($deleteResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Users",
                "Usuario eliminado correctamente"
            );
        }

    }
    private function on_insert_clicked()
    {


        $insertResult=\Dao\Mnt\Users::addUser(
            $this->viewData["useremail"] ,
            $this->viewData["username"] ,
            $this->viewData["userest"],
            $this->viewData["usertipo"]
        );
        if($insertResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Users",
                "Usuario agregado correctamente"
            );
        }

    }


    private function pre_render()
    {
        
        $this->viewData["act_selected"] = $this->viewData["userest"]=== "ACT";
        $this->viewData["ina_selected"] = $this->viewData["userest"]=== "INA";
        if($this->viewData["mode"]!=='INS'){
            $this->viewData["mode_dsc"]=sprintf(
                $this->arrModeDsc[$this->viewData["mode"]],
                $this->viewData["usercod"],
                $this->viewData["useremail"]
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
            "index.php?page=Mnt-Users",
            "Modo de operación no reconocido"
        );
    }
}

?>