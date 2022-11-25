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
        $this->viewData = get_object_vars($this);
        $this->viewData["txtEmail"] = $_SESSION["Datos"]["txtEmail"];
        $dbDeptos= \Dao\Security\Security::getZones();
        $this->viewData["dbDeptos"]= $dbDeptos;
        $dbmunicipios= \Dao\Security\Security::getMunicipios();
        $this->viewData["dbMunicipios"]= $dbmunicipios;
    }
    private function on_loaded(){
       
    }

    private function process_postBack(){
        $this->txtPswd = $_POST["txtPswd"];
            $this->txtUser = $_POST["txtUser"];
            $this->txtPswd2 = $_POST["txtPswd2"];
            $this->txtEmail = $_SESSION["Datos"]["txtEmail"];
            $this->cbUserType = $_SESSION["Datos"]["Cbusuarios"];

            //validaciones
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
            if (!$this->hasErrors) {
                if (!$this->hasErrors) {
                     try{
                         if (\Dao\Security\Security::newUsuario($this->cbUserType, $this->txtEmail, $this->txtUser, $this->txtPswd)) {
                             \Utilities\Site::redirectToWithMsg("index.php?page=sec_verificacion", "¡Usuario Registrado Satisfactoriamente!");
                         }
                     } catch (Exception $e){
                         \Utilities\Site::redirectToWithMsg("index.php?page=sec_register", "Error al registrar el usuario");
                     }
                 }
            }
    }
}

?>
