<?php
namespace Controllers\Mnt;

use Controllers\PrivateController;
use Dao\Dao;
use Views\Renderer;

class Providers extends PrivateController{

    public function run() : void
    {
        $viewData = array();
        $viewData["providers"] = \Dao\Mnt\Providers::allUser();

        Renderer::render("mnt/providers", $viewData);
    }
}


?>