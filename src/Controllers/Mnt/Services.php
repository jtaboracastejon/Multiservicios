<?php
namespace Controllers\Mnt;

use Controllers\PublicController;
use Dao\Dao;
use Views\Renderer;

class Services extends PublicController{

    public function run() : void
    {
        $viewData = array();
        $viewData["services"] = \Dao\Mnt\Services::getAllServices();

        Renderer::render("mnt/services", $viewData);
    }
}


?>