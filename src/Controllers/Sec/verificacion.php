<?php
namespace Controllers\Sec;
use Utilities\Validators;
class Verificacion extends \Controllers\PublicController
{
    private $txtVerificacion = "";
    private $txtEmail = "";
    private $hasErrors = false;
    public function run() :void
    {
        $this->on_loaded();
        if ($this->isPostBack()) {
            $this->process_postBack();
        };
        $this->pre_render();
        \Views\Renderer::render("security/verificacion", $this->viewData);
    }
    private function pre_render(){
        if (\Utilities\Security::isLogged()) {
            $this->viewData["txtEmail"] = $_SESSION["login"]["userEmail"];
            
        }else{
             $this->viewData["txtEmail"] = $_SESSION["Datos"]["txtEmail"];
         }
         $pin = \Utilities\Security::generateRandomString(4);
         $this->pin = $pin;
         $body = "<html>
         <body>
             <h1>Hola " . $this->viewData["txtEmail"]. " </h1>
             <p>Su pin de activacion es:</p>
             <h2>" . $pin . "</h2>
         </body>
             <a>verificar cuenta<a/>
         </body>
     </html>";
     \Utilities\Email::sendEmail($this->viewData["txtEmail"], "Pin de verificación", $body, "multiservicios@gmail.com", "Multiservicios");
     \Dao\Security\Security::updatePin($this->viewData["txtEmail"], $pin);
    }
    //cuando carga el controlador
    private function on_loaded(){
    }
    //cuando se envia el formulario
    private function process_postBack(){
        $this->txtVerificacion = $_POST["txtVerificacion"];
        if ($this->txtVerificacion==""){
            $this->hasErrors = true;
        }
        if (!$this->hasErrors) {
            if (\Utilities\Security::isLogged()) {
                $this->txtEmail = $_SESSION["login"]["userEmail"];
                $dVerificacion = \Dao\Security\Security::getUsuarioByEmail($this->txtEmail);
 
                if($dVerificacion["useractcod"] === $this->txtVerificacion){
                \Dao\Security\Security::updateEmailVerified($this->txtEmail, "ITSV");
                    \Utilities\Site::redirectToWithMsg("index.php?page=about_about", "Cuenta verificada correctamente");
    
                }else if($dVerificacion["useractcod"] !== $this->txtVerificacion){
                    \Utilities\Site::redirectToWithMsg("index.php?page=about_about", "El código de verificación es incorrecto");
                    $this->hasErrors = true;
                }  
            }
                    else{ 
                        $this->txtEmail = $_SESSION["Datos"]["txtEmail"];
                    $dbVerificar = \Dao\Security\Security::getUsuarioByEmail($this->txtEmail);
                    if($dbVerificar["useractcod"]==$this->txtVerificacion){
                        \Dao\Security\Security::updateEmailVerified($this->txtEmail, "ITSV");
                        \Utilities\Site::redirectToWithMsg("index.php?page=sec_userdetails", "Cuenta verificada");
                        //actualizar el emailverificado a ITSV
                    }else{
                        \Utilities\Site::redirectToWithMsg("index.php?page=sec_verificacion", "El código de verificación es incorrecto");
                        $this->hasErrors = true;
                    }
                    
                }
                
        }
    }
}
    
?>