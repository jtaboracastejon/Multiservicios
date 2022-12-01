<?php 

namespace Controllers\Sec;
use Controllers\PublicController;
use Views\Renderer;

class ResetPassword extends PublicController{
    private $viewData = array(
        "email" => "",
        "token" => null,
        "password" => "",
        "password2" => "",     
        "tokendb" => false,
        "showFormPassword" => false,
        "showFomrEmail" => true,
    );
        
    function run(): void {
        $this->onForm_loaded();        
        if ($this->isPostBack()) {
            $this->process_postBack();
        }
        $this->pre_render();
        Renderer::render('security/resetpassword', $this->viewData);
    }

    private function onForm_loaded(){
        if (isset($_GET["token"])) { //sec_resetpassword&token=
            $this->viewData["token"] = $_GET["token"];
            $this->viewData["tokendb"] = \Dao\Security\Security::getByToken($this->viewData["token"]);
            if (!$this->viewData["tokendb"] || $this->viewData["token"] !== $this->viewData["tokendb"]["token"]) {
                \Utilities\Site::redirectToWithMsg("index.php?page=sec_resetpassword", "Token inválido");
            }   
            else if(strtotime($this->viewData["tokendb"]["tokenexp"]) < strtotime(date('Y-m-d H:i:s'))){
                \Utilities\Site::redirectToWithMsg("index.php?page=sec_resetpassword", "Token expirado");
            }
        }
    }

    private function process_postBack()
    {
        if($this->validate_inputs()){
            $this->viewData["tokendb"] ? $this->on_submit_Password() : $this->on_submit_Email();
        }
    }

    private function pre_render()
    {

        $this->viewData["showFormPassword"] = $this->viewData["tokendb"];
        $this->viewData["showFomrEmail"] = !($this->viewData["tokendb"]);
    }

    private function validate_inputs()
    {
        if($this->viewData["tokendb"]){
            
            $this->viewData["password"] = $_POST["txtPassword"];
            $this->viewData["password2"] = $_POST["txtPassword2"];
        }
        else{
            $this->viewData["email"] = $_POST["txtEmail"];
        }
        //TO-DO: Validar la entrada de datos
        return true;
    }

    private function on_submit_Email(){
        $email = $this->viewData["email"];
        $user = \Dao\Security\Security::getUsuarioByEmail($email);
        if($user){
            $token = \Utilities\Security::generateRandomString(32);
            $user["token"] = $token;
            $user["tokenexp"] = date("Y-m-d H:i:s", strtotime("+1 hour"));
            \Dao\Security\Security::updateToken($user);
            $url = \Utilities\Site::getPublicPath() . "/index.php?page=sec_resetpassword&token=$token";
            $body = "<html>
            <body>
                <h1>Hola " . $user['username'] . " </h1>
                <p>Para restablecer su contrase&ntildea, haga click <a href='$url'>Aqui</a> </p>
            </body>
        </html>";
            \Utilities\Email::sendEmail($email, "Restablecer contraseña", $body, "multiservicios@gmail.com", "Multiservicios");
            \Utilities\Site::redirectToWithMsg("index.php?page=login", "Se ha enviado un correo con las instrucciones para restablecer su contraseña");
        }else{
            \Utilities\Site::redirectToWithMsg("index.php?page=sec_resetpassword", "El correo no existe");
        }
    }

    private function on_submit_Password(){
        $this->viewData["password"] = $_POST["txtPassword"];
        $this->viewData["password2"] = $_POST["txtPassword2"];
        if($this->viewData["password"] === $this->viewData["password2"]){
            $user = \Dao\Security\Security::getUsuarioByEmail($this->viewData["tokendb"]["useremail"]);
            $user["password"] = \Dao\Security\Security::_hashPassword($this->viewData["password"]);
            $user["tokenest"] = "USE";
            
            \Dao\Security\Security::updatePassword($user);
            \Utilities\Site::redirectToWithMsg("index.php?page=sec_login", "Se ha restablecido su contraseña");
        }else{
            \Utilities\Site::redirectToWithMsg("index.php?page=sec_resetpassword&token=" . $this->viewData["token"], "Las contraseñas no coinciden");
        }
    }
}
?>