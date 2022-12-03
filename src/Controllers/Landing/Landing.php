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
        
        \Utilities\Site::addEndScript("src/Views/templates/landing/scripts/modal.js");
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
     
        
    
            
        
    }
}
