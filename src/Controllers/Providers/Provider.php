<?php 
namespace Controllers\Providers;

use Controllers\PublicController;
use Views\Renderer;

class Provider extends PublicController
{
	public function run(): void
    {
        $this->on_form_loaded();
        if($this->isPostBack()){
            $this->process_postBack();
        }
        $this->pre_render();
        Renderer::render("providers/providers",$this->viewData);
    }
    private $viewData = array(
        "idprovider" => "",
    );

    private function on_form_loaded()
    {   
        $this->viewData["idprovider"] = $_GET["idprovider"];
        $idprovider = intval($_GET["idprovider"]);
        $dbProvider =  \Dao\Providers\Providers::getProviderById($idprovider);
        \Utilities\ArrUtils::mergeFullArrayTo($dbProvider, $this->viewData);
        
          $dbCards = \Dao\Providers\Providers::getCard($idprovider);
          $this->viewData["cards"] = $dbCards;
          foreach($this->viewData["cards"] as $key => $card){            
              $this->viewData["cards"][$key]["isVerified"] = \Dao\Landing\Card::isVerified($card["iduserdetail"]);
              $this->viewData["cards"][$key]["name"] = \Dao\Landing\Landing::split_name($card["firstname"], $card["lastname"]);
              $this->viewData["cards"][$key]["tiempoPlataforma"] = \Dao\Landing\Card::getTimeAgo($card["datecreate"]);
              //$this->viewData["cards"][$key]["isSuscripter"] = \Dao\Landing\Card::isSuscripter($card["iduserdetail"]);
          }

        
        $dbReviews = \Dao\Providers\Providers::InnerReview($idprovider);
        $this->viewData["ReviewP"] = $dbReviews;

        //Obtener todos los servicios de la base de datos
        $dbServices = \Dao\Landing\Landing::getAllServices();
        $this->viewData["services"] = $dbServices;
    }

    private function pre_render()
    {
        
    }

    private function process_postBack()
    {
        
    }
}
?>