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

            if (!(Validators::IsValidEmail($this->txtEmail))) {
                $this->errorEmail = "El correo no tiene el formato adecuado";
                $this->hasErrors = true;
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
                \Utilities\Site::redirectTo("index.php?page=sec_register");

             }
    };

        $viewData = get_object_vars($this);
        \Views\Renderer::render("security/prueba", $viewData);
    }
}

?>
