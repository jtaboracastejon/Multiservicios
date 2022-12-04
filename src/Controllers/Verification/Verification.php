<?php 
namespace Controllers\Verification;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;

class Verification extends PrivateController{
    private $viewData = [];
    private $intUserId = 0;
    public function run() :void{
        $this->intUserId = \Utilities\Security::getUserId();
        $this->viewData["statusProcess"] = \Dao\Verification\Verified::statusProcess($this->intUserId);
        // die(var_dump($this->viewData["statusProcess"]));
        
        if ($this->isPostBack()) {
            if ($this->validate_inputs()) {
                $this->process_postback();
            }
        }
        Renderer::render("verification/verification", $this->viewData); 
    }

    private function process_postback()
    {

        //get path server   
        $userDirName= hash('md5', $this->intUserId);             
        $target_dir = $_SERVER["DOCUMENT_ROOT"] . "/Multiservicios/public/users/".$userDirName."/verificationProcess/";
        if (!is_dir($target_dir)){
            mkdir($target_dir, 0777, true);
        }

        $documentos = [
            "dniFrontal",
            "dniPosterior",
            "comprobanteDomicilio"
        ];
        foreach($documentos as $documento){
            $file = $_FILES[$documento]['name'];
            $path = pathinfo($file);
            $filename = $path['filename'];
            $newFilename= hash('md5', $filename);
            $ext = $path['extension'];
            $temp_name =  $_FILES[$documento]['tmp_name'];
            $path_filename_ext = $target_dir.$newFilename.".".$ext;
            move_uploaded_file($temp_name,$path_filename_ext);
            $this->viewData[$documento."Path"] = "../public/users/".$userDirName."/verificationProcess/".$newFilename.".".$ext;
        }

        $this->insertVerificationProcess();

    }
    private function validate_inputs()
    {
        $this->viewData["strDni"] = $_POST["txtDNI"];
        $this->viewData["strAddress"] = $_POST["txtAddress"];
        $this->viewData["strStatusProcess"] = "EN PROCESO";
        return true;
    }

    private function insertVerificationProcess()
    {

        $insertResult = \Dao\Verification\Verify::insertVerification(
            $this->intUserId, 
            $this->viewData["strDni"],
            $this->viewData["strAddress"],
            $this->viewData["strStatusProcess"]);
        if ($insertResult) {
            $lastId = \Dao\Verification\Verify::getLastId();
            $this->insertImgs($lastId);
        }
    }

    private function insertImgs($verificationId){
        $insertResult = \Dao\Verification\Verify::insertVerificationImgs(
            $verificationId, 
            $this->viewData["dniFrontalPath"],
            $this->viewData["dniPosteriorPath"],
            $this->viewData["comprobanteDomicilioPath"]);
        if ($insertResult) {
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=verification-verification",
                "Imágenes guardado exitosamente"
            );
        }
    }
}
?>