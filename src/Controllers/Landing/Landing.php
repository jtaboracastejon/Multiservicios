<?php 
namespace Controllers\landing;

use Controllers\PublicController;
use Views\Renderer;

class Landing extends PublicController{
    private $viewData = array(
        "title" => "Landing",
    );

    public function run(): void
    {
        $this->on_form_loaded();
        if($this->isPostBack()){
            $this->process_postBack();
        }
        $this->pre_render();
        Renderer::render("landing/landing",$this->viewData);
    }

    private function on_form_loaded()
    {
        //Cards datos
        $dbCards = \Dao\Landing\Card::getCardRandom(3);
        $this->viewData["cards"] = $dbCards;
        foreach($this->viewData["cards"] as $key => $card){            
            $this->viewData["cards"][$key]["isVerified"] = \Dao\Landing\Card::isVerified($card["iduserdetail"]);
            $this->viewData["cards"][$key]["name"] = \Dao\Landing\Landing::split_name($card["firstname"], $card["lastname"]);
            $this->viewData["cards"][$key]["tiempoPlataforma"] = \Dao\Landing\Card::getTimeAgo($card["datecreate"]);
            //$this->viewData["cards"][$key]["isSuscripter"] = \Dao\Landing\Card::isSuscripter($card["iduserdetail"]);
        }

        //Obtener todos los servicios de la base de datos
        $dbServices = \Dao\Landing\Landing::getAllServices();
        $this->viewData["services"] = $dbServices;

        //Obtenemos una review random de la tabla reviews_pag
        $idRandomReview = \Dao\Landing\Landing::getReviewPage(); 
        \Utilities\ArrUtils::mergeFullArrayTo($idRandomReview, $this->viewData);

        //Obtener el nombre de la persona que hizo la review
        $this->viewData["name"] = \Dao\Landing\Landing::split_name($this->viewData["firstname"], $this->viewData["lastname"]);


    }

    private function pre_render()
    {
        
    }

    private function process_postBack()
    {
     
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
