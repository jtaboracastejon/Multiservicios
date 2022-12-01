<?php
namespace Controllers\Sec;
use Controllers\PublicController;
use \Utilities\Validators;
use Exception;


class Register extends PublicController
{
    private $txtEmail = "";
    private $txtPswd = "";
    private $txtPswd2 ="";
    private $txtUser ="";
    private $cbUserType ="";
    private $pin ="";
    private $errorEmail ="";
    private $errorUser ="";
    private $errorPswd = "";
    private $errorPswd2 = "";
    private $hasErrors = false;


    public function run() :void
    {
        $this->on_loaded();
        if ($this->isPostBack()) {
            $this->process_postBack();

     };
        $this->pre_render();
       
        \Views\Renderer::render("security/sigin", $this->viewData);
    }
    private function pre_render(){
        if (isset($_SESSION["Datos"]["txtEmail"])){
            $this->txtEmail = $_SESSION["Datos"]["txtEmail"];
        }
        $this->viewData = get_object_vars($this);
        $this->viewData["txtEmail"] = $_SESSION["Datos"]["txtEmail"];

        $dbDeptos=\Dao\Security\Security::getDepartments();
        $this->viewData["dbDeptos"] = $dbDeptos;
    }
    
   private function on_loaded(){
  
    }
    private function process_postBack(){
        $this->txtPswd = $_POST["txtPswd"];
            $this->txtUser = $_POST["txtUser"];
            $this->txtPswd2 = $_POST["txtPswd2"];
            $this->txtEmail = $_SESSION["Datos"]["txtEmail"];
            $this->cbUserType = $_SESSION["Datos"]["Cbusuarios"];
            $this->cbDepartamentos = $_POST["cbDepartamentos"];
            $this->cbMunicipios = $_POST["cbMunicipios"];
            
            if ($this->txtUser==""){
                $this->errorUser = "El usuario es requerido";
                $this->hasErrors = true;
            }

            if (!Validators::IsValidPassword($this->txtPswd)) {
                $this->errorPswd = "La contraseña debe tener al menos 8 caracteres una mayúscula, un número y un caracter especial.";
                $this->hasErrors = true;
            }
            if ($this->txtPswd !== $this->txtPswd2) {
                $this->errorPswd2 = "Las contraseñas no son iguales.";
                $this->hasErrors = true;
            }
            //validacion que el email no este registrado
            $dbEmail = \Dao\Security\Security::getUsuarioByEmail($this->txtEmail);
            if ($dbEmail){
                $this->errorEmail = "Credencial ya registrada en el sistema";
                $this->hasErrors = true;
            }
            if (!$this->hasErrors) {
                if (!$this->hasErrors) {

                     try{
                         
                         if (\Dao\Security\Security::newUsuario($this->cbUserType, $this->txtEmail, $this->txtUser, $this->txtPswd))
                         {
                             $idworkzone=\Dao\Security\Security::existWorkzone($this->cbDepartamentos,$this->cbMunicipios);
                             if($idworkzone == 0){
                                 \Dao\Security\Security::insertWorkZones($this->cbDepartamentos, $this->cbMunicipios,"NODIS");
                                 $idworkzone=\Dao\Security\Security::existWorkzone($this->cbDepartamentos, $this->cbMunicipios);
                            } 
                            $lastUserCod=\Dao\Security\Security::getLastUserCod();
                    
                            \Dao\Security\Security::newUserDetails($lastUserCod,$idworkzone);
                           // \Dao\Security\Security::insertWorkZones($this->cbDepartamentos, $this->cbMunicipios,"DIS");
                             \Utilities\Site::redirectToWithMsg("index.php?page=sec_verificacion", "¡Para verificar tu cuenta entra al link enviado a tu correo!");
                         }
                     } catch (Exception $e){
                         \Utilities\Site::redirectToWithMsg("index.php?page=sec_register", "Error al registrar el usuario");
                     }
                 }
            }
    }
}

?>
