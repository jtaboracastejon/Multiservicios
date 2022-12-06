<?php 
namespace Controllers\Provider;

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
        $this->viewData["imagenes"] = array(
            "1" => array(
                "img" => "https://picsum.photos/1920/1080?random=1",
            ),
            "2" => array(
                "img" => "https://picsum.photos/1920/1080?random=2",
            ),
            "3" => array(
                "img" => "https://picsum.photos/1920/1080?random=3",
            ),
            "4" => array(
                "img" => "https://picsum.photos/1920/1080?random=4",
            ),
            "5" => array(
                "img" => "https://picsum.photos/1920/1080?random=5",
            ),
            "6" => array(
                "img" => "https://picsum.photos/1920/1080?random=6",
            ),
            "7" => array(
                "img" => "https://picsum.photos/1920/1080?random=7",
            ),
            "8" => array(
                "img" => "https://picsum.photos/1920/1080?random=8",
            ),
            "9" => array(
                "img" => "https://picsum.photos/1920/1080?random=9",
            ),
            "10" => array(
                "img" => "https://picsum.photos/1920/1080?random=10",
            ),
            "11" => array(
                "img" => "https://picsum.photos/1920/1080?random=11",
            ),
            "12" => array(
                "img" => "https://picsum.photos/1920/1080?random=12",
            ),
            "13" => array(
                "img" => "https://picsum.photos/1920/1080?random=13",
            ),
            "14" => array(
                "img" => "https://picsum.photos/1920/1080?random=14",
            ),
            "15" => array(
                "img" => "https://picsum.photos/1920/1080?random=15",
            ),
            "16" => array(
                "img" => "https://picsum.photos/1920/1080?random=16",
            ),
            "17" => array(
                "img" => "https://picsum.photos/1920/1080?random=17",
            ),
            "18" => array(
                "img" => "https://picsum.photos/1920/1080?random=18",
            ),
            "19" => array(
                "img" => "https://picsum.photos/1920/1080?random=19",
            ),
        );
        $this->viewData["encoded"] = json_encode($this->viewData["imagenes"]);

        \Utilities\Site::addEndScript("src/Views/templates/provider/scripts/modal.js");
        Renderer::render("provider/provider",$this->viewData);
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
