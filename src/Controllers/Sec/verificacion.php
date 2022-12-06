<?php
namespace Controllers\Sec;
use Utilities\Validators;
class Verificacion extends \Controllers\PublicController
{
    private $txtVerificacion = "";
    private $txtEmail = "";
    private $hasErrors = false;
    private $viewData = array();
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
        
    }
    //cuando carga el controlador
    private function on_loaded(){
    }
    //cuando se envia el formulario
    private function process_postBack(){

        if($_POST["step"] == "enviarCorreo"){
            $this->sendCorreo();
            exit();
            return;
        }
        if($_POST["step"] == "verificar"){
            $this->verificarCodigo();
            exit();
            return;
        }
        else{
            echo "error";
            exit();
            return;
        }
        
    }

    private function verificarCodigo(){
        $this->txtVerificacion = $_POST["txtVerificacion"];

        try {
            //code...
            if (\Utilities\Security::isLogged()) {
                $this->txtEmail = $_SESSION["login"]["userEmail"];
                $dVerificacion = \Dao\Security\Security::getUsuarioByEmail($this->txtEmail);
                die(var_dump($dVerificacion));
                if(\Dao\Security\Security::verifyPassword($this->txtVerificacion, $dVerificacion["useractcod"])){
                    \Dao\Security\Security::updateEmailVerified($this->txtEmail, "ITSV");
                    echo "success";
                    exit();
                    return;
                /* if($dVerificacion["useractcod"] === $this->txtVerificacion){
                    //\Utilities\Site::redirectToWithMsg("index.php?page=about_about", "Cuenta verificada correctamente"); */
    
                }else{
                    //\Utilities\Site::redirectToWithMsg("index.php?page=about_about", "El código de verificación es incorrecto");
                    $this->hasErrors = true;
                    echo "incorrecto";
                    exit();
                    return;
                }  
            }
            else{ 
                $this->txtEmail = $_SESSION["Datos"]["txtEmail"];
                $dbVerificar = \Dao\Security\Security::getUsuarioByEmail($this->txtEmail);
                if(\Dao\Security\Security::verifyPassword($this->txtVerificacion, $dbVerificar["useractcod"])){
                    \Dao\Security\Security::updateEmailVerified($this->txtEmail, "ITSV");
                    echo "success";
                    exit();
                    return;
                /* if($dVerificacion["useractcod"] === $this->txtVerificacion){
                    //\Utilities\Site::redirectToWithMsg("index.php?page=about_about", "Cuenta verificada correctamente"); */
    
                }else{
                    //\Utilities\Site::redirectToWithMsg("index.php?page=sec_verificacion", "El código de verificación es incorrecto");
                    $this->hasErrors = true;
                    echo "incorrecto";
                    exit();
                    return;
                }                    
            }
                

        
        } catch (\Throwable $th) {
            echo "error";
            exit();
            return;
        }
        
    }

    private function sendCorreo(){
        if (\Utilities\Security::isLogged()) {
            $this->viewData["txtEmail"] = $_SESSION["login"]["userEmail"];
            
        }else{
             $this->viewData["txtEmail"] = $_SESSION["Datos"]["txtEmail"];
         }

         $pin = \Utilities\Security::generateRandomString(4);
         $this->pin = $pin;
         $hashedPin = \Dao\Security\Security::_hashPassword($pin);
         $body = "
         <html>
            <body>
                <h1>Hola " . $this->viewData["txtEmail"]. " </h1>
                <p>Su pin de activacion es:</p>
                <h2>" . $pin . "</h2>
            </body>
                <a>verificar cuenta<a/>
            </body>
        </html>";
        \Utilities\Email::sendEmail($this->viewData["txtEmail"], "Pin de verificación", $body, "multiservicios@gmail.com", "Multiservicios");
        \Dao\Security\Security::updatePin($this->viewData["txtEmail"], $hashedPin);
        echo "success";
        exit();
        return;
    }
}
    
?>