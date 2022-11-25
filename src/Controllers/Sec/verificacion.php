<?php
namespace Controllers\Sec;
use Utilities\Validators;
class Verificacion extends \Controllers\PublicController

{
    private $txtVerificacion = "";
    private $hasErrors = false;
    public function run() :void
    {

        if ($this->isPostBack()) {
            $this->txtVerificacion = $_POST["txtVerificacion"];
            //validaciones

            if (!$this->hasErrors) {
                \Utilities\Site::redirectTo("index.php?page=sec_login");

             }
    };

        $viewData = get_object_vars($this);
        \Views\Renderer::render("security/verificacion", $viewData);
    }
}

?>
