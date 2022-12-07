<?php 
namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;

class UserDetail extends PublicController{
    private $arrModeDsc = array(
        "INS" => "Agregando nuevo registro",
        "UPD" => "Editar registro existente",
        "DEL" => "Eliminando registro",
        "DSP" => "Detalle de registro"
    );
    private $viewData = array(
        "mode" => "",
        "mode_dsc" => "",
        "iduserdetail" => "",
        "usercode" => "",
        "firstname" => "",
        "lastname" => "",
        "address" => "",
        "phonenumber" => "",
        "idworkzone" => "",
        "imgprofile" => "",
        "imgportada" => "",
        "readOnly" => false,
        "showSaveBtn" => true
        
    );

	public function run() :void{
        $this->onForm_loaded();
        if($this->isPostBack()){
            $this->process_postBack();
        }
        $this->pre_render();
        Renderer::render("mnt/userdetail", $this->viewData);
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
            if (!isset($_GET["iduserdetail"])) {
                $this->errorRedir();
            }

            $iduserdetail = intval($_GET["iduserdetail"]);
            $dbQu = \Dao\Mnt\UserDetails::getUserDetailById($iduserdetail);
            \Utilities\ArrUtils::mergeFullArrayTo($dbQu, $this->viewData);
        }

        ;
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
        $this->viewData["usercod"] = $_POST["usercod"];
        $this->viewData["firstname"] = $_POST["firstname"];
        $this->viewData["lastname"] = $_POST["lastname"];
        $this->viewData["address"] = $_POST["address"];
        $this->viewData["phonenumber"] = $_POST["phonenumber"];
        $this->viewData["idworkzone"] = $_POST["idworkzone"];
        $this->viewData["imgprofile"] = $_POST["imgprofile"];
        $this->viewData["imgportada"] = $_POST["imgportada"];
        return true;
    }

    private function on_insert_clicked()
    {
        $insertResult = \Dao\Mnt\UserDetails::AddUserDetail(
            $this->viewData["usercod"],
            $this->viewData["firstname"], 
            $this->viewData["lastname"] , 
            $this->viewData["address"], 
            $this->viewData["phonenumber"],
            $this->viewData["idworkzone"], 
            $this->viewData["imgprofile"],
            $this->viewData["imgportada"]
        );
        if($insertResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=mnt-userdetails",
                "Registro guardado Exitosamente!"
            );
        }
    }

    private function on_update_clicked()
    {
      /*   if (($_FILES['imgprofile']['name']!="")){

            //get path server                
            $target_dir = $_SERVER["DOCUMENT_ROOT"] . "/Multiservicios/public/imgs/userprofile/";
            $file = $_FILES['imgprofile']['name'];
            $path = pathinfo($file);
            $filename = $path['filename'];
            $ext = $path['extension'];
            $temp_name = $_FILES['imgprofile']['tmp_name'];
            $path_filename_ext = $target_dir.$this->viewData["firstname"].".".$ext;
         
        die($path_filename_ext);
            if (file_exists($path_filename_ext)) {
                //echo "Sorry, file already exists.";
                die("Sorry, file already exists.");
            }else{
                move_uploaded_file($temp_name,$path_filename_ext);
                //echo "Congratulations! File Uploaded Successfully.";
                die("Sorry, file already exists.");
            }

        $this->viewData["imgprofile"] = "../public/imgs/userprofile/".$this->viewData["firstname"].".".$ext;
        }
 */
        $updateResult = \Dao\Mnt\UserDetails::UpdateUserDetails(
            $this->viewData["usercod"],
            $this->viewData["firstname"], 
            $this->viewData["lastname"] , 
            $this->viewData["address"], 
            $this->viewData["phonenumber"],
            $this->viewData["idworkzone"], 
            $this->viewData["imgprofile"],
            $this->viewData["imgportada"],
            $this->viewData["iduserdetail"]
        );
        if($updateResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=mnt-userdetails",
                "Registro actualizado Exitosamente!"
            );
        }
    }

    private function on_delete_clicked()
    {
        $deleteResult = \Dao\Mnt\UserDetails::DeleteUserDetail(
            $this->viewData["iduserdetail"]
        );
        if($deleteResult){
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=mnt-userdetails",
                "Registro eliminado Exitosamente!"
            );
        }
    }

    private function pre_render()
    {

        $getWZ= \Dao\Mnt\UserDetails::getAllWorkZones();
        $this->viewData["workzones"] = $getWZ;

        $getUser= \Dao\Mnt\UserDetails::getAllUsers();
        $this->viewData["users"] = $getUser;
       
        if ($this->viewData["mode"] !== "INS") {
            $this->viewData["mode_dsc"] = sprintf(
                $this->arrModeDsc[$this->viewData["mode"]],
                $this->viewData["iduserdetail"],
                $this->viewData["firstname"]
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
            "index.php?page=mnt-userdetails",
            "Algo Inesperado sucedió!"
        );
    }
}
?>