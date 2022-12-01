<?php
namespace Controllers\Sec;
use Controllers\PublicController;
use \Utilities\Validators;
use Exception;
use phpDocumentor\Reflection\Types\This;

class UserDetails extends PublicController
{
    private $txtfirstName = "";
    private $txtlastName = "";
    private $txtAddress = "";
    private $txtPhone = "";
    private $txtProfile = "";
    private $txtPortada = "";
    private $hasErrors = false;
    private $viewData=array();


    public function run() :void
    {
        $this->on_loaded();
        if ($this->isPostBack()) {
            $this->process_postBack();

     };
        $this->pre_render();
        $this->viewData = get_object_vars($this);
        \Views\Renderer::render("security/userdetails", $this->viewData);
    }
    private function pre_render(){
        }
   private function on_loaded(){
    }

    private function process_postBack(){
        $this->txtfirstName = $_POST["txtfirstName"];
        $this->txtlastName = $_POST["txtlastName"];
        $this->txtAddress = $_POST["txtAddress"];
        $this->txtPhone = $_POST["txtPhone"];
        $this->txtProfile = $_POST["txtProfile"];
       $this->txtPortada = $_POST["txtPortada"];

     //die($this->txtfirstName . $this->txtlastName . $this->txtAddress . $this->txtPhone . $this->txtProfile . $this->txtPortada);
       //validaciones
         if ($this->txtfirstName==""){
            $this->errorfirstName = "El nombre es requerido";
            $this->hasErrors = true;
    }
     
        if ($this->txtlastName==""){
            $this->errorlastName = "El apellido es requerido";
            $this->hasErrors = true;
    }
        if ($this->txtAddress==""){
            $this->errorAddress = "La dirección es requerida";
            $this->hasErrors = true;
    }
        if ($this->txtPhone==""){
            $this->errorPhone = "El teléfono es requerido";
            $this->hasErrors = true;
    }
 
    if (!$this->hasErrors) {
    try{
        $lastUserCod=\Dao\Security\Security::getLastIdUserDetails();
        \Dao\Security\Security::updateUserDetails($lastUserCod, $this->txtfirstName, $this->txtlastName, $this->txtAddress, $this->txtPhone, $this->txtProfile, $this->txtPortada);
       \Utilities\Site::redirectToWithMsg("index.php?page=login", "Usuario registrado exitosamente");
    }catch(Exception $ex){
        \Utilities\Site::redirectToWithMsg("index.php?page=prueba", "Error al registrar el usuario");
    }
    }

    }
}
?>
