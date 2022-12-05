<?php 
namespace Controllers\mnt;
use Controllers\PublicController;
use Views\Renderer;

class Promotions extends PublicController{
    public function run(): void
    {
        $viewData = array();
        $viewData["promotions"] = \Dao\Mnt\Promotions::getAllPromotions();

        Renderer::render("mnt/promotions",$viewData);
    }
}
?>