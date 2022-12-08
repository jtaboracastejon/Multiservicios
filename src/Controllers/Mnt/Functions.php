<?php
namespace Controllers\Mnt;

use Controllers\PublicController;
use Dao\Dao;
use Views\Renderer;

class Functions extends PublicController{

    public function run() : void
    {
        $viewData = array();
        $viewData["functions"] = \Dao\Mnt\Functions::getAllFunctions();

        Renderer::render("mnt/functions", $viewData);
    }
}


?>