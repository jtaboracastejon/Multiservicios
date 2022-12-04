<?php

namespace Controllers\Sec;

use Controllers\PublicController;
use \Utilities\Validators;
use Exception;

class InfpUser extends PublicController
{
    private $txtNombre = "";
    private $txtDireccion = "";
    private $txtApellidos ="";
    private $txtTelefono = "";
    private $txtZona ="";
    private $hasErrors = false;
    public function run() :void
    {

        if ($this->isPostBack()) {
            $this->txtNombre = $_POST["txtNombre"];
            $this->txtApellidos = $_POST["txtApellidos"];
            $this->txtTelefono = $_POST["txtTelefono"];
            $this->txtDireccion = $_POST["txtDireccion"];
            $this->txtZona = $_POST["txtZona"];

            
            if (!$this->hasErrors) {
               /* try{
                    if (\Dao\Security\Security::newUsuario($this->cbUserType, $this->txtEmail, $this->txtUser, $this->txtPswd)) {
                        \Utilities\Site::redirectToWithMsg("index.php?page=sec_login", "¡Usuario Registrado Satisfactoriamente!");
                    }
                } catch (Exception $e){
                    \Utilities\Site::redirectToWithMsg("index.php?page=sec_register", "Error al registrar el usuario");
                }*/
            }
        }
        $viewData = get_object_vars($this);
        \Views\Renderer::render("security/info", $viewData);
    }
}
?>
