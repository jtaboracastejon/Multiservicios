<?php
namespace Controllers\Mnt;
use Controllers\PublicController;
use DateTime;
use Views\Renderer;
class Service extends PublicController{

    private $arrModeDsc = array(
        'INS' => 'Nuevo Reseña',
        'UPD' => 'Actualizando Reseña %s - %s',
        'DSP' => 'Detalle de Reseña %s - %s',
        'DEL' => 'Eliminando Reseña %s - %s'
    );

    private $viewData= array(
        'modeDsc' => '',
        'mode' => '',
        'idreviewpage' => -1,
        'iduserdetail' => -1,
        'review' => '',
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
    Renderer::render("mnt/review", $this->viewData);
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
            if(!isset($_GET["idreviewpage"])){
                $this->errorHandler();
            }
            $idreviewpage = intval($_GET["idreviewpage"]);
            $dbReview = \Dao\Mnt\Reviews::getById($idreviewpage);
            \Utilities\ArrUtils::mergeFullArrayTo($dbReview, $this->viewData);

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
        $this->viewData["title"] = $_POST["title"];
        $this->viewData["review"] = $_POST["review"];
        return true;
    }
    private function on_update_clicked()
    {
        $updateResult=\Dao\Mnt\Reviews::updateService(
            $this->viewData["iduserdetail"],
            $this->viewData["title"],
            $this->viewData["review"] ,

        );
        if($updateResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Reviews",
                "Reseña actualizado correctamente"
            );
        }
    }
    private function on_delete_clicked()
    {
        $deleteResult=\Dao\Mnt\Reviews::deleteService(
            $this->viewData["idreviewpage"]
        );
        if($deleteResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Reviews",
                "Reseña eliminado correctamente"
            );
        }

    }
    private function on_insert_clicked()
    {
        $insertResult=\Dao\Mnt\Reviews::addService(
            $this->viewData["iduserdetail"],
            $this->viewData["title"],
            $this->viewData["review"]

        );
        if($insertResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Reviews",
                "Reseña agregado correctamente"
            );
        }

    }


    private function pre_render()
    {
        $this->viewData["act_selected"] = $this->viewData["status"]=== "ACT";
        $this->viewData["ina_selected"] = $this->viewData["status"]=== "INA";
        if($this->viewData["mode"]!=='INS'){
            $this->viewData["mode_dsc"]=sprintf(
                $this->arrModeDsc[$this->viewData["mode"]],
                $this->viewData["idreviewpage"],
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
            "index.php?page=Mnt-Reviews",
            "Modo de operación no reconocido"
        );
    }
}

?>