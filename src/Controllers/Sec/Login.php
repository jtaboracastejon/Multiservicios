<?php
namespace Controllers\Sec;
class Login extends \Controllers\PublicController
{
    private $txtEmail = "";
    private $txtPswd = "";
    private $errorEmail = "";
    private $errorPswd = "";
    private $generalError = "";
    private $hasError = false;

    public function run() :void
    {
        if ($this->isPostBack()) {
            if(isset($_POST["btnLogin"])){
                $this->viewData["emailUser"] = $_POST["txtEmail"];
                $this->viewData["pswdUser"] = $_POST["txtPswd"];
    
                    if ($dbUser = \Dao\Security\Security::getUsuarioByEmail($this->viewData["emailUser"])) {
                        if ($dbUser["userest"] != \Dao\Security\Estados::ACTIVO) {
                            /* $this->generalError = "¡Credenciales son incorrectas!";
                            $this->hasError = true; */
                            echo "error";
                            error_log(
                                sprintf(
                                    "ERROR: %d %s tiene cuenta con estado %s",
                                    $dbUser["usercod"],
                                    $dbUser["useremail"],
                                    $dbUser["userest"]
                                )
                            );
                            exit();
                        }
                        if (!\Dao\Security\Security::verifyPassword($this->viewData["pswdUser"], $dbUser["userpswd"])) {
                            /* $this->generalError = "¡Credenciales son incorrectas!";
                            $this->hasError = true; */
                            echo "error";
                            
                            error_log(
                                sprintf(
                                    "ERROR: %d %s contraseña incorrecta",
                                    $dbUser["usercod"],
                                    $dbUser["useremail"]
                                )
                            );
                            exit();
                        }
                        
                            $dbUser["emailverified"] == "ITSV" ? $dbUser["emailverified"]= TRUE :$dbUser["emailverified"]= FALSE;
    
                            \Utilities\Security::login(
                                $dbUser["usercod"],
                                $dbUser["username"],
                                $dbUser["useremail"],
                                $dbUser["emailverified"]
                                
                            );
                            //die(var_dump($dbUser));
                            
                            if (\Utilities\Context::getContextByKey("redirto") !== "") {
                                \Utilities\Site::redirectTo(
                                    \Utilities\Context::getContextByKey("redirto")
                                );
                            }
                            else  if (!$dbUser["emailverified"]){
                                //mensaje de vista
                                /* \Utilities\Site::redirectToWithMsg(
                                    "index.php",
                                    "Bienvenido, recuerda verificar tu cuenta!"
                                ); */
                                echo "sinVerificarCorreo";
                                exit();
                                            
                            }else {
    
                                //\Utilities\Site::redirectToWithMsg("index.php?page=landing_landing", "¡Bienvenido!");
                                echo "success";
                                exit();
                            }    
                        
                    } else {
                        error_log(
                            sprintf(
                                "ERROR: %s trato de ingresar",
                                $this->viewData["emailUser"]
                            )
                        );
                        $this->generalError = "¡Credenciales son incorrectas!";
                        echo "error";
                    }
                        exit();
                }
        }
    }
}
?>
