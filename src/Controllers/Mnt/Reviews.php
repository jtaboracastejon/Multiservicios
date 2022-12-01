<?php
namespace Controllers\Mnt;

use Controllers\PublicController;
use Dao\Dao;
use Views\Renderer;

class Reviews extends PublicController{

    public function run() : void
    {
        $viewData = array();
        $viewData["reviews"] = \Dao\Mnt\Reviews::getAllReviews();
        
        Renderer::render("mnt/reviews", $viewData);
    }
}


?>