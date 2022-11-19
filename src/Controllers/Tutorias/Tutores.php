<?php 
namespace Controllers\Tutorias;

use Controllers\PublicController;
use Views\Renderer;

class Tutores extends PublicController{
    public function run() :void{
        $viewData = array();
        $tutores = array();
        $tutores[] = array(
            "nombre" => "Juan Perez", 
            "img" => "urlDeUnSitio"
        );
        $tutores[] = array(
            "nombre" => "Mario Perez", 
            "img" => "urlDeUnSitio"
        );
        $viewData["totalTutores"] = count($tutores);
        $viewData["misTutores"] = $tutores;
        Renderer::render("tutorias/tutores", $viewData);
    }
}
?>