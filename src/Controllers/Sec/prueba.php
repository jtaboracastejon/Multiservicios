<?php
namespace Controllers\Sec;
use Utilities\Validators;
class prueba extends \Controllers\PublicController

{
    private $txtEmail = "";
    private $Cbusuarios = "";
    private $hasErrors = false;
    private $errorEmailE = "";
    public function run() :void

    {

        if ($this->isPostBack()) {
            $this->txtEmail = $_POST["txtEmail"];
            $this->Cbusuarios = $_POST["Cbusuarios"];

            if(\Dao\Security\Security::getUsuarioByEmail($this->txtEmail)){
                //$this->errorEmailE = "El correo ya existe";
                $this->hasErrors = true; 
                echo "exist";
                exit();
            }

            if (!$this->hasErrors) {
                if(isset($_SESSION["Datos"])){
                    $arrayDatos = $_SESSION["Datos"];
                }
                $arrayDatos = array(
                    "txtEmail" => $this->txtEmail,
                    "Cbusuarios" => $this->Cbusuarios
                );
                $_SESSION["Datos"] = $arrayDatos;
                echo "success";
                exit();
             }
    };

        /* $viewData = get_object_vars($this);
        \Views\Renderer::render("security/prueba", $viewData); */
    }
}

?>
