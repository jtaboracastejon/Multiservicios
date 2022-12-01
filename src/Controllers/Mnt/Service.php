<?php
namespace Controllers\Mnt;
use Controllers\PublicController;
use DateTime;
use Views\Renderer;
class Service extends PublicController{

    private $arrModeDsc = array(
        'INS' => 'Nuevo Servicio',
        'UPD' => 'Actualizando Servicio %s - %s',
        'DSP' => 'Detalle de Servicio %s - %s',
        'DEL' => 'Eliminando Servicio %s - %s'
    );

    private $viewData= array(
        'modeDsc' => '',
        'mode' => '',
        'idservice' => -1,
        'servicename' => '',
        'description' => '',
        'image_path' => '',
        'status' => 'ACT',
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
    Renderer::render("mnt/service", $this->viewData);
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
            if(!isset($_GET["idservice"])){
                $this->errorHandler();
            }
            $idservice = intval($_GET["idservice"]);
            $dbService = \Dao\Mnt\Services::getById($idservice);
            \Utilities\ArrUtils::mergeFullArrayTo($dbService, $this->viewData);

        }
    }

/*
    public function multiPhotos(){
        $imagepath=array();
        if($this->file('imagepath')){
            $allowedfileExtension = ['jpg', 'png', 'jpeg'];
            $files = $this->file('imagepath');
        
            foreach($files as $file){
                $filename= $file->
            }
        }

        

        

    }
    */


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
        $this->viewData["servicename"] = $_POST["servicename"];
        $this->viewData["description"] = $_POST["description"];
        $this->viewData["imagepath"] = $_POST["imagepath"];
        $this->viewData["status"] = $_POST["status"];

        return true;
    }
    private function on_update_clicked()
    {
        $updateResult=\Dao\Mnt\Services::updateService(
            $this->viewData["servicename"],
            $this->viewData["description"],
            $this->viewData["imagepath"] ,
            $this->viewData["status"],
            $this->viewData["idservice"]
        );
        if($updateResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Services",
                "Servicio actualizado correctamente"
            );
        }
    }
    private function on_delete_clicked()
    {
        $deleteResult=\Dao\Mnt\Services::deleteService(
            $this->viewData["idservice"]
        );
        if($deleteResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Services",
                "Servicio eliminado correctamente"
            );
        }

    }
    private function on_insert_clicked()
    {
       // $Fecha = date();
        #$nombreFoto = $imagepath != "" ? $Fecha->getTime
        /*
        if(!file_exists($_FILES['imagepath']['tmpname'])  || !is_uploaded_file($_FILES['imagen']['tmp_name']))
        {
            $imagepath =$_POST["imagepath"];
        }
        else{
            $ext = explode(".", $_FILES["imagepath"]["name"]);
            if($_FILES['imagepath']['type'] == "image/jpg"  || $_FILES['imagepath']['type'] == "image/jpeg" || $_FILES['imagepath']['type']) ==
            "image/png")
            {
                $imagepath = round(microtime(true)) . '.' . end($ext);
                move_uploaded_file($_FILES["imagepath"]["tmp_name"], "../public/imgs/"  .  $imagepath);
            }
        
        }
        */


        $insertResult=\Dao\Mnt\Services::addService(
            $this->viewData["servicename"] ,
            $this->viewData["description"] ,
            /*
            $Fecha = date(),
            $nombreFoto=($imagepath!="") ? $Fecha->getTimestamp()."_".$_FILES["imagepath"]["name"]:"imagen.jpg",
            $tmpFoto= $_FILES["imagepath"]["tmp_name"],

            if($tmpFoto=""){
                move_uploaded_file($tmpFoto, "../public/imgs/". $nombreFoto);
            }
            #die()
            */
            $this->viewData["imagepath"],
            $this->viewData["status"] 
        );
        if($insertResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Mnt-Services",
                "Servicio agregado correctamente"
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
                $this->viewData["idservice"],
                $this->viewData["description"]
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
            "index.php?page=Mnt-Services",
            "Modo de operación no reconocido"
        );
    }
}

?>