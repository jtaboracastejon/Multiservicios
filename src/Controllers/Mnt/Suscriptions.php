<?php 
namespace Controllers\mnt;
use Controllers\PublicController;
use Views\Renderer;

class Suscriptions extends PublicController{
    public function run(): void
    {
        $viewData = array();
        $viewData["suscriptions"] = \Dao\Mnt\Suscriptions::getAllSuscriptions();

        Renderer::render("mnt/suscriptions",$viewData);
    }
}
?>