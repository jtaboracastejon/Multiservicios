<?php
namespace Controllers\Mnt;

use Controllers\PublicController;
use Dao\Dao;
use Views\Renderer;

class Providers extends PublicController{

    public function run() : void
    {
        $viewData = array();
        $viewData["providers"] = \Dao\Mnt\Providers::allUser();

        Renderer::render("mnt/providers", $viewData);
    }
}


?>