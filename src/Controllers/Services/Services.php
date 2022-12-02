<?php 
namespace Controllers\Services;
use Controllers\PublicController;
use Views\Renderer;

class Services extends PublicController{
    public function run(): void
    {
        $viewData = array();
        $viewData["servicios"] = \Dao\Landing\Landing::getAllServices();

        Renderer::render("services/services",$viewData);
    }
}
?>